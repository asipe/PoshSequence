Set-StrictMode -Version 'Latest'
$ErrorActionPreference = 'Stop'

Import-Module .\thirdparty\psscriptanalyzer -Force

$excludedRules = @('PSUseShouldProcessForStateChangingFunctions',
                   'PSUseOutputTypeCorrectly',
                   'PSUseSingularNouns')
Invoke-ScriptAnalyzer -Path .\src\PoshSequence -Recurse -ExcludeRule $excludedRules