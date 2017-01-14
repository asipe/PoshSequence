Describe 'Save-SQSequences' {
  Context 'usage' {
    BeforeEach {
      Clear-SQAllSequence
      $path = Join-Path $TestDrive 'sequences.json'
    }

    It 'saves empty sequences' {
      Save-SQSequences -Path $path | Should Be $null
      $data = Get-Content -Path $path -Raw | ConvertFrom-Json
      @($data.PSObject.Properties).Length | Should Be 0
    }

    It 'saves with sequences' {
      Set-SQCurrentSequenceValue -SequenceName 'a' -Value 10
      Set-SQCurrentSequenceValue -SequenceName 'b' -Value 20
      Save-SQSequences -Path $path | Should Be $null
      $data = Get-Content -Path $path -Raw | ConvertFrom-Json
      $data.a | Should Be 10
      $data.b | Should Be 20
      @($data.PSObject.Properties).Length | Should Be 2
    }

   It 'overwrites existing save file' {
      Save-SQSequences -Path $path | Should Be $null
      Set-SQCurrentSequenceValue -SequenceName 'a' -Value 10
      Save-SQSequences -Path $path | Should Be $null
      $data = Get-Content -Path $path -Raw | ConvertFrom-Json
      $data.a | Should Be 10
      @($data.PSObject.Properties).Length | Should Be 1
    }
  }
}