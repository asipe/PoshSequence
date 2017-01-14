Set-StrictMode -Version 'Latest'
$ErrorActionPreference = 'Stop'

Import-Module .\thirdparty\psscriptanalyzer -Force
Invoke-ScriptAnalyzer -Path .\src\PoshSequence -Recurse -ExcludeRule @('PSUseOutputTypeCorrectly')