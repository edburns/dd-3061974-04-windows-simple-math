[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateRange(0, [int]::MaxValue)]
    [int]$N
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-Fibonacci {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateRange(0, [int]::MaxValue)]
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

if ([string]::IsNullOrEmpty($MyInvocation.ScriptName)) {
    [long]$value = Get-Fibonacci -N $N
    Write-Output ("Fibonacci({0}) = {1}" -f $N, $value)
}
