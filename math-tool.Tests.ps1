Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Describe 'Get-Fibonacci' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'math-tool.ps1')
    }

    It 'returns 0 for N=0' {
        Get-Fibonacci -N 0 | Should -Be 0
    }

    It 'returns 1 for N=1' {
        Get-Fibonacci -N 1 | Should -Be 1
    }

    It 'returns 5 for N=5' {
        Get-Fibonacci -N 5 | Should -Be 5
    }

    It 'emits a single numeric value with no extra success-stream output' {
        $records = @(Get-Fibonacci -N 5)

        $records | Should -HaveCount 1
        $records[0].GetType().Name | Should -Be 'Int64'
        $records[0] | Should -Be 5
    }
}

Describe 'math-tool CLI' {
    BeforeAll {
        $command = Get-Command pwsh -ErrorAction SilentlyContinue
        if (-not $command) {
            throw 'pwsh executable not found; isolated CLI tests require pwsh.'
        }
    }

    It 'writes one expected line for N=<n>' -TestCases @(
        @{ N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ N = 5; Expected = 'Fibonacci(5) = 5' }
    ) {
        param($N, $Expected)

        $targetScriptPath = Join-Path $PSScriptRoot 'math-tool.ps1'
        $stdoutFile = New-TemporaryFile
        $stderrFile = New-TemporaryFile

        try {
            $process = Start-Process `
                -FilePath (Get-Command pwsh).Source `
                -ArgumentList @('-NoLogo', '-NoProfile', '-File', $targetScriptPath, '-N', [string]$N) `
                -RedirectStandardOutput $stdoutFile `
                -RedirectStandardError $stderrFile `
                -Wait `
                -PassThru

            $stdout = Get-Content -Path $stdoutFile -Raw
            $stderr = Get-Content -Path $stderrFile -Raw
        }
        finally {
            Remove-Item -LiteralPath $stdoutFile, $stderrFile -Force
        }

        $stdoutLines = @($stdout -split "`r?`n" | Where-Object { $_ -ne '' })

        $process.ExitCode | Should -Be 0
        $stderr | Should -BeNullOrEmpty
        $stdoutLines | Should -HaveCount 1
        $stdoutLines[0] | Should -Be $Expected
    }
}
