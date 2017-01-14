Function Set-SQCurrentSequenceValue {
  [CmdletBinding()]
  Param([Parameter(Mandatory=$false)] [string]$SequenceName = 'default',
        [Parameter(Mandatory=$true)] [int]$Value)

  $sequences = $script:sqsequences
  Clear-SQSequence -SequenceName $SequenceName
  $sequences.Add($SequenceName, $Value)
}