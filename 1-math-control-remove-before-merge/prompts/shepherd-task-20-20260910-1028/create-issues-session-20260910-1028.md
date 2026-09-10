# Copilot CLI Session

> [!NOTE]
> - **Session ID:** `75a6ee1b-d86b-4d77-9cea-c8942aa14091`  
> - **Started:** 9/10/2026, 10:28:24 AM  
> - **Duration:** 3m 31s  
> - **Exported:** 9/10/2026, 10:31:56 AM  

---

<sub>4s</sub>

### User

Invoke skill `shepherd-task-20-create-issues-from-plan` with these inputs:

- CAMPAIGN_ID: fb7a1a66-a5de-43de-9206-194ee2a0e062
- LESSON_PROPAGATION: off
- REPO: edburns/dd-3061974-04-windows-simple-math
- BASE_BRANCH: experiment/shepherd-control
- PARENT_ISSUE: 1
- PLAN_DIRECTORY: 1-math-control-remove-before-merge
- PLAN_FILE_NAME: math-tool-ignorance-reduction-plan.md
- QUESTIONS_SECTION: ## Ignorance reduction
- IMPLEMENTATION_SECTION: ## Implementation
- EXPECTED_TASK_COUNT: 2
- BASE_REMOTE: origin
- LOG_DIRECTORY: C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028
- DRAFT_VALIDATOR: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1
- ISSUE_BODY_VERIFIER: C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1

Fixture pagination response contract (mandatory):

- `gh api ... --paginate --slurp` returns a JSON array of page payloads, so a
  one-page response has the shape `[[{...}]]`, not `[{...}]`.
- Before indexing child issue fields such as `.id`, normalize the response to
  one flat issue array exactly once.
- In Bash, use:
  `jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'`.
- In PowerShell, capture the `gh` output and `$LASTEXITCODE` first, then pass
  the complete JSON through the same `jq` normalization before
  `ConvertFrom-Json`.
- Use the normalized flat array for the pre-creation baseline, final child
  count/order checks, and failure reconciliation. Do not apply `add` a second
  time to an already-flat array.


---

<sub>8s</sub>

### `skill`

**shepherd-task-20-create-issues-from-plan**

<details>
<summary>Arguments</summary>

```json
{
  "skill": "shepherd-task-20-create-issues-from-plan"
}
```

</details>

```
Skill "shepherd-task-20-create-issues-from-plan" loaded successfully. Follow the instructions in the skill context.
```


---

<sub>12s</sub>

### Copilot

I’m validating the campaign inputs, plan structure, repository state, and required issue-writing conventions before any GitHub mutation.

---

<sub>28s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\01-1682-java-tool-ergonomics.md

<details>
<summary>15 lines</summary>

```
# Example 01: 1682-java-tool-ergonomics-prompts-remove-before-merge

Read `copilot-sdk/1682-java-tool-ergonomics-prompts-remove-before-merge/dd-3018003-ignorance-reduction-for-implementation-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 3 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating issues of type **Task** as children of Epic https://github.com/github/copilot-sdk/issues/1682 . These issues correspond to the sub-sections in `## Phase 4 — Implementation (the build order)`.

I want you to use `gh` to create issues as sub-issues of 1682.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Set the type to **Task**.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `upstream`: `edburns/1682-java-tool-ergonomics`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `1682-java-tool-ergonomics-prompts-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>27s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\02-1810-java-tool-as-lambda.md

<details>
<summary>12 lines</summary>

```
# Example 02: 1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge

Carefully read the plan `copilot-sdk/1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`.

We have completed Phases 1 - 3. We are now on Phase 4.

For each sub item in Phase 4, file a child issue of Feature #1810.

Use `gh` to look at Epic #1682 and its child issues for the standard of verbosity and concreteness for issue descriptions.

The issue should be assignable to a coding agent and there must be sufficient detail in the description for the agent to proceed to completion.

Pull out the specific relevant content from Phase 3 as it applies to this current issue in Phase 4.

Tell the agent to take `edburns/1810-java-tool-ergonomics-tool-as-lambda` as the base branch. When I assign the issue to the coding agent, I will set this as the base branch.

Tell the agent to read `1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`, which is present on the branch, for context.

Tell the agent which sub-item within Phase 4 they are solving.

Tell the agent that each issue will be assigned, resolved and merged to the base branch in the order in which they appear in the plan.

No work is to start until I assign each issue to the coding agent, in turn.
```

</details>


---

<sub>27s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\03-dd-3017826-java-real-estate-demo.md

<details>
<summary>14 lines</summary>

```
# Example 03: dd-3017826-java-real-estate-demo-remove-before-merge

Read `dd-3017826-java-real-estate-demo-remove-before-merge\dd-3017826-java-real-estate-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/2 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #2.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/2-build-out-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `dd-3017826-java-real-estate-demo-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>26s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md.**

C:\Users\edburns\.copilot\skills\shepherd-task-20-create-issues-from-plan\examples\04-28-python-agent-demo.md

<details>
<summary>16 lines</summary>

```
# Example 04: 28-python-agent-demo-remove-before-merge

Read `28-python-agent-demo-remove-before-merge/28-python-agent-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`. These pertain to the implementation tasks in Phase 3. ✅✅✅ Make sure to put into the description explicit instructions on how to access the relevant spike research.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/28 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #28

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Again, ✅✅For each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`, include the relevant Resolution values in the issue description. These pertain to the implementation tasks in Phase 3. ✅✅✅ Make sure to put into the description explicit instructions on how to access the relevant spike research for that task.

- For tasks dealing with the UI, make sure to refer to the relevant screengrabs, but only ones within `28-python-agent-demo-remove-before-merge/`.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/28-python-agent-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `28-python-agent-demo-remove-before-merge/`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>25s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\math-tool-ignorance-reduction-plan.md.**

C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\math-tool-ignorance-reduction-plan.md

<details>
<summary>38 lines</summary>

```
# PowerShell math-tool control campaign

Build the fixture in two cheap, serial tasks. The repository already contains
deterministic CI pinned to Pester 5.7.1. The acceptance command for every task
is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. Task 2 starts only after task 1 is merged.

## Ignorance reduction

### Repository-owned validation

**Question:** What command and environment define acceptance?

**Resolution:** The committed canonical command is
`pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The baseline workflow
`.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester
5.7.1 and invokes that repository-owned runner. Do not replace or bypass it.

### Output and ordering contracts

**Question:** What externally observable behavior and dependency order are required?

**Resolution:** Direct CLI execution writes exactly one result line to stdout:
`Fibonacci(N) = value` or `Factorial(N) = value`. Functions return the
numeric value without incidental output. Inputs are non-negative integers.
Implementation is serial: task 2 depends on merged task 1. The implementation
and test files are repository-root `math-tool.ps1` and
`math-tool.Tests.ps1`.

## Implementation

### 1. Implement Fibonacci with unit and isolated CLI coverage

Create `math-tool.ps1` with parameter `N` and a pure `Get-Fibonacci`
function. Direct execution must print exactly `Fibonacci(N) = value`.
Create `math-tool.Tests.ps1` containing dot-sourced unit tests for the
function and isolated child-`pwsh` process tests for direct CLI behavior.
Cover N=0, N=1, and a small representative value. Keep changes limited to the
math tool and its tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero and the pinned pull-request CI
passes.

### 2. Add factorial and operation dispatch

After task 1 is merged, extend the same script with a pure `Get-Factorial`
function and an `Operation` parameter that dispatches between `fibonacci`
and `factorial` while retaining `N`. Preserve Fibonacci behavior. Cover
factorial edge cases 0 and 1 plus a small representative value. Keep the
interface and tests objective and small; the issue does not prescribe how to
extend the tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined regression suite
and the pinned pull-request CI passes.
```

</details>


---

<sub>26s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\shepherd-campaign.json.**

C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\shepherd-campaign.json

<details>
<summary>16 lines</summary>

```
{
  "schemaVersion": 1,
  "campaignId": "fb7a1a66-a5de-43de-9206-194ee2a0e062",
  "campaignIssueNumber": 1,
  "campaignShortname": "math-control",
  "repository": "edburns/dd-3061974-04-windows-simple-math",
  "baseBranch": "experiment/shepherd-control",
  "lessonPropagation": "off",
  "campaignMetadataDirectory": "1-math-control-remove-before-merge",
  "lessonsFile": "campaign-lessons.md",
  "createdBy": {
    "shepherdTaskVersion": "1.0.2",
    "stageOutcomeProtocolVersion": 1
  },
  "createdAt": "2026-09-10T17:28:18Z"
}
```

</details>


---

<sub>26s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\campaign-lessons.md.**

C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\campaign-lessons.md

<details>
<summary>5 lines</summary>

```
# Campaign lessons

This file contains validated, reusable lessons for subsequent issues in this campaign.
The issue specification and repository instructions remain authoritative.

## Validated lessons

No validated lessons have been recorded yet.
```

</details>


---

<sub>28s</sub>

### `powershell`

**Validate local campaign inputs and git state**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $log='C:\\Users\\edburns\\workareas\\dd-3061974-04-windows-simple-math-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260910-1028'; [pscustomobject]@{ LogExists=(Test-Path -LiteralPath $log -PathType Container); DraftValidatorExists=(Test-Path -LiteralPath 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1' -PathType Leaf); BodyVerifierExists=(Test-Path -LiteralPath 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1' -PathType Leaf); Jq=(Get-Command jq -ErrorAction SilentlyContinue).Source } | ConvertTo-Json -Compress; git status --short; git remote -v; git branch --list 'experiment/shepherd-control'; git show 'experiment/shepherd-control:1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md' | Out-Null; if ($LASTEXITCODE -ne 0) { throw 'Unable to read plan from base branch' }; git show 'experiment/shepherd-control:1-math-control-remove-before-merge/shepherd-campaign.json'; if ($LASTEXITCODE -ne 0) { throw 'Unable to read campaign manifest from base branch' }; git cat-file -e 'experiment/shepherd-control:1-math-control-remove-before-merge/campaign-lessons.md'; if ($LASTEXITCODE -ne 0) { throw 'campaign-lessons.md missing from base branch' }",
  "description": "Validate local campaign inputs and git state",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

<details>
<summary>22 lines</summary>

```
{"LogExists":true,"DraftValidatorExists":true,"BodyVerifierExists":true,"Jq":"C:\\Users\\edburns\\AppData\\Local\\Microsoft\\WinGet\\Packages\\jqlang.jq_Microsoft.Winget.Source_8wekyb3d8bbwe\\jq.exe"}
?? 1-math-control-remove-before-merge/prompts/
origin	git@github.com:edburns/dd-3061974-04-windows-simple-math.git (fetch)
origin	git@github.com:edburns/dd-3061974-04-windows-simple-math.git (push)
* experiment/shepherd-control
{
  "schemaVersion": 1,
  "campaignId": "fb7a1a66-a5de-43de-9206-194ee2a0e062",
  "campaignIssueNumber": 1,
  "campaignShortname": "math-control",
  "repository": "edburns/dd-3061974-04-windows-simple-math",
  "baseBranch": "experiment/shepherd-control",
  "lessonPropagation": "off",
  "campaignMetadataDirectory": "1-math-control-remove-before-merge",
  "lessonsFile": "campaign-lessons.md",
  "createdBy": {
    "shepherdTaskVersion": "1.0.2",
    "stageOutcomeProtocolVersion": 1
  },
  "createdAt": "2026-09-10T17:28:18Z"
}
<shellId: 0 completed with exit code 0>
```

</details>


---

<sub>35s</sub>

### Copilot

The plan has exactly two ordered tasks and both gating questions contain concrete resolution blocks. I’m now checking GitHub-side preconditions and the production/test surfaces needed to make both issue specifications self-contained.

---

<sub>47s</sub>

### `glob`

**1-math-control-remove-before-merge/**/***

"1-math-control-remove-before-merge/**/*"

<details>
<summary>7 matches</summary>

```
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\shepherd-test-experiment.json
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\shepherd-campaign.json
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\campaign-lessons.md
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\math-tool-ignorance-reduction-plan.md
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028\create-issues-otel-20260910-1028.jsonl
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028\20260910-1028-invoke-shepherd-task-20-create-issues-from-plan-skill.ps1
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028\20260910-1028-invoke-shepherd-task-20-create-issues-from-plan-skill.md
```

</details>


---

<sub>47s</sub>

### `glob`

**eng/**/***

"eng/**/*"

```
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\eng\test-math-tool.ps1
```


---

<sub>46s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\.github\workflows\shepherd-task-math-tool.yml.**

C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\.github\workflows\shepherd-task-math-tool.yml

<details>
<summary>19 lines</summary>

```
name: Shepherd task math tool

on:
  pull_request:
  push:
  workflow_dispatch:

permissions:
  contents: read

jobs:
  test:
    name: Shepherd task math tool
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install Pester 5.7.1
        shell: pwsh
        run: Install-Module Pester -RequiredVersion 5.7.1 -Scope CurrentUser -Force
      - name: Test math tool
        shell: pwsh
        run: ./eng/test-math-tool.ps1
```

</details>


---

<sub>48s</sub>

### `powershell`

**Validate GitHub repository and parent state**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; function Invoke-GhJson([string[]]$Args,[string]$Label) { $output = & gh @Args 2>&1; $code=$LASTEXITCODE; if($code -ne 0){ throw \"$Label failed: $($output | Out-String)\" }; return ($output | Out-String) }; $repo='edburns/dd-3061974-04-windows-simple-math'; $repoJson=Invoke-GhJson @('api',\"repos/$repo\") 'Repository lookup' | ConvertFrom-Json; $branchJson=Invoke-GhJson @('api',\"repos/$repo/branches/experiment/shepherd-control\") 'Branch lookup' | ConvertFrom-Json; $parentJson=Invoke-GhJson @('api',\"repos/$repo/issues/1\") 'Parent lookup' | ConvertFrom-Json; $childrenRaw=Invoke-GhJson @('api',\"repos/$repo/issues/1/sub_issues\",'--paginate','--slurp') 'Child lookup'; $normalizedRaw=$childrenRaw | & jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'; $jqCode=$LASTEXITCODE; if($jqCode -ne 0){throw \"Child normalization failed: $($normalizedRaw | Out-String)\"}; $children=@(($normalizedRaw | Out-String) | ConvertFrom-Json); $issueType=$null; if($repoJson.owner.type -eq 'Organization'){ $typesRaw=Invoke-GhJson @('api',\"orgs/$($repoJson.owner.login)/issue-types\") 'Issue type lookup'; $types=@(($typesRaw | ConvertFrom-Json)); $issueType=@($types | Where-Object {$_.name -eq 'Task' -and $_.is_enabled -eq $true})[0] } elseif($repoJson.owner.type -ne 'User'){throw \"Unrecognized owner type: $($repoJson.owner.type)\"}; [pscustomobject]@{ defaultBranch=$repoJson.default_branch; ownerLogin=$repoJson.owner.login; ownerType=$repoJson.owner.type; baseBranch=$branchJson.name; parentNumber=$parentJson.number; parentState=$parentJson.state; parentUrl=$parentJson.html_url; selectedIssueType=if($null -ne $issueType){'Task'}else{''}; normalizedChildren=@($children | ForEach-Object {[pscustomobject]@{id=$_.id;number=$_.number;title=$_.title}}) } | ConvertTo-Json -Depth 8",
  "description": "Validate GitHub repository and parent state",
  "initial_wait": 60,
  "mode": "sync"
}
```

</details>

<details>
<summary>6 lines</summary>

```
ConvertFrom-Json: 
Line |
   2 |  … @('api',"repos/$repo") 'Repository lookup' | ConvertFrom-Json; $branc …
     |                                                 ~~~~~~~~~~~~~~~~
     | Conversion from JSON failed with error: Unexpected character encountered while parsing value: W. Path '', line 0, position 0.
<shellId: 1 completed with exit code 1>
```

</details>


---

<sub>55s</sub>

### Copilot

The local repository checks passed, but the first GitHub metadata parse was polluted by non-JSON CLI output. I’m separating native stdout/stderr handling and re-running the read-only preconditions without changing repository state.

---

<sub>1m 8s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\eng\test-math-tool.ps1.**

C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\eng\test-math-tool.ps1

<details>
<summary>31 lines</summary>

```
[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$requiredVersion = '5.7.1'
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$implementationPath = Join-Path $repositoryRoot 'math-tool.ps1'
$testPath = Join-Path $repositoryRoot 'math-tool.Tests.ps1'

$implementationExists = Test-Path -LiteralPath $implementationPath -PathType Leaf
$testsExist = Test-Path -LiteralPath $testPath -PathType Leaf
if (-not $implementationExists -and -not $testsExist) {
    Write-Host 'Math-tool implementation has not been introduced yet; baseline validation passed.'
    exit 0
}
if (-not $implementationExists -or -not $testsExist) {
    throw 'math-tool.ps1 and math-tool.Tests.ps1 must be introduced together.'
}

$available = Get-Module -ListAvailable Pester |
    Where-Object { $_.Version.ToString() -eq $requiredVersion } |
    Select-Object -First 1
if (-not $available) {
    Write-Host "Installing Pester $requiredVersion in CurrentUser scope..."
    Install-Module Pester -RequiredVersion $requiredVersion -Scope CurrentUser -Force
}

Import-Module Pester -RequiredVersion $requiredVersion -Force
$result = Invoke-Pester -Path $testPath -PassThru
if ($result.FailedCount -gt 0) {
    Write-Error "Pester reported $($result.FailedCount) failed test(s)."
    exit 1
}
exit 0
```

</details>


---

<sub>1m 8s</sub>

### `view`

**view the file at C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\shepherd-test-experiment.json.**

C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\shepherd-test-experiment.json

<details>
<summary>6 lines</summary>

```
{
  "schemaVersion": 1,
  "baselineSha": "f790d6306ad414b636f47b01d6131bba02005187",
  "lessonPropagation": "off",
  "expectedTaskCount": 2
}
```

</details>


---

<sub>1m 9s</sub>

### `powershell`

**Recheck GitHub metadata with clean JSON**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; $repo='edburns/dd-3061974-04-windows-simple-math'; $repoOut=& gh api \"repos/$repo\"; $repoCode=$LASTEXITCODE; if($repoCode -ne 0){throw \"Repository lookup failed: $($repoOut|Out-String)\"}; $repoJson=($repoOut|Out-String)|ConvertFrom-Json; $branchOut=& gh api \"repos/$repo/branches/experiment/shepherd-control\"; $branchCode=$LASTEXITCODE; if($branchCode -ne 0){throw \"Branch lookup failed: $($branchOut|Out-String)\"}; $branchJson=($branchOut|Out-String)|ConvertFrom-Json; $parentOut=& gh api \"repos/$repo/issues/1\"; $parentCode=$LASTEXITCODE; if($parentCode -ne 0){throw \"Parent lookup failed: $($parentOut|Out-String)\"}; $parentJson=($parentOut|Out-String)|ConvertFrom-Json; $childrenOut=& gh api \"repos/$repo/issues/1/sub_issues\" --paginate --slurp; $childrenCode=$LASTEXITCODE; if($childrenCode -ne 0){throw \"Child lookup failed: $($childrenOut|Out-String)\"}; $normalizedOut=($childrenOut|Out-String)|jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'; $normalizeCode=$LASTEXITCODE; if($normalizeCode -ne 0){throw \"Child normalization failed: $($normalizedOut|Out-String)\"}; $children=@((($normalizedOut|Out-String)|ConvertFrom-Json)); $selected=''; if($repoJson.owner.type -eq 'Organization'){ $typesOut=& gh api \"orgs/$($repoJson.owner.login)/issue-types\"; $typesCode=$LASTEXITCODE; if($typesCode -ne 0){throw \"Issue type lookup failed: $($typesOut|Out-String)\"}; $types=@((($typesOut|Out-String)|ConvertFrom-Json)); if(@($types|Where-Object {$_.name -eq 'Task' -and $_.is_enabled -eq $true}).Count -gt 0){$selected='Task'} } elseif($repoJson.owner.type -ne 'User'){throw \"Unrecognized owner type $($repoJson.owner.type)\"}; [pscustomobject]@{defaultBranch=$repoJson.default_branch;ownerLogin=$repoJson.owner.login;ownerType=$repoJson.owner.type;baseBranch=$branchJson.name;parentNumber=$parentJson.number;parentState=$parentJson.state;parentUrl=$parentJson.html_url;selectedIssueType=$selected;normalizedChildren=@($children|ForEach-Object{[pscustomobject]@{id=$_.id;number=$_.number;title=$_.title}})}|ConvertTo-Json -Depth 8",
  "description": "Recheck GitHub metadata with clean JSON",
  "initial_wait": 60,
  "mode": "sync"
}
```

</details>

<details>
<summary>12 lines</summary>

```
{
  "defaultBranch": "main",
  "ownerLogin": "edburns",
  "ownerType": "User",
  "baseBranch": "experiment/shepherd-control",
  "parentNumber": 1,
  "parentState": "open",
  "parentUrl": "https://github.com/edburns/dd-3061974-04-windows-simple-math/issues/1",
  "selectedIssueType": "",
  "normalizedChildren": []
}
<shellId: 2 completed with exit code 0>
```

</details>


---

<sub>1m 15s</sub>

### Copilot

GitHub preconditions now pass: the parent is open, the base branch exists and differs from `main`, there are no existing children, and this user-owned repository will create untyped issues. I’m drafting both persisted specifications and aligning them with the validator’s exact structural contract before creation.

---

<sub>1m 17s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\validate-stage20-drafts.ps1

<details>
<summary>60 lines</summary>

```
# shepherd-task-version: 1.0.2
<#
.SYNOPSIS
    Validates persisted stage-20 issue bodies before GitHub mutation.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$BodyDirectory,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$ExpectedCount,

    [Parameter(Mandatory)]
    [ValidateSet('off', 'campaign')]
    [string]$LessonPropagation
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $BodyDirectory -PathType Container)) {
    throw "Stage-20 body directory does not exist: $BodyDirectory"
}

$bodyFiles = @(
    Get-ChildItem -LiteralPath $BodyDirectory -Filter '*-body.md' -File |
        Where-Object { $_.Name -notlike '*-observed-body.md' } |
        Sort-Object Name
)
if ($bodyFiles.Count -ne $ExpectedCount) {
    throw "Expected $ExpectedCount persisted stage-20 body files; found $($bodyFiles.Count)."
}

$requiredHeadings = @(
    '## Campaign context and required reading',
    '## Branch and execution order',
    '## Implement',
    '## Completion gates',
    '## Out of scope'
)

foreach ($bodyFile in $bodyFiles) {
    $text = [System.IO.File]::ReadAllText($bodyFile.FullName)
    $lines = [System.IO.File]::ReadAllLines($bodyFile.FullName)
    if ([string]::IsNullOrWhiteSpace($text) -or $text -notmatch "`r?`n" -or $lines.Count -le 1) {
        throw "Persisted issue body must contain physical Markdown lines: $($bodyFile.FullName)"
    }

    $firstNonblank = $lines | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -First 1
    if ($firstNonblank -notmatch '^##\s+\S') {
        throw "Persisted issue body must begin with a level-two heading: $($bodyFile.FullName)"
    }

    foreach ($heading in $requiredHeadings) {
        if ($lines -cnotcontains $heading) {
            throw "Persisted issue body is missing the physical heading '$heading': $($bodyFile.FullName)"
        }
    }

    $hasCampaignLessons = $lines -ccontains '## Campaign lessons (REQUIRED)'
    if ($LessonPropagation -eq 'campaign' -and -not $hasCampaignLessons) {
        throw "Treatment issue body is missing its campaign-lessons heading: $($bodyFile.FullName)"
    }
    if ($LessonPropagation -eq 'off' -and $hasCampaignLessons) {
        throw "Control issue body unexpectedly contains a campaign-lessons heading: $($bodyFile.FullName)"
    }
}

$bodyFiles
```

</details>


---

<sub>1m 55s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260910-1028/issue-bodies/01-1-implement-fibonacci-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Before changing code, read the entire plan. Then carefully re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+\n+The resolved constraints are authoritative:\n+\n+- Acceptance is defined by `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and runs the repository-owned test runner; do not replace or bypass either.\n+- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.\n+- The function returns only the numeric value, with no incidental success-stream output.\n+- Inputs are non-negative integers.\n+- The production and test files are the repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+- Work is serial. This is the first task; the factorial/dispatch task starts only after this task is merged.\n+\n+There are no separate spike findings to import for this task. The research outcome is the concrete command, output, file-location, and ordering contract above. Implement production code and tests from scratch rather than copying research artifacts.\n+\n+## Branch and execution order\n+\n+Use `experiment/shepherd-control` from remote `origin` as the base branch and target the pull request to that branch. Do not begin until this issue is assigned to the coding agent. The campaign tasks are assigned, completed, and merged serially in plan order. This task must be merged before task 2 begins.\n+\n+## Implement\n+\n+Complete implementation subsection `1. Implement Fibonacci with unit and isolated CLI coverage`.\n+\n+- Add repository-root `math-tool.ps1` with a non-negative integer parameter named `N`.\n+- Add a pure `Get-Fibonacci` function that computes the standard sequence, including `Fibonacci(0) = 0` and `Fibonacci(1) = 1`.\n+- Ensure calling `Get-Fibonacci` returns a numeric value only and emits no labels, progress text, or other incidental output.\n+- When `math-tool.ps1` is executed directly, print exactly one line: `Fibonacci(N) = value`, substituting the requested input and computed value.\n+- Add repository-root `math-tool.Tests.ps1`.\n+- Dot-source the production script for function-level Pester tests.\n+- Test direct CLI behavior in isolated child `pwsh` processes so dot-sourcing and test-process state cannot hide extra output or script-entry behavior.\n+- Cover `N=0`, `N=1`, and at least one small representative value such as `N=5`.\n+\n+Keep the implementation deterministic, objective, and small. Follow existing repository PowerShell conventions.\n+\n+## Completion gates\n+\n+- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero.\n+- Pester function tests prove results `0`, `1`, and a representative Fibonacci result and verify the function produces a numeric value without extra success-stream records.\n+- Isolated CLI tests prove the process exits zero and stdout is exactly one expected line for each covered input, including `Fibonacci(0) = 0`, `Fibonacci(1) = 1`, and the representative case.\n+- The tests invoke the committed production script rather than duplicating its algorithm.\n+- `math-tool.ps1` and `math-tool.Tests.ps1` are introduced together, satisfying the repository runner's paired-file check.\n+- The pinned pull-request CI passes.\n+\n+## Out of scope\n+\n+- Do not add factorial support, operation dispatch, or other operations; those belong to task 2.\n+- Do not modify the canonical runner, the pinned Pester version, or the workflow to make tests pass.\n+- Do not add dependencies, UI, persistence, packaging, or unrelated repository changes.\n+- Do not broaden the input contract beyond non-negative integers.\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260910-1028/issue-bodies/02-2-add-factorial-dispatch-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Before changing code, read the entire plan. Then carefully re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+- `### 2. Add factorial and operation dispatch`\n+\n+The resolved constraints are authoritative:\n+\n+- Acceptance is defined by `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and runs the repository-owned test runner; do not replace or bypass either.\n+- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, according to the selected operation.\n+- Functions return only numeric values, with no incidental success-stream output.\n+- Inputs are non-negative integers.\n+- The production and test files remain the repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.\n+- This task depends on merged task 1 and must preserve all Fibonacci behavior and coverage delivered there.\n+\n+There are no separate spike findings to import for this task. The research outcome is the concrete command, output, file-location, compatibility, and ordering contract above. Extend the production implementation and tests directly rather than copying research artifacts.\n+\n+## Branch and execution order\n+\n+Use `experiment/shepherd-control` from remote `origin` as the base branch and target the pull request to that branch. Do not begin until this issue is assigned to the coding agent and task 1 has merged into the base branch. The campaign tasks are assigned, completed, and merged serially in plan order. This is task 2 and must start from the merged task-1 state.\n+\n+## Implement\n+\n+Complete implementation subsection `2. Add factorial and operation dispatch`.\n+\n+- Extend `math-tool.ps1` with a pure `Get-Factorial` function for non-negative integer inputs, including `Factorial(0) = 1` and `Factorial(1) = 1`.\n+- Add an `Operation` parameter that dispatches direct script execution between `fibonacci` and `factorial` while retaining parameter `N`.\n+- Preserve the task-1 Fibonacci function and CLI contract. Existing invocations that specify only `N` must continue to select Fibonacci, so use Fibonacci as the default operation.\n+- For operation `fibonacci`, print exactly `Fibonacci(N) = value`.\n+- For operation `factorial`, print exactly `Factorial(N) = value`.\n+- Keep both computation functions pure: each returns one numeric result and emits no labels or incidental output.\n+- Extend `math-tool.Tests.ps1` with focused factorial unit coverage and isolated child-`pwsh` CLI coverage while retaining the complete Fibonacci regression suite.\n+- Cover factorial inputs `0`, `1`, and at least one small representative value such as `5`.\n+\n+Keep the public interface and tests objective and small. Follow the existing production and test patterns established by the merged first task without weakening them.\n+\n+## Completion gates\n+\n+- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined suite.\n+- Existing Fibonacci unit and isolated CLI tests still pass unchanged in behavior, including the default invocation that supplies `N` without `Operation`.\n+- Factorial unit tests prove results `1` for both `0` and `1`, plus a representative result such as `Factorial(5) = 120`, and verify one numeric success-stream value with no incidental output.\n+- Isolated CLI tests prove explicit `fibonacci` and `factorial` dispatch, zero exit status, and exactly one expected stdout line with the correct operation label and value.\n+- Tests exercise the production dispatch and production functions rather than duplicating their algorithms.\n+- The pinned pull-request CI passes.\n+\n+## Out of scope\n+\n+- Do not add operations beyond Fibonacci and factorial.\n+- Do not rename or relocate `math-tool.ps1`, `math-tool.Tests.ps1`, parameter `N`, or the existing `Get-Fibonacci` function.\n+- Do not modify the canonical runner, the pinned Pester version, or the workflow to make tests pass.\n+- Do not add dependencies, UI, persistence, packaging, or unrelated repository changes.\n+- Do not broaden the input contract beyond non-negative integers.\n*** End Patch\n"
```

</details>

```
Added 2 file(s): C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028\issue-bodies\01-1-implement-fibonacci-body.md, C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028\issue-bodies\02-2-add-factorial-dispatch-body.md
```


---

<sub>2m 3s</sub>

### Copilot

Both issue bodies are now persisted with the required headings, concrete resolution values, serial dependencies, spike-firewall language, and discriminating CLI/function gates. I’m running the mandatory disk-based draft validator before any issue is created.

---

<sub>2m 7s</sub>

### `powershell`

**Validate persisted issue body drafts**

<details>
<summary>Arguments</summary>

```json
{
  "command": "$ErrorActionPreference='Stop'; & 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\validate-stage20-drafts.ps1' -BodyDirectory 'C:\\Users\\edburns\\workareas\\dd-3061974-04-windows-simple-math-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260910-1028\\issue-bodies' -ExpectedCount 2 -LessonPropagation off | Select-Object -ExpandProperty FullName",
  "description": "Validate persisted issue body drafts",
  "initial_wait": 30,
  "mode": "sync"
}
```

</details>

```
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028\issue-bodies\01-1-implement-fibonacci-body.md
C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028\issue-bodies\02-2-add-factorial-dispatch-body.md
<shellId: 3 completed with exit code 0>
```


---

<sub>2m 10s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1.**

C:\Users\edburns\.copilot\plugins\shepherd-task\scripts\verify-github-issue-body.ps1 (lines 1-260)

<details>
<summary>166 lines</summary>

```
# shepherd-task-version: 1.0.2
<#
.SYNOPSIS
    Fetches a GitHub issue through REST and verifies its body against a file.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidatePattern('^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$')]
    [string]$Repository,

    [Parameter(Mandatory)]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$IssueNumber,

    [Parameter(Mandatory)]
    [string]$ExpectedBodyPath,

    [ValidateRange(1, 100)]
    [int]$MaxAttempts = 6,

    [ValidateRange(0, 300)]
    [int]$DelaySeconds = 5,

    [string]$DiagnosticPath,

    [string]$GitHubCli = 'gh'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

function ConvertTo-NormalizedLineEndings {
    param([AllowEmptyString()][string]$Text)
    return $Text -replace "`r`n|`r", "`n"
}

function Test-EquivalentBody {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ($Actual -ceq $Expected) {
        return $true
    }
    if ($Actual.EndsWith("`n") -and $Actual.Substring(0, $Actual.Length - 1) -ceq $Expected) {
        return $true
    }
    if ($Expected.EndsWith("`n") -and $Expected.Substring(0, $Expected.Length - 1) -ceq $Actual) {
        return $true
    }
    return $false
}

function Get-Sha256 {
    param([AllowEmptyString()][string]$Text)

    $bytes = [System.Text.UTF8Encoding]::new($false).GetBytes($Text)
    return [Convert]::ToHexString([System.Security.Cryptography.SHA256]::HashData($bytes)).ToLowerInvariant()
}

function Get-FirstDifference {
    param(
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    $limit = [Math]::Min($Actual.Length, $Expected.Length)
    $offset = 0
    while ($offset -lt $limit -and $Actual[$offset] -ceq $Expected[$offset]) {
        $offset++
    }
    if ($offset -eq $limit -and $Actual.Length -eq $Expected.Length) {
        return $null
    }

    $prefix = $Expected.Substring(0, [Math]::Min($offset, $Expected.Length))
    $line = ([regex]::Matches($prefix, "`n").Count) + 1
    $lastNewline = $prefix.LastIndexOf("`n", [StringComparison]::Ordinal)
    $column = if ($lastNewline -lt 0) { $offset + 1 } else { $offset - $lastNewline }
    return [ordered]@{
        offset = $offset
        line = $line
        column = $column
    }
}

function Test-TerminalGitHubFailure {
    param([string]$Message)
    return $Message -match '(?i)(HTTP\s+(401|403)|authentication|not authorized|resource not accessible)'
}

function Write-Diagnostic {
    param(
        [string]$Reason,
        [int]$Attempts,
        [AllowEmptyString()][string]$Actual,
        [AllowEmptyString()][string]$Expected
    )

    if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        return
    }

    $parent = Split-Path -Parent $DiagnosticPath
    if (-not [string]::IsNullOrWhiteSpace($parent) -and
        -not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Path $parent | Out-Null
    }

    $diagnostic = [ordered]@{
        schemaVersion = 1
        repository = $Repository
        issueNumber = $IssueNumber
        endpoint = "repos/$Repository/issues/$IssueNumber"
        attempts = $Attempts
        observedAt = (Get-Date).ToUniversalTime().ToString('o')
        reason = $Reason
        expectedLength = $Expected.Length
        actualLength = $Actual.Length
        expectedSha256 = Get-Sha256 $Expected
        actualSha256 = Get-Sha256 $Actual
        firstDifference = Get-FirstDifference -Actual $Actual -Expected $Expected
    }
    $diagnostic | ConvertTo-Json -Depth 4 |
        Set-Content -LiteralPath $DiagnosticPath -Encoding utf8NoBOM
}

if (-not (Test-Path -LiteralPath $ExpectedBodyPath -PathType Leaf)) {
    throw "Expected issue body file not found: $ExpectedBodyPath"
}

$expected = ConvertTo-NormalizedLineEndings (
    Get-Content -LiteralPath $ExpectedBodyPath -Raw
)
$lastReason = ''
$lastActual = ''
$previousConsoleOutputEncoding = [Console]::OutputEncoding
$previousOutputEncoding = $OutputEncoding
$utf8Encoding = [System.Text.UTF8Encoding]::new($false)

try {
    [Console]::OutputEncoding = $utf8Encoding
    $OutputEncoding = $utf8Encoding

    for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
        $output = (& $GitHubCli api "repos/$Repository/issues/$IssueNumber" 2>&1 | Out-String).Trim()
        $exitCode = $LASTEXITCODE
        if ($exitCode -ne 0) {
            $lastReason = "GitHub REST request failed with exit code $exitCode."
            if (Test-TerminalGitHubFailure $output) {
                Write-Diagnostic -Reason $lastReason -Attempts $attempt -Actual '' -Expected $expected
                throw "Unable to fetch issue #$IssueNumber from ${Repository}: $output"
            }
        }
        else {
            try {
                $issue = $output | ConvertFrom-Json
                $lastActual = ConvertTo-NormalizedLineEndings ([string]$issue.body)
                if (Test-EquivalentBody -Actual $lastActual -Expected $expected) {
                    return $issue
                }
                $lastReason = 'GitHub issue body differs from the persisted draft.'
            }
            catch {
                $lastReason = "GitHub REST response was invalid JSON: $($_.Exception.Message)"
            }
        }

        if ($attempt -lt $MaxAttempts) {
            Write-Warning "$lastReason Retrying issue #$IssueNumber body verification ($attempt/$MaxAttempts)."
            if ($DelaySeconds -gt 0) {
                Start-Sleep -Seconds $DelaySeconds
            }
        }
    }

    Write-Diagnostic -Reason $lastReason -Attempts $MaxAttempts -Actual $lastActual -Expected $expected
    $diagnosticSuffix = if ([string]::IsNullOrWhiteSpace($DiagnosticPath)) {
        ''
    }
    else {
        " Diagnostic: $DiagnosticPath"
    }
    throw "Issue #$IssueNumber body verification failed after $MaxAttempts attempts. $lastReason$diagnosticSuffix"
}
finally {
    $OutputEncoding = $previousOutputEncoding
    [Console]::OutputEncoding = $previousConsoleOutputEncoding
}
```

</details>


---

<sub>2m 26s</sub>

### Copilot

Draft validation passed. The two children will be created **without an issue type**. I’m initializing the durable ledger/result files, then creating, exact-body-verifying, and linking each issue one at a time; the workflow will stop and reconcile immediately on any failure.

---

<sub>3m 1s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: 1-math-control-remove-before-merge/prompts/shepherd-task-20-20260910-1028/run-stage20.ps1\n+[CmdletBinding()]\n+param()\n+\n+Set-StrictMode -Version Latest\n+$ErrorActionPreference = 'Stop'\n+$PSNativeCommandUseErrorActionPreference = $false\n+\n+$repo = 'edburns/dd-3061974-04-windows-simple-math'\n+$parentIssue = 1\n+$logDirectory = 'C:\\Users\\edburns\\workareas\\dd-3061974-04-windows-simple-math-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260910-1028'\n+$bodyVerifier = 'C:\\Users\\edburns\\.copilot\\plugins\\shepherd-task\\scripts\\verify-github-issue-body.ps1'\n+$selectedIssueType = ''\n+$ledgerPath = Join-Path $logDirectory 'creation-ledger.json'\n+$resultPath = Join-Path $logDirectory 'stage-20-result.json'\n+$linkInputPath = Join-Path $logDirectory 'link-input.json'\n+\n+$specifications = @(\n+    [pscustomobject]@{\n+        subsection = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+        title = '1. Implement Fibonacci with unit and isolated CLI coverage'\n+        bodyFile = Join-Path $logDirectory 'issue-bodies\\01-1-implement-fibonacci-body.md'\n+        relativeBodyFile = 'issue-bodies\\01-1-implement-fibonacci-body.md'\n+    },\n+    [pscustomobject]@{\n+        subsection = '2. Add factorial and operation dispatch'\n+        title = '2. Add factorial and operation dispatch'\n+        bodyFile = Join-Path $logDirectory 'issue-bodies\\02-2-add-factorial-dispatch-body.md'\n+        relativeBodyFile = 'issue-bodies\\02-2-add-factorial-dispatch-body.md'\n+    }\n+)\n+\n+function Write-AtomicJson {\n+    param(\n+        [Parameter(Mandatory)]\n+        [string]$Path,\n+\n+        [Parameter(Mandatory)]\n+        [AllowEmptyCollection()]\n+        [object]$Value\n+    )\n+\n+    $temporaryPath = \"$Path.tmp\"\n+    $json = ConvertTo-Json -InputObject $Value -Depth 10\n+    [IO.File]::WriteAllText($temporaryPath, \"$json`n\", [Text.UTF8Encoding]::new($false))\n+    Move-Item -LiteralPath $temporaryPath -Destination $Path -Force\n+}\n+\n+function Read-CreationLedger {\n+    $parsed = [IO.File]::ReadAllText($ledgerPath) |\n+        ConvertFrom-Json -NoEnumerate\n+    if ($parsed -isnot [System.Array]) {\n+        throw 'Creation ledger JSON root must be an array.'\n+    }\n+\n+    $ledger = [object[]]$parsed\n+    if (@($ledger | Where-Object { $_ -is [System.Array] }).Count -ne 0) {\n+        throw 'Creation ledger must not contain nested array entries.'\n+    }\n+    return $ledger\n+}\n+\n+function Write-CreationLedger {\n+    param([AllowEmptyCollection()][object[]]$Ledger)\n+    Write-AtomicJson -Path $ledgerPath -Value ([object[]]$Ledger)\n+}\n+\n+function Get-NormalizedChildren {\n+    $childrenOutput = & gh api \"repos/$repo/issues/$parentIssue/sub_issues\" --paginate --slurp 2>&1\n+    $childrenExitCode = $LASTEXITCODE\n+    if ($childrenExitCode -ne 0) {\n+        throw \"Unable to query parent children: $($childrenOutput | Out-String)\"\n+    }\n+\n+    $normalizedOutput = ($childrenOutput | Out-String) |\n+        jq 'if length == 0 then [] elif all(.[]; type == \"array\") then add else . end'\n+    $normalizationExitCode = $LASTEXITCODE\n+    if ($normalizationExitCode -ne 0) {\n+        throw \"Unable to normalize parent children: $($normalizedOutput | Out-String)\"\n+    }\n+\n+    $parsed = ($normalizedOutput | Out-String) | ConvertFrom-Json -NoEnumerate\n+    if ($parsed -isnot [System.Array]) {\n+        throw 'Normalized parent children JSON root must be an array.'\n+    }\n+    return [object[]]$parsed\n+}\n+\n+function Set-LedgerProperty {\n+    param(\n+        [Parameter(Mandatory)]\n+        [long]$IssueId,\n+\n+        [Parameter(Mandatory)]\n+        [string]$Property,\n+\n+        [Parameter(Mandatory)]\n+        [bool]$Value\n+    )\n+\n+    $ledger = @(Read-CreationLedger)\n+    $entry = @($ledger | Where-Object { [long]$_.id -eq $IssueId })\n+    if ($entry.Count -ne 1) {\n+        throw \"Expected one ledger entry for issue ID $IssueId; found $($entry.Count).\"\n+    }\n+    $entry[0].$Property = $Value\n+    Write-CreationLedger -Ledger $ledger\n+}\n+\n+function Write-StageResult {\n+    param(\n+        [Parameter(Mandatory)]\n+        [ValidateSet('in_progress', 'complete', 'failed')]\n+        [string]$Status,\n+\n+        [AllowNull()]\n+        [string]$OperationError\n+    )\n+\n+    Write-AtomicJson -Path $resultPath -Value ([ordered]@{\n+        schemaVersion = 1\n+        status = $Status\n+        ledgerFile = 'creation-ledger.json'\n+        operationError = $OperationError\n+    })\n+}\n+\n+$failedOperation = 'initialization'\n+\n+try {\n+    $baselineChildren = @(Get-NormalizedChildren)\n+\n+    Write-CreationLedger -Ledger ([object[]]@())\n+    Write-StageResult -Status 'in_progress' -OperationError $null\n+\n+    foreach ($specification in $specifications) {\n+        $failedOperation = \"create issue for $($specification.subsection)\"\n+        $createArguments = @(\n+            'api',\n+            \"repos/$repo/issues\",\n+            '-X', 'POST',\n+            '-f', \"title=$($specification.title)\",\n+            '-F', \"body=@$($specification.bodyFile)\",\n+            '--jq', '{id,number,node_id,html_url,title}'\n+        )\n+        if (-not [string]::IsNullOrEmpty($selectedIssueType)) {\n+            $createArguments = @(\n+                'api',\n+                \"repos/$repo/issues\",\n+                '-X', 'POST',\n+                '-f', \"title=$($specification.title)\",\n+                '-F', \"body=@$($specification.bodyFile)\",\n+                '-f', \"type=$selectedIssueType\",\n+                '--jq', '{id,number,node_id,html_url,title}'\n+            )\n+        }\n+\n+        $createOutput = & gh @createArguments 2>&1\n+        $createExitCode = $LASTEXITCODE\n+        if ($createExitCode -ne 0) {\n+            throw \"Issue creation failed: $($createOutput | Out-String)\"\n+        }\n+        $createdIssue = ($createOutput | Out-String) | ConvertFrom-Json\n+\n+        $ledger = @(Read-CreationLedger)\n+        $ledger += [pscustomobject][ordered]@{\n+            implementationSubsection = $specification.subsection\n+            bodyFile = $specification.relativeBodyFile\n+            id = [long]$createdIssue.id\n+            number = [int]$createdIssue.number\n+            title = [string]$createdIssue.title\n+            url = [string]$createdIssue.html_url\n+            body_verified = $false\n+            linked = $false\n+        }\n+        Write-CreationLedger -Ledger $ledger\n+\n+        $failedOperation = \"verify body for issue #$($createdIssue.number)\"\n+        $null = & $bodyVerifier `\n+            -Repository $repo `\n+            -IssueNumber ([int]$createdIssue.number) `\n+            -ExpectedBodyPath $specification.bodyFile `\n+            -MaxAttempts 6 `\n+            -DelaySeconds 5 `\n+            -DiagnosticPath (Join-Path $logDirectory \"issue-$($createdIssue.number)-body-verification-failure.json\")\n+        Set-LedgerProperty -IssueId ([long]$createdIssue.id) -Property 'body_verified' -Value $true\n+\n+        $failedOperation = \"link issue #$($createdIssue.number) to parent #$parentIssue\"\n+        [IO.File]::WriteAllText(\n+            $linkInputPath,\n+            \"{`\"sub_issue_id`\": $([long]$createdIssue.id)}`n\",\n+            [Text.UTF8Encoding]::new($false)\n+        )\n+        $linkSucceeded = $false\n+        $lastLinkError = ''\n+        for ($attempt = 1; $attempt -le 3; $attempt++) {\n+            $linkOutput = & gh api \"repos/$repo/issues/$parentIssue/sub_issues\" -X POST --input $linkInputPath 2>&1\n+            $linkExitCode = $LASTEXITCODE\n+            if ($linkExitCode -eq 0) {\n+                $linkSucceeded = $true\n+                break\n+            }\n+            $lastLinkError = $linkOutput | Out-String\n+            if ($attempt -lt 3) {\n+                Start-Sleep -Seconds 2\n+            }\n+        }\n+        if (-not $linkSucceeded) {\n+            throw \"Issue linking failed after 3 attempts: $lastLinkError\"\n+        }\n+        Remove-Item -LiteralPath $linkInputPath -Force\n+        Set-LedgerProperty -IssueId ([long]$createdIssue.id) -Property 'linked' -Value $true\n+    }\n+\n+    $failedOperation = 'verify final parent-child count and order'\n+    $finalChildren = @(Get-NormalizedChildren)\n+    $ledger = @(Read-CreationLedger)\n+    if ($finalChildren.Count -ne ($baselineChildren.Count + $ledger.Count)) {\n+        throw \"Parent child count is $($finalChildren.Count); expected $($baselineChildren.Count + $ledger.Count).\"\n+    }\n+\n+    foreach ($entry in $ledger) {\n+        $occurrences = @($finalChildren | Where-Object { [long]$_.id -eq [long]$entry.id }).Count\n+        if ($occurrences -ne 1) {\n+            throw \"Issue #$($entry.number) is linked $occurrences times; expected exactly once.\"\n+        }\n+    }\n+\n+    $baselineIds = @($baselineChildren | ForEach-Object { [long]$_.id })\n+    $newChildren = @($finalChildren | Where-Object { [long]$_.id -notin $baselineIds })\n+    $expectedIds = @($ledger | ForEach-Object { [long]$_.id })\n+    $actualIds = @($newChildren | ForEach-Object { [long]$_.id })\n+    if (($actualIds -join ',') -cne ($expectedIds -join ',')) {\n+        throw \"New child order '$($actualIds -join ',')' does not match ledger order '$($expectedIds -join ',')'.\"\n+    }\n+\n+    foreach ($entry in $ledger) {\n+        $failedOperation = \"verify final postconditions for issue #$($entry.number)\"\n+        $bodyPath = Join-Path $logDirectory ([string]$entry.bodyFile)\n+        $issue = & $bodyVerifier `\n+            -Repository $repo `\n+            -IssueNumber ([int]$entry.number) `\n+            -ExpectedBodyPath $bodyPath `\n+            -MaxAttempts 6 `\n+            -DelaySeconds 5 `\n+            -DiagnosticPath (Join-Path $logDirectory \"issue-$($entry.number)-body-verification-failure.json\")\n+        if ([string]$issue.state -ne 'open') {\n+            throw \"Issue #$($entry.number) is not open.\"\n+        }\n+        if (@($issue.assignees).Count -ne 0) {\n+            throw \"Issue #$($entry.number) is assigned; expected no assignees.\"\n+        }\n+        if (-not [string]::IsNullOrEmpty($selectedIssueType) -and\n+            [string]$issue.type.name -cne $selectedIssueType) {\n+            throw \"Issue #$($entry.number) does not have issue type $selectedIssueType.\"\n+        }\n+    }\n+\n+    Write-StageResult -Status 'complete' -OperationError $null\n+    [pscustomobject]@{\n+        status = 'complete'\n+        selectedIssueType = $selectedIssueType\n+        baselineChildCount = $baselineChildren.Count\n+        finalChildCount = $finalChildren.Count\n+        ledger = @(Read-CreationLedger)\n+    } | ConvertTo-Json -Depth 10\n+}\n+catch {\n+    $operationError = \"$failedOperation`: $($_.Exception.Message)\"\n+    try {\n+        $serverChildren = @(Get-NormalizedChildren)\n+        $serverIds = @($serverChildren | ForEach-Object { [long]$_.id })\n+        $ledger = @(Read-CreationLedger)\n+        foreach ($entry in $ledger) {\n+            $entry.linked = ([long]$entry.id -in $serverIds)\n+        }\n+        Write-CreationLedger -Ledger $ledger\n+    }\n+    catch {\n+        $operationError += \" Reconciliation failed: $($_.Exception.Message)\"\n+        $ledger = if (Test-Path -LiteralPath $ledgerPath) { @(Read-CreationLedger) } else { @() }\n+    }\n+\n+    Write-StageResult -Status 'failed' -OperationError $operationError\n+    [pscustomobject]@{\n+        status = 'failed'\n+        operationError = $operationError\n+        ledger = $ledger\n+        cleanupCommands = @(\n+            $ledger | ForEach-Object {\n+                \"gh issue delete $($_.number) --repo `\"$repo`\" --yes\"\n+            }\n+        )\n+    } | ConvertTo-Json -Depth 10\n+    exit 1\n+}\n+finally {\n+    if (Test-Path -LiteralPath $linkInputPath -PathType Leaf) {\n+        Remove-Item -LiteralPath $linkInputPath -Force\n+    }\n+}\n*** End Patch\n"
```

</details>

```
Added 1 file(s): C:\Users\edburns\workareas\dd-3061974-04-windows-simple-math-shepherd-control\1-math-control-remove-before-merge\prompts\shepherd-task-20-20260910-1028\run-stage20.ps1
```


---

<sub>3m 3s</sub>

### Copilot

The mandatory validator passed and all pre-mutation checks are complete. Creation is now proceeding in plan order with an initially empty normalized child baseline and durable per-operation state.

---

<sub>3m 13s</sub>

### `powershell`

**Create verify and link ordered issues**

<details>
<summary>Arguments</summary>

```json
{
  "command": "& 'C:\\Users\\edburns\\workareas\\dd-3061974-04-windows-simple-math-shepherd-control\\1-math-control-remove-before-merge\\prompts\\shepherd-task-20-20260910-1028\\run-stage20.ps1'",
  "description": "Create verify and link ordered issues",
  "initial_wait": 180,
  "mode": "sync"
}
```

</details>

<details>
<summary>29 lines</summary>

```
{
  "status": "complete",
  "selectedIssueType": "",
  "baselineChildCount": 0,
  "finalChildCount": 2,
  "ledger": [
    {
      "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
      "bodyFile": "issue-bodies\\01-1-implement-fibonacci-body.md",
      "id": 5415371718,
      "number": 2,
      "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
      "url": "https://github.com/edburns/dd-3061974-04-windows-simple-math/issues/2",
      "body_verified": true,
      "linked": true
    },
    {
      "implementationSubsection": "2. Add factorial and operation dispatch",
      "bodyFile": "issue-bodies\\02-2-add-factorial-dispatch-body.md",
      "id": 5415372048,
      "number": 3,
      "title": "2. Add factorial and operation dispatch",
      "url": "https://github.com/edburns/dd-3061974-04-windows-simple-math/issues/3",
      "body_verified": true,
      "linked": true
    }
  ]
}
<shellId: 4 completed with exit code 0>
```

</details>


---

<sub>3m 19s</sub>

### Copilot

Both issues were created, body-verified twice, linked once, left open and unassigned, and the final child order matches the plan. I’m checking the installed stage-25 command syntax so the handoff invocation is exact.

---

<sub>3m 22s</sub>

### `rg`

**shepherd-task-25-given-list**

"shepherd-task-25-given-list" in *.{md,ps1,json,yml,yaml} (~\.copilot\skills, ~\.copilot\plugins\shepherd-task)

<details>
<summary>71 matches</summary>

```
[grep content: 57 matches across 31 file(s) under C:/Users/edburns/.copilot]

plugins/shepherd-task/figure (2 match(es)):
  01- shepherd-task-25-given-list.md:3:Stage 25 (`shepherd-task-25-given-list`) owns one serial run. It validates the durable campaign
  01- shepherd-task-25-given-list.md:11:    participant GL as Stage 25: shepherd-task-25-given-list

skills/shepherd-task (3 match(es)):
  50- create-post-mortem\SKILL.md:13:This skill is designed to be invoked from `shepherd-task-25-given-list.ps1` / `shepherd-task-25-given-list.sh` in a `finally` / `trap EXIT` path so it runs for **all outcomes**, not only after success.
  50- create-post-mortem\SKILL.md:60:2. If `shepherd-task-25-given-list-run.json` exists, verify its campaign ID,
  20- create-issues-from-plan\SKILL.md:306:2. Comma-separated child issue numbers for `shepherd-task-25-given-list`.

plugins/shepherd-task/README.md (8 match(es)):
  33: - one or more `shepherd-task-25-given-list` runs.
  54: | 25         |                                                    | `shepherd-task-25-given-list`                     | Runs selected child issues serially, invokes `shepherd-task` separately for each issue to perform stages 30 and 40, and always invokes stage 50 |
  254: ./plugins/shepherd-task/scripts/shepherd-task-25-given-list.sh \
  262: .\plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1 `
  293: - [Figure 01 — stage 25 given-list batch orchestration](figure-01-shepherd-task-25-given-list.md)
  441: `shepherd-task-25-given-list-run.json`:
  531:     ├── shepherd-task-25-given-list-run.json
  611: | `scripts/shepherd-task-25-given-list.*` | Run stage 25: create a run and dispatch issues serially |

plugins/shepherd-task/skills/shepherd-task (3 match(es)):
  20- create-issues-from-plan\SKILL.md:306:2. Comma-separated child issue numbers for `shepherd-task-25-given-list`.
  50- create-post-mortem\SKILL.md:13:This skill is designed to be invoked from `shepherd-task-25-given-list.ps1` / `shepherd-task-25-given-list.sh` in a `finally` / `trap EXIT` path so it runs for **all outcomes**, not only after success.
  50- create-post-mortem\SKILL.md:60:2. If `shepherd-task-25-given-list-run.json` exists, verify its campaign ID,

plugins/shepherd-task/test/lesson-propagation-default-contract.ps1 (4 match(es)):
  9: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'
  160:         (Join-Path $harnessDirectory 'shepherd-task-25-given-list.ps1'),
  196:             Join-Path $harnessDirectory 'shepherd-task-25-given-list.ps1'
  214:         Join-Path $runDirectories[0].FullName 'shepherd-task-25-given-list-run.json'
plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature-treatment-control/02-create-issues.ps1:254:     (Join-Path $PSScriptRoot '..' '..' 'scripts' 'shepherd-task-25-given-list.ps1')
plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature/02-create-issues.ps1:263:     (Join-Path $PSScriptRoot '..' '..' 'scripts' 'shepherd-task-25-given-list.ps1')
plugins/shepherd-task/test/simple-math-treatment-control/02-create-issues.ps1:251:     (Join-Path $PSScriptRoot '..' '..' 'scripts' 'shepherd-task-25-given-list.ps1')
plugins/shepherd-task/test/simple-math/02-create-issues.ps1:260:     (Join-Path $PSScriptRoot '..' '..' 'scripts' 'shepherd-task-25-given-list.ps1')
plugins/shepherd-task/test/simple-math-treatment-control/06-stage40-review-contract.ps1:14: $stage25Path = Join-Path $repoRoot 'plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1'
plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature-treatment-control/06-stage40-review-contract.ps1:14: $stage25Path = Join-Path $repoRoot 'plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1'
plugins/shepherd-task/test/simple-math/06-stage40-review-contract.ps1:14: $stage25Path = Join-Path $repoRoot 'plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1'
plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature/06-stage40-review-contract.ps1:14: $stage25Path = Join-Path $repoRoot 'plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1'
plugins/shepherd-task/test/simple-math/07-driver-encoding-contract.ps1:296:         'shepherd-task-25-given-list.ps1',
plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature/07-driver-encoding-contract.ps1:296:         'shepherd-task-25-given-list.ps1',
plugins/shepherd-task/test/simple-math-treatment-control/08-psncpps-contract.ps1:13: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'
plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature-treatment-control/08-psncpps-contract.ps1:13: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'

plugins/shepherd-task/scripts/shepherd-task (2 match(es)):
  25- given-list.ps1:65:$runManifestPath = Join-Path $logDirFull 'shepherd-task-25-given-list-run.json'
  25- given-list.ps1:117:    Write-Host "Logging shepherd-task-25-given-list run to: $logDirFull"
plugins/shepherd-task/test/simple-math/08-psncpps-contract.ps1:13: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'
plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature/08-psncpps-contract.ps1:13: $stage25 = Join-Path $scriptsDirectory 'shepherd-task-25-given-list.ps1'

plugins/shepherd-task/test/simple-math-treatment-control/20260831-run-treatment-control-experiment.ps1 (3 match(es)):
  150:                 $manifestPath = Join-Path $_.FullName 'shepherd-task-25-given-list-run.json'
  496:         -Path (Join-Path $ShepherdPlugin 'scripts\shepherd-task-25-given-list.ps1') `
  506:         -Path (Join-Path $ShepherdPlugin 'scripts\shepherd-task-25-given-list.ps1') `
plugins/shepherd-task/scripts/shepherd-task-monitor.ps1:10:     Run this in a SEPARATE terminal while shepherd-task-25-given-list.ps1 is running.
plugins/shepherd-task/test/simple-math/10-simple-math-fixture-contract.ps1:112:     "scripts\\shepherd-task-25-given-list\.ps1"
plugins/shepherd-task/scripts/shepherd-task.ps1:22:     Existing shepherd-task-25-given-list run directory.

plugins/shepherd-task/test/simple-math-treatment-control/README.md (2 match(es)):
  407: & "$ShepherdPlugin/scripts/shepherd-task-25-given-list.ps1" `
  416: & "$ShepherdPlugin/scripts/shepherd-task-25-given-list.ps1" `
plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature/10-cargotracker-fixture-contract.ps1:201:     "scripts\\shepherd-task-25-given-list\.ps1"

plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature-treatment-control/20260902-run-treatment-control-experiment.ps1 (3 match(es)):
  149:                 $manifestPath = Join-Path $_.FullName 'shepherd-task-25-given-list-run.json'
  502:         -Path (Join-Path $ShepherdPlugin 'scripts\shepherd-task-25-given-list.ps1') `
  512:         -Path (Join-Path $ShepherdPlugin 'scripts\shepherd-task-25-given-list.ps1') `

plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature-treatment-control/202609023-1638Z-run-treatment-control-experiment-resumeable.ps1 (3 match(es)):
  180:             'shepherd-task-25-given-list-run.json'
  395:         'shepherd-task-25-given-list-run.json'
  436:                 'scripts\shepherd-task-25-given-list.ps1') `

plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature-treatment-control/README.md (2 match(es)):
  305: & "$ShepherdPlugin\scripts\shepherd-task-25-given-list.ps1" `
  310: & "$ShepherdPlugin\scripts\shepherd-task-25-given-list.ps1" `

plugins/shepherd-task/test/simple-math/run-campaign.ps1 (2 match(es)):
  339:                 $manifestPath = Join-Path $_.FullName 'shepherd-task-25-given-list-run.json'
  468:         'scripts\shepherd-task-25-given-list.ps1'

plugins/shepherd-task/test/cargotracker-add-change-arrival-deadline-feature/run-campaign.ps1 (2 match(es)):
  341:                 $manifestPath = Join-Path $_.FullName 'shepherd-task-25-given-list-run.json'
  473:         'scripts\shepherd-task-25-given-list.ps1'
```

</details>


---

<sub>3m 26s</sub>

### `view`

**view the file at C:\Users\edburns\.copilot\plugins\shepherd-task\README.md.**

C:\Users\edburns\.copilot\plugins\shepherd-task\README.md (lines 246-274)

<details>
<summary>20 lines</summary>

````
`stage-20-result.json` to explicitly report `complete`; a zero Copilot process
exit alone is not treated as successful issue creation.

### 5. Run stage 25 with an ordered issue list

Bash:

```bash
./plugins/shepherd-task/scripts/shepherd-task-25-given-list.sh \
  "<issue-number>,<issue-number>" \
  <campaign-metadata-directory>
```

PowerShell:

```powershell
.\plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1 `
  -TaskIssues "<issue-number>,<issue-number>" `
  -CampaignMetadataDirectory <campaign-metadata-directory>
```

Stage 25 invokes `shepherd-task` for each issue in order.

**Note:** Manually invoking `shepherd-task` is also supported entry-point.

Bash:

```bash
./plugins/shepherd-task/scripts/shepherd-task.sh \
````

</details>


---

<sub>3m 28s</sub>

### Copilot

Created and linked two ordered child issues under #1. Both are open, unassigned, body-verified, and created **without an issue type**.

| Implementation subsection | Issue | Title | URL |
|---|---:|---|---|
| 1 | #2 | Implement Fibonacci with unit and isolated CLI coverage | https://github.com/edburns/dd-3061974-04-windows-simple-math/issues/2 |
| 2 | #3 | Add factorial and operation dispatch | https://github.com/edburns/dd-3061974-04-windows-simple-math/issues/3 |

**Stage 25 issue list:** `2,3`

```powershell
.\plugins\shepherd-task\scripts\shepherd-task-25-given-list.ps1 `
  -TaskIssues "2,3" `
  -CampaignMetadataDirectory "1-math-control-remove-before-merge"
```

The durable `stage-20-result.json` reports `complete`; `creation-ledger.json` contains the verified ordered issue records.

---

<sub>Generated by [GitHub Copilot CLI](https://github.com/features/copilot/cli)</sub>
