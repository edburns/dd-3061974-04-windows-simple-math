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
    It 'writes one expected line for N=<n>' -TestCases @(
        @{ N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ N = 5; Expected = 'Fibonacci(5) = 5' }
    ) {
        param($N, $Expected)

        $targetScriptPath = Join-Path $PSScriptRoot 'math-tool.ps1'
        $processStartInfo = [System.Diagnostics.ProcessStartInfo]::new()
        $processStartInfo.FileName = (Get-Command pwsh).Source
        $processStartInfo.Arguments = "-NoLogo -NoProfile -File `"$targetScriptPath`" -N $N"
        $processStartInfo.RedirectStandardOutput = $true
        $processStartInfo.RedirectStandardError = $true
        $processStartInfo.UseShellExecute = $false

        $process = [System.Diagnostics.Process]::Start($processStartInfo)
        [void]$process.WaitForExit()
        $stdout = $process.StandardOutput.ReadToEnd()
        $stderr = $process.StandardError.ReadToEnd()

        $stdoutLines = @($stdout -split "`r?`n" | Where-Object { $_ -ne '' })

        $process.ExitCode | Should -Be 0
        $stderr | Should -Be ''
        $stdoutLines | Should -HaveCount 1
        $stdoutLines[0] | Should -Be $Expected

        $process.Dispose()
    }
}
