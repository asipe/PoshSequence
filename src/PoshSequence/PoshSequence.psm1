Set-StrictMode -Version 'Latest'

$publicDir = Join-Path $PSScriptRoot 'public'
$privateDir = Join-Path $PSScriptRoot 'private'

Get-ChildItem -Path $privateDir -File -Recurse | 
  ForEach-Object { . $_.FullName }

Get-ChildItem -Path $publicDir -File -Recurse | 
  ForEach-Object { . $_.FullName } | 
  ForEach-Object { Export-ModuleMember -Function $_.BaseName }