Function Save-SQSequences {
  [CmdletBinding()]
  Param([Parameter(Mandatory=$true)] [string]$Path)

  $script:sqsequences |
    ConvertTo-Json -Compress -Depth 100 |
    Set-Content -Path $path
}