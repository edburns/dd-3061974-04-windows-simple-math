[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    # Fibonacci(92) is the largest sequence value representable by Int64.
    [ValidateRange(0, 92)]
    [int]$N,

    [ValidateSet('fibonacci', 'factorial')]
    [string]$Operation = 'fibonacci'
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

function Get-Factorial {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateRange(0, 92)]
        [int]$N
    )

    [long]$result = 1

    for ($index = 2; $index -le $N; $index++) {
        $result *= $index
    }

    return $result
}

if ($MyInvocation.InvocationName -ne '.') {
    switch ($Operation) {
        'factorial' {
            [long]$value = Get-Factorial -N $N
            Write-Output ("Factorial({0}) = {1}" -f $N, $value)
        }
        default {
            [long]$value = Get-Fibonacci -N $N
            Write-Output ("Fibonacci({0}) = {1}" -f $N, $value)
        }
    }
}
