Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Describe 'Get-Fibonacci' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'math-tool.ps1') -N 0
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

    It 'returns the largest Fibonacci value that fits in Int64' {
        Get-Fibonacci -N 92 | Should -Be 7540113804746346429
    }

    It 'rejects an index that would overflow Int64' {
        { Get-Fibonacci -N 93 } | Should -Throw
    }

    It 'emits a single numeric value with no extra success-stream output' {
        $records = @(Get-Fibonacci -N 5)

        $records | Should -HaveCount 1
        $records[0].GetType().Name | Should -Be 'Int64'
        $records[0] | Should -Be 5
    }
}

Describe 'Get-Factorial' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'math-tool.ps1') -N 0
    }

    It 'returns 1 for N=0' {
        Get-Factorial -N 0 | Should -Be 1
    }

    It 'returns 1 for N=1' {
        Get-Factorial -N 1 | Should -Be 1
    }

    It 'returns 120 for N=5' {
        Get-Factorial -N 5 | Should -Be 120
    }

    It 'returns the largest factorial value that fits in Int64' {
        Get-Factorial -N 20 | Should -Be 2432902008176640000
    }

    It 'rejects an input that would overflow Int64' {
        { Get-Factorial -N 21 } | Should -Throw
    }

    It 'emits a single numeric value with no extra success-stream output' {
        $records = @(Get-Factorial -N 5)

        $records | Should -HaveCount 1
        $records[0].GetType().Name | Should -Be 'Int64'
        $records[0] | Should -Be 120
    }
}

Describe 'math-tool CLI' {
    BeforeAll {
        $script:pwshPath = (Get-Command pwsh -ErrorAction Stop).Source
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
                -FilePath $script:pwshPath `
                -ArgumentList @('-NoLogo', '-NoProfile', '-File', $targetScriptPath, '-N', [string]$N) `
                -RedirectStandardOutput $stdoutFile `
                -RedirectStandardError $stderrFile `
                -Wait `
                -PassThru

            $stdoutLines = @(Get-Content -Path $stdoutFile)
            $stderr = Get-Content -Path $stderrFile -Raw
        }
        finally {
            Remove-Item -LiteralPath $stdoutFile, $stderrFile -Force
        }

        $process.ExitCode | Should -Be 0
        $stderr | Should -BeNullOrEmpty
        $stdoutLines | Should -HaveCount 1
        $stdoutLines[0] | Should -Be $Expected
    }

    It 'writes one expected line for Operation=<operation> N=<n>' -TestCases @(
        @{ Operation = 'fibonacci'; N = 5; Expected = 'Fibonacci(5) = 5' }
        @{ Operation = 'factorial'; N = 0; Expected = 'Factorial(0) = 1' }
        @{ Operation = 'factorial'; N = 1; Expected = 'Factorial(1) = 1' }
        @{ Operation = 'factorial'; N = 5; Expected = 'Factorial(5) = 120' }
    ) {
        param($Operation, $N, $Expected)

        $targetScriptPath = Join-Path $PSScriptRoot 'math-tool.ps1'
        $stdoutFile = New-TemporaryFile
        $stderrFile = New-TemporaryFile

        try {
            $process = Start-Process `
                -FilePath $script:pwshPath `
                -ArgumentList @('-NoLogo', '-NoProfile', '-File', $targetScriptPath, '-N', [string]$N, '-Operation', $Operation) `
                -RedirectStandardOutput $stdoutFile `
                -RedirectStandardError $stderrFile `
                -Wait `
                -PassThru

            $stdoutLines = @(Get-Content -Path $stdoutFile)
            $stderr = Get-Content -Path $stderrFile -Raw
        }
        finally {
            Remove-Item -LiteralPath $stdoutFile, $stderrFile -Force
        }

        $process.ExitCode | Should -Be 0
        $stderr | Should -BeNullOrEmpty
        $stdoutLines | Should -HaveCount 1
        $stdoutLines[0] | Should -Be $Expected
    }
}
