Describe 'Get-SQNextSequenceValue' {
  BeforeEach {
    Clear-SQAllSequence
  }

  Context 'usage' {
    It 'works with default sequence' {
      Get-SQNextSequenceValue | Should Be 0
      Get-SQNextSequenceValue | Should Be 1
      Get-SQNextSequenceValue | Should Be 2
    }

    It 'works with custom sequence' {
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 0
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 1
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 2
    }

    It 'works with mixed default and custom sequences' {
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 0
      Get-SQNextSequenceValue | Should Be 0
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 1
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 2
      Get-SQNextSequenceValue | Should Be 1
      Get-SQNextSequenceValue -SequenceName 'b' | Should Be 0
      Get-SQNextSequenceValue -SequenceName 'b' | Should Be 1
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 3
    }
  }
}