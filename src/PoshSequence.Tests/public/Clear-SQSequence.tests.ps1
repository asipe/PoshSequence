Describe 'Clear-SQSequence' {
  BeforeEach {
    Clear-SQAllSequences
  }

  Context 'usage' {
    It 'clears the default sequence value' {
      Get-SQNextSequenceValue | Should Be 0
      Get-SQNextSequenceValue | Should Be 1
      Clear-SQSequence | Should Be $null
      Get-SQNextSequenceValue | Should Be 0
    }

    It 'clears a custom sequence value' {
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 0
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 1
      Clear-SQSequence -SequenceName 'a' | Should Be $null
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 0
    }

    It 'only clears the specified sequence' {
      Get-SQNextSequenceValue | Should Be 0
      Get-SQNextSequenceValue | Should Be 1
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 0
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 1
      Clear-SQSequence -SequenceName 'a' | Should Be $null
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 0
      Get-SQNextSequenceValue | Should Be 2
    }
  }
}