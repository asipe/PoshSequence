Function Get-SQCurrentSequenceValue {
  [CmdletBinding()]
  Param([Parameter(Mandatory=$false)] [string]$SequenceName = 'default')

  $sequences = $script:sqsequences

  if ($sequences.ContainsKey($SequenceName)) {
    $sequences[$SequenceName] | Write-Output
  } else {
    0 | Write-Output
  }
}
