## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Before changing code, read the entire plan. Then carefully re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`
- `### 2. Add factorial and operation dispatch`

The resolved constraints are authoritative:

- Acceptance is defined by `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and runs the repository-owned test runner; do not replace or bypass either.
- Direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`, according to the selected operation.
- Functions return only numeric values, with no incidental success-stream output.
- Inputs are non-negative integers.
- The production and test files remain the repository-root `math-tool.ps1` and `math-tool.Tests.ps1`.
- This task depends on merged task 1 and must preserve all Fibonacci behavior and coverage delivered there.

There are no separate spike findings to import for this task. The research outcome is the concrete command, output, file-location, compatibility, and ordering contract above. Extend the production implementation and tests directly rather than copying research artifacts.

## Branch and execution order

Use `experiment/shepherd-control` from remote `origin` as the base branch and target the pull request to that branch. Do not begin until this issue is assigned to the coding agent and task 1 has merged into the base branch. The campaign tasks are assigned, completed, and merged serially in plan order. This is task 2 and must start from the merged task-1 state.

## Implement

Complete implementation subsection `2. Add factorial and operation dispatch`.

- Extend `math-tool.ps1` with a pure `Get-Factorial` function for non-negative integer inputs, including `Factorial(0) = 1` and `Factorial(1) = 1`.
- Add an `Operation` parameter that dispatches direct script execution between `fibonacci` and `factorial` while retaining parameter `N`.
- Preserve the task-1 Fibonacci function and CLI contract. Existing invocations that specify only `N` must continue to select Fibonacci, so use Fibonacci as the default operation.
- For operation `fibonacci`, print exactly `Fibonacci(N) = value`.
- For operation `factorial`, print exactly `Factorial(N) = value`.
- Keep both computation functions pure: each returns one numeric result and emits no labels or incidental output.
- Extend `math-tool.Tests.ps1` with focused factorial unit coverage and isolated child-`pwsh` CLI coverage while retaining the complete Fibonacci regression suite.
- Cover factorial inputs `0`, `1`, and at least one small representative value such as `5`.

Keep the public interface and tests objective and small. Follow the existing production and test patterns established by the merged first task without weakening them.

## Completion gates

- `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined suite.
- Existing Fibonacci unit and isolated CLI tests still pass unchanged in behavior, including the default invocation that supplies `N` without `Operation`.
- Factorial unit tests prove results `1` for both `0` and `1`, plus a representative result such as `Factorial(5) = 120`, and verify one numeric success-stream value with no incidental output.
- Isolated CLI tests prove explicit `fibonacci` and `factorial` dispatch, zero exit status, and exactly one expected stdout line with the correct operation label and value.
- Tests exercise the production dispatch and production functions rather than duplicating their algorithms.
- The pinned pull-request CI passes.

## Out of scope

- Do not add operations beyond Fibonacci and factorial.
- Do not rename or relocate `math-tool.ps1`, `math-tool.Tests.ps1`, parameter `N`, or the existing `Get-Fibonacci` function.
- Do not modify the canonical runner, the pinned Pester version, or the workflow to make tests pass.
- Do not add dependencies, UI, persistence, packaging, or unrelated repository changes.
- Do not broaden the input contract beyond non-negative integers.
