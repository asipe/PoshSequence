Describe 'Read-SQSequences' {
  Context 'usage' {
    BeforeEach {
      Clear-SQAllSequences
      $path = Join-Path $TestDrive 'sequences.json'
    }

    It 'loads empty sequences' {
      Save-SQSequences -Path $path | Should Be $null
      Clear-SQAllSequences
      Get-SQNextSequenceValue | Should Be 0
      Get-SQNextSequenceValue | Should Be 1
      Read-SQSequences -Path $path | Should Be $null
      Get-SQNextSequenceValue | Should Be 0
    }

    It 'loads save with sequences' {
      Set-SQCurrentSequenceValue -SequenceName 'a' -Value 10
      Set-SQCurrentSequenceValue -SequenceName 'b' -Value 20
      Save-SQSequences -Path $path | Should Be $null
      Clear-SQAllSequences
      Get-SQCurrentSequenceValue -SequenceName 'a' | Should Be 0
      Get-SQCurrentSequenceValue -SequenceName 'b' | Should Be 0
      Read-SQSequences -Path $path | Should Be $null
      Get-SQCurrentSequenceValue -SequenceName 'a' | Should Be 10
      Get-SQCurrentSequenceValue -SequenceName 'b' | Should Be 20
    }

    It 'fully clears all existing sequences when loading' {
      Set-SQCurrentSequenceValue -SequenceName 'a' -Value 10
      Set-SQCurrentSequenceValue -SequenceName 'b' -Value 20
      Save-SQSequences -Path $path | Should Be $null
      Set-SQCurrentSequenceValue -SequenceName 'c' -Value 50
      Read-SQSequences -Path $path | Should Be $null
      Get-SQCurrentSequenceValue -SequenceName 'a' | Should Be 10
      Get-SQCurrentSequenceValue -SequenceName 'b' | Should Be 20
      Get-SQCurrentSequenceValue -SequenceName 'c' | Should Be 0
    }
  }
}