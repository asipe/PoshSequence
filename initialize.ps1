Set-StrictMode -Version 'Latest'
$ErrorActionPreference = 'Stop'

$thirdpartydir = Join-Path $PSScriptRoot 'thirdparty'
$pesterdir = Join-Path $thirdpartydir 'pester'
$psscriptanalyzerdir = Join-Path $thirdpartydir 'psscriptanalyzer'

if (!(Test-Path -Path $thirdpartydir -PathType Container)) {
  New-Item -Path $thirdpartydir -ItemType Directory | Out-Null
}

if (!(Test-Path -Path $pesterdir -PathType Container)) {
  Save-Module -Name 'pester' -Path $thirdpartydir -Verbose
}

if (!(Test-Path -Path $psscriptanalyzerdir -PathType Container)) {
  Save-Module -Name psscriptanalyzer -Path $thirdpartydir -Verbose
}

