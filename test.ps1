Set-StrictMode -Version 'Latest'

$ErrorActionPreference = 'Stop'

$srcDir = Join-Path $PSScriptRoot 'src'
$testDir = Join-Path $srcDir 'PoshSequence.Tests'
$poshSequenceModulePath = Join-Path $srcDir 'PoshSequence\PoshSequence.psm1'
$pesterModulePath = Join-Path $PSScriptRoot '.\thirdparty\pester_bin\Pester.psm1'

Import-Module -Name $pesterModulePath,$poshSequenceModulePath -Force

Get-ChildItem -Path $testDir -File -Recurse |
  ForEach-Object { 
    . $_.FullName
  }