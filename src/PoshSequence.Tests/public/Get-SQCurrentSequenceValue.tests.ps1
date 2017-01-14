Describe 'Get-SQCurrentSequenceValue' {
  BeforeEach {
    Clear-SQAllSequences
  }

  Context 'usage' {
    It 'returns zero if default sequence is not yet created' {
      Get-SQCurrentSequenceValue | Should Be 0
    }

    It 'returns zero if custom sequence is not yet created' {
      Get-SQCurrentSequenceValue -SequenceName 'a' | Should Be 0
    }

    It 'returns current sequence value for default sequence' {
      Get-SQNextSequenceValue | Should Be 0
      Get-SQCurrentSequenceValue | Should Be 0
      Get-SQNextSequenceValue | Should Be 1
      Get-SQCurrentSequenceValue | Should Be 1
    }

    It 'returns current sequence value for default sequence' {
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 0
      Get-SQCurrentSequenceValue -SequenceName 'a' | Should Be 0
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 1
      Get-SQCurrentSequenceValue -SequenceName 'a' | Should Be 1
    }
  }
}