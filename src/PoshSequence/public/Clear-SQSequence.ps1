Function Clear-SQSequence {
  [CmdletBinding()]
  Param([Parameter(Mandatory=$false)] [string]$SequenceName = 'default')

  $sequences = $script:sqsequences

  if ($sequences.ContainsKey($SequenceName)) {
    $sequences.Remove($SequenceName)
  }
}