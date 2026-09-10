[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    # Fibonacci(92) is the largest sequence value representable by Int64.
    [ValidateRange(0, 92)]
    [int]$N
)

if ($MyInvocation.InvocationName -ne '.') {
    Set-StrictMode -Version Latest
    $ErrorActionPreference = 'Stop'
}

function Get-Fibonacci {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        # Fibonacci(92) is the largest sequence value representable by Int64.
        [ValidateRange(0, 92)]
        [int]$N
    )

    if ($N -eq 0) {
        return [long]0
    }

    if ($N -eq 1) {
        return [long]1
    }

    [long]$previous = 0
    [long]$current = 1

    for ($index = 2; $index -le $N; $index++) {
        [long]$next = $previous + $current
        $previous = $current
        $current = $next
    }

    return $current
}

if ($MyInvocation.InvocationName -ne '.') {
    [long]$value = Get-Fibonacci -N $N
    Write-Output ("Fibonacci({0}) = {1}" -f $N, $value)
}
