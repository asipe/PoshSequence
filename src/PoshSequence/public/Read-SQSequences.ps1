Function Read-SQSequences {
  [CmdletBinding()]
  Param([Parameter(Mandatory=$true)] [string]$Path)

  Clear-SQAllSequence

  $obj = Get-Content -Path $Path -Raw | 
    ConvertFrom-Json

  $obj.PSObject.Properties | 
    ForEach-Object { 
      Set-SQCurrentSequenceValue -SequenceName $_.Name -Value $_.Value
    }
}