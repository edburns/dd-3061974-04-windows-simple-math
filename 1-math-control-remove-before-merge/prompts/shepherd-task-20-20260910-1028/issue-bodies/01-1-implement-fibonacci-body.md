## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Before changing code, read the entire plan. Then carefully re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`

The resolved constraints are authoritative:

- Acceptance is defined by `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and runs the repository-owned test runner; do not replace or bypass either.
- Direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`.
- The function returns only the numeric value, with no incidental success-stream output.
- Inputs are non-negative integers.
- The production and test files are the repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.
- Work is serial. This is the first task; the factorial/dispatch task starts only after this task is merged.

There are no separate spike findings to import for this task. The research outcome is the concrete command, output, file-location, and ordering contract above. Implement production code and tests from scratch rather than copying research artifacts.

## Branch and execution order

Use `experiment/shepherd-control` from remote `origin` as the base branch and target the pull request to that branch. Do not begin until this issue is assigned to the coding agent. The campaign tasks are assigned, completed, and merged serially in plan order. This task must be merged before task 2 begins.

## Implement

Complete implementation subsection `1. Implement Fibonacci with unit and isolated CLI coverage`.

- Add repository-root `math-tool.ps1` with a non-negative integer parameter named `N`.
- Add a pure `Get-Fibonacci` function that computes the standard sequence, including `Fibonacci(0) = 0` and `Fibonacci(1) = 1`.
- Ensure calling `Get-Fibonacci` returns a numeric value only and emits no labels, progress text, or other incidental output.
- When `math-tool.ps1` is executed directly, print exactly one line: `Fibonacci(N) = value`, substituting the requested input and computed value.
- Add repository-root `math-tool.Tests.ps1`.
- Dot-source the production script for function-level Pester tests.
- Test direct CLI behavior in isolated child `pwsh` processes so dot-sourcing and test-process state cannot hide extra output or script-entry behavior.
- Cover `N=0`, `N=1`, and at least one small representative value such as `N=5`.

Keep the implementation deterministic, objective, and small. Follow existing repository PowerShell conventions.

## Completion gates

- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero.
- Pester function tests prove results `0`, `1`, and a representative Fibonacci result and verify the function produces a numeric value without extra success-stream records.
- Isolated CLI tests prove the process exits zero and stdout is exactly one expected line for each covered input, including `Fibonacci(0) = 0`, `Fibonacci(1) = 1`, and the representative case.
- The tests invoke the committed production script rather than duplicating its algorithm.
- `math-tool.ps1` and `math-tool.Tests.ps1` are introduced together, satisfying the repository runner's paired-file check.
- The pinned pull-request CI passes.

## Out of scope

- Do not add factorial support, operation dispatch, or other operations; those belong to task 2.
- Do not modify the canonical runner, the pinned Pester version, or the workflow to make tests pass.
- Do not add dependencies, UI, persistence, packaging, or unrelated repository changes.
- Do not broaden the input contract beyond non-negative integers.
