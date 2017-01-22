@{
  RootModule = 'PoshSequence'
  ModuleVersion = '1.0.0.3'
  GUID = '834c797a-e74b-43e4-9218-cb88627d2151'
  Author = 'Andy Sipe'
  Description = 'Small module that allows a named sequence of numbers to be incremented, retrieved, saved and stored.'
  Copyright = 'Copyright (c) 2017 Andy Sipe. All rights reserved.'
  PowerShellVersion = '3.0'
  FunctionsToExport = @('Clear-SQAllSequences',
                        'Clear-SQSequence',
                        'Get-SQCurrentSequenceValue',
                        'Get-SQNextSequenceValue',
                        'Read-SQSequences',
                        'Save-SQSequences',
                        'Set-SQCurrentSequenceValue')
  CmdletsToExport = @()
  VariablesToExport = @()
  PrivateData = @{
    PSData = @{
      Tags = @('Sequence')
      LicenseUri = 'https://github.com/asipe/PoshSequence/blob/master/LICENSE'
      ProjectUri = 'https://github.com/asipe/PoshSequence'
    }
  }
}