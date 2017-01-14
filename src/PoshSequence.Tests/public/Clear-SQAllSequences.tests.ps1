Describe 'Clear-SQAllSequences' {
  BeforeEach {
    Clear-SQAllSequences
  }

  Context 'usage' {
    It 'clears all sequence values when none defined' {
      Clear-SQAllSequences | Should Be $null
      Get-SQCurrentSequenceValue | Should Be 0
    }

    It 'clears all sequence values when some defined' {
      Get-SQNextSequenceValue | Should Be 0
      Get-SQNextSequenceValue | Should Be 1
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 0
      Get-SQNextSequenceValue -SequenceName 'a' | Should Be 1
      Clear-SQAllSequences | Should Be $null
      Get-SQCurrentSequenceValue | Should Be 0
      Get-SQCurrentSequenceValue -SequenceName 'a' | Should Be 0
    }
  }
}