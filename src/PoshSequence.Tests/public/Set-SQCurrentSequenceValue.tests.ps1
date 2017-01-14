Describe 'Set-SQCurrentSequenceValue' {
  Context 'usage' {
    BeforeEach {
      Clear-SQAllSequences
    }

    It 'sets default value when it was never set before' {
      Set-SQCurrentSequenceValue -Value 10
      Get-SQCurrentSequenceValue | Should Be 10
    }

    It 'sets names sequence value when it was never set before' {
      Set-SQCurrentSequenceValue -SequenceName 'abc' -Value 10
      Get-SQCurrentSequenceValue -SequenceName 'abc' | Should Be 10
    }

    It 'does not change other sequence values' {
      Set-SQCurrentSequenceValue -SequenceName 'abc' -Value 10
      Get-SQCurrentSequenceValue -SequenceName 'abc' | Should Be 10
      Get-SQCurrentSequenceValue | Should Be 0
      Get-SQNextSequenceValue | Should Be 0
      Set-SQCurrentSequenceValue -SequenceName 'abc' -Value 1000
      Get-SQCurrentSequenceValue -SequenceName 'abc' | Should Be 1000
      Get-SQNextSequenceValue | Should Be 1
    }
  }
} 