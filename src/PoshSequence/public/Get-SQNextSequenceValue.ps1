Function Get-SQNextSequenceValue {
  [CmdletBinding()]
  Param([Parameter(Mandatory=$false)] [string]$SequenceName = 'default')

  $sequences = $script:sqsequences

  if (!($sequences.ContainsKey($SequenceName))) {
    $sequences.Add($SequenceName, 0)
    0 | Write-Output
  } else {
    $value = $sequences[$SequenceName]
    ++$value
    $sequences[$SequenceName] = $value
    $value | Write-Output
  }
}