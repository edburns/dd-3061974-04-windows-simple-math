[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

$repo = 'edburns/dd-3061974-04-windows-simple-math'
$parentIssue = 1
$logDirectory = 'C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028'
$bodyVerifier = 'C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1'
$selectedIssueType = ''
$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'
$resultPath = Join-Path $logDirectory 'stage-20-result.json'
$linkInputPath = Join-Path $logDirectory 'link-input.json'

$specifications = @(
    [pscustomobject]@{
        subsection = '1. Implement Fibonacci with unit and isolated CLI coverage'
        title = '1. Implement Fibonacci with unit and isolated CLI coverage'
        bodyFile = Join-Path $logDirectory 'issue-bodies\01-1-implement-fibonacci-body.md'
        relativeBodyFile = 'issue-bodies\01-1-implement-fibonacci-body.md'
    },
    [pscustomobject]@{
        subsection = '2. Add factorial and operation dispatch'
        title = '2. Add factorial and operation dispatch'
        bodyFile = Join-Path $logDirectory 'issue-bodies\02-2-add-factorial-dispatch-body.md'
        relativeBodyFile = 'issue-bodies\02-2-add-factorial-dispatch-body.md'
    }
)

function Write-AtomicJson {
    param(
        [Parameter(Mandatory)]
        [string]$Path,

        [Parameter(Mandatory)]
        [AllowEmptyCollection()]
        [object]$Value
    )

    $temporaryPath = "$Path.tmp"
    $json = ConvertTo-Json -InputObject $Value -Depth 10
    [IO.File]::WriteAllText($temporaryPath, "$json`n", [Text.UTF8Encoding]::new($false))
    Move-Item -LiteralPath $temporaryPath -Destination $Path -Force
}

function Read-CreationLedger {
    $parsed = [IO.File]::ReadAllText($ledgerPath) |
        ConvertFrom-Json -NoEnumerate
    if ($parsed -isnot [System.Array]) {
        throw 'Creation ledger JSON root must be an array.'
    }

    $ledger = [object[]]$parsed
    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {
        throw 'Creation ledger must not contain nested array entries.'
    }
    return $ledger
}

function Write-CreationLedger {
    param([AllowEmptyCollection()][object[]]$Ledger)
    Write-AtomicJson -Path $ledgerPath -Value ([object[]]$Ledger)
}

function Get-NormalizedChildren {
    $childrenOutput = & gh api "repos/$repo/issues/$parentIssue/sub_issues" --paginate --slurp 2>&1
    $childrenExitCode = $LASTEXITCODE
    if ($childrenExitCode -ne 0) {
        throw "Unable to query parent children: $($childrenOutput | Out-String)"
    }

    $normalizedOutput = ($childrenOutput | Out-String) |
        jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'
    $normalizationExitCode = $LASTEXITCODE
    if ($normalizationExitCode -ne 0) {
        throw "Unable to normalize parent children: $($normalizedOutput | Out-String)"
    }

    $parsed = ($normalizedOutput | Out-String) | ConvertFrom-Json -NoEnumerate
    if ($parsed -isnot [System.Array]) {
        throw 'Normalized parent children JSON root must be an array.'
    }
    return [object[]]$parsed
}

function Set-LedgerProperty {
    param(
        [Parameter(Mandatory)]
        [long]$IssueId,

        [Parameter(Mandatory)]
        [string]$Property,

        [Parameter(Mandatory)]
        [bool]$Value
    )

    $ledger = @(Read-CreationLedger)
    $entry = @($ledger | Where-Object { [long]$_.id -eq $IssueId })
    if ($entry.Count -ne 1) {
        throw "Expected one ledger entry for issue ID $IssueId; found $($entry.Count)."
    }
    $entry[0].$Property = $Value
    Write-CreationLedger -Ledger $ledger
}

function Write-StageResult {
    param(
        [Parameter(Mandatory)]
        [ValidateSet('in_progress', 'complete', 'failed')]
        [string]$Status,

        [AllowNull()]
        [string]$OperationError
    )

    Write-AtomicJson -Path $resultPath -Value ([ordered]@{
        schemaVersion = 1
        status = $Status
        ledgerFile = 'creation-ledger.json'
        operationError = $OperationError
    })
}

$failedOperation = 'initialization'

try {
    $baselineChildren = @(Get-NormalizedChildren)

    Write-CreationLedger -Ledger ([object[]]@())
    Write-StageResult -Status 'in_progress' -OperationError $null

    foreach ($specification in $specifications) {
        $failedOperation = "create issue for $($specification.subsection)"
        $createArguments = @(
            'api',
            "repos/$repo/issues",
            '-X', 'POST',
            '-f', "title=$($specification.title)",
            '-F', "body=@$($specification.bodyFile)",
            '--jq', '{id,number,node_id,html_url,title}'
        )
        if (-not [string]::IsNullOrEmpty($selectedIssueType)) {
            $createArguments = @(
                'api',
                "repos/$repo/issues",
                '-X', 'POST',
                '-f', "title=$($specification.title)",
                '-F', "body=@$($specification.bodyFile)",
                '-f', "type=$selectedIssueType",
                '--jq', '{id,number,node_id,html_url,title}'
            )
        }

        $createOutput = & gh @createArguments 2>&1
        $createExitCode = $LASTEXITCODE
        if ($createExitCode -ne 0) {
            throw "Issue creation failed: $($createOutput | Out-String)"
        }
        $createdIssue = ($createOutput | Out-String) | ConvertFrom-Json

        $ledger = @(Read-CreationLedger)
        $ledger += [pscustomobject][ordered]@{
            implementationSubsection = $specification.subsection
            bodyFile = $specification.relativeBodyFile
            id = [long]$createdIssue.id
            number = [int]$createdIssue.number
            title = [string]$createdIssue.title
            url = [string]$createdIssue.html_url
            body_verified = $false
            linked = $false
        }
        Write-CreationLedger -Ledger $ledger

        $failedOperation = "verify body for issue #$($createdIssue.number)"
        $null = & $bodyVerifier `
            -Repository $repo `
            -IssueNumber ([int]$createdIssue.number) `
            -ExpectedBodyPath $specification.bodyFile `
            -MaxAttempts 6 `
            -DelaySeconds 5 `
            -DiagnosticPath (Join-Path $logDirectory "issue-$($createdIssue.number)-body-verification-failure.json")
        Set-LedgerProperty -IssueId ([long]$createdIssue.id) -Property 'body_verified' -Value $true

        $failedOperation = "link issue #$($createdIssue.number) to parent #$parentIssue"
        [IO.File]::WriteAllText(
            $linkInputPath,
            "{`"sub_issue_id`": $([long]$createdIssue.id)}`n",
            [Text.UTF8Encoding]::new($false)
        )
        $linkSucceeded = $false
        $lastLinkError = ''
        for ($attempt = 1; $attempt -le 3; $attempt++) {
            $linkOutput = & gh api "repos/$repo/issues/$parentIssue/sub_issues" -X POST --input $linkInputPath 2>&1
            $linkExitCode = $LASTEXITCODE
            if ($linkExitCode -eq 0) {
                $linkSucceeded = $true
                break
            }
            $lastLinkError = $linkOutput | Out-String
            if ($attempt -lt 3) {
                Start-Sleep -Seconds 2
            }
        }
        if (-not $linkSucceeded) {
            throw "Issue linking failed after 3 attempts: $lastLinkError"
        }
        Remove-Item -LiteralPath $linkInputPath -Force
        Set-LedgerProperty -IssueId ([long]$createdIssue.id) -Property 'linked' -Value $true
    }

    $failedOperation = 'verify final parent-child count and order'
    $finalChildren = @(Get-NormalizedChildren)
    $ledger = @(Read-CreationLedger)
    if ($finalChildren.Count -ne ($baselineChildren.Count + $ledger.Count)) {
        throw "Parent child count is $($finalChildren.Count); expected $($baselineChildren.Count + $ledger.Count)."
    }

    foreach ($entry in $ledger) {
        $occurrences = @($finalChildren | Where-Object { [long]$_.id -eq [long]$entry.id }).Count
        if ($occurrences -ne 1) {
            throw "Issue #$($entry.number) is linked $occurrences times; expected exactly once."
        }
    }

    $baselineIds = @($baselineChildren | ForEach-Object { [long]$_.id })
    $newChildren = @($finalChildren | Where-Object { [long]$_.id -notin $baselineIds })
    $expectedIds = @($ledger | ForEach-Object { [long]$_.id })
    $actualIds = @($newChildren | ForEach-Object { [long]$_.id })
    if (($actualIds -join ',') -cne ($expectedIds -join ',')) {
        throw "New child order '$($actualIds -join ',')' does not match ledger order '$($expectedIds -join ',')'."
    }

    foreach ($entry in $ledger) {
        $failedOperation = "verify final postconditions for issue #$($entry.number)"
        $bodyPath = Join-Path $logDirectory ([string]$entry.bodyFile)
        $issue = & $bodyVerifier `
            -Repository $repo `
            -IssueNumber ([int]$entry.number) `
            -ExpectedBodyPath $bodyPath `
            -MaxAttempts 6 `
            -DelaySeconds 5 `
            -DiagnosticPath (Join-Path $logDirectory "issue-$($entry.number)-body-verification-failure.json")
        if ([string]$issue.state -ne 'open') {
            throw "Issue #$($entry.number) is not open."
        }
        if (@($issue.assignees).Count -ne 0) {
            throw "Issue #$($entry.number) is assigned; expected no assignees."
        }
        if (-not [string]::IsNullOrEmpty($selectedIssueType) -and
            [string]$issue.type.name -cne $selectedIssueType) {
            throw "Issue #$($entry.number) does not have issue type $selectedIssueType."
        }
    }

    Write-StageResult -Status 'complete' -OperationError $null
    [pscustomobject]@{
        status = 'complete'
        selectedIssueType = $selectedIssueType
        baselineChildCount = $baselineChildren.Count
        finalChildCount = $finalChildren.Count
        ledger = @(Read-CreationLedger)
    } | ConvertTo-Json -Depth 10
}
catch {
    $operationError = "$failedOperation`: $($_.Exception.Message)"
    try {
        $serverChildren = @(Get-NormalizedChildren)
        $serverIds = @($serverChildren | ForEach-Object { [long]$_.id })
        $ledger = @(Read-CreationLedger)
        foreach ($entry in $ledger) {
            $entry.linked = ([long]$entry.id -in $serverIds)
        }
        Write-CreationLedger -Ledger $ledger
    }
    catch {
        $operationError += " Reconciliation failed: $($_.Exception.Message)"
        $ledger = if (Test-Path -LiteralPath $ledgerPath) { @(Read-CreationLedger) } else { @() }
    }

    Write-StageResult -Status 'failed' -OperationError $operationError
    [pscustomobject]@{
        status = 'failed'
        operationError = $operationError
        ledger = $ledger
        cleanupCommands = @(
            $ledger | ForEach-Object {
                "gh issue delete $($_.number) --repo `"$repo`" --yes"
            }
        )
    } | ConvertTo-Json -Depth 10
    exit 1
}
finally {
    if (Test-Path -LiteralPath $linkInputPath -PathType Leaf) {
        Remove-Item -LiteralPath $linkInputPath -Force
    }
}
