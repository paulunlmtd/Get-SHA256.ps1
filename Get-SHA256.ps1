#Prompt for manual entry of file location
#$File = Read-Host -Prompt 'Enter file locaion'

#Open file dialog box for location
$File = Get-FileName
$(Get-FileHash $File -Algorithm SHA256).Hash

function Get-FileName($initialDirectory)
{   
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
    Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "All files (*.*)| *.*"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}