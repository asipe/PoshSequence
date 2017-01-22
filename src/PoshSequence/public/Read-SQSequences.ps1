Function Read-SQSequences {
  [CmdletBinding()]
  Param([Parameter(Mandatory=$true)] [string]$Path,
        [Parameter(Mandatory=$false)] [bool]$InitializeEmptyIfFileDoesNotExist = $false)

  Clear-SQAllSequences

  if (!(Test-Path -Path $path -PathType Leaf)) {
    Save-SQSequences -Path $path
  }

  $obj = Get-Content -Path $Path -Raw | 
    ConvertFrom-Json

  $obj.PSObject.Properties | 
    ForEach-Object { 
      Set-SQCurrentSequenceValue -SequenceName $_.Name -Value $_.Value
    }
}