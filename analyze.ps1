Import-Module .\thirdparty\psscriptanalyzer_bin\PSScriptAnalyzer.psm1 -Force

Invoke-ScriptAnalyzer -Path .\src\PoshSequence -Recurse -ExcludeRule @('PSUseOutputTypeCorrectly')