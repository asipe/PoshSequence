Set-StrictMode -Version 'Latest'
$ErrorActionPreference = 'Stop'

$thirdpartydir = Join-Path $PSScriptRoot 'thirdparty'
Remove-Item -Path $thirdpartydir -Recurse -Force