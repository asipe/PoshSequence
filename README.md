# PoshSequence

Small module that allows a named sequence of numbers to be incremented, retrieved, saved and stored.

## Installation

Install from Powershell Gallery: [PoshSequence](https://www.powershellgallery.com/packages/PoshSequence)

## Examples

```powershell
#clear any previously defined sequences in this session (optional)
Clear-SQAllSequences

#default sequence value
Get-SQNextSequenceValue | Write-Host
Get-SQNextSequenceValue | Write-Host
Get-SQNextSequenceValue | Write-Host

#SequenceNamed sequence value
Get-SQNextSequenceValue -SequenceName 'sequence1' | Write-Host
Get-SQNextSequenceValue -SequenceName 'sequence1' | Write-Host

#get current sequence value without incrementing
Get-SQCurrentSequenceValue | Write-Host
Get-SQCurrentSequenceValue -SequenceName 'sequence1' | Write-Host

#save sequence state
$sequencePath = [System.IO.Path]::GetTempFileName()
Save-SQSequences -Path $sequencePath

#clear specifc sequence
Clear-SQSequence -SequenceName 'sequence1'
Get-SQCurrentSequenceValue | Write-Host
Get-SQCurrentSequenceValue -SequenceName 'sequence1' | Write-Host

#clear all sequence values
Clear-SQAllSequences
Get-SQCurrentSequenceValue | Write-Host
Get-SQCurrentSequenceValue -SequenceName 'sequence1' | Write-Host

#set sequence to specific value
Set-SQCurrentSequenceValue -Value 100
Set-SQCurrentSequenceValue -SequenceName 'sequence1' -Value 1000
Get-SQCurrentSequenceValue | Write-Host
Get-SQCurrentSequenceValue -SequenceName 'sequence1' | Write-Host

#restore previous sequence state
Read-SQSequences -Path $sequencePath
Get-SQCurrentSequenceValue | Write-Host
Get-SQCurrentSequenceValue -SequenceName 'sequence1' | Write-Host

#clean up 
Remove-Item -Path $sequencePath 
```

## Notes

This module does not support multiple processes writing to the sequence file at the same time.

## License

```
MIT License

Copyright (c) 2017 Andy Sipe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```

