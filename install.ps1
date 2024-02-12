Write-Host "This script will backup your nvim config and delete:"
Write-Host " - \$HOME\AppData\Local\nvim -> \$HOME\AppData\Local\nvim.backup"
Write-Host " - \$HOME\AppData\Local\nvim-data\*"
Write-Host "And install the new configuration"
Write-Host "Are you sure? [y/N]: "
$choice = Read-Host
if ($choice -ne "y" -and $choice -ne "Y") {
  exit 1
}

$nvimBackupPath = Join-Path $env:LOCALAPPDATA 'nvim.backup'

if (Test-Path -Path $nvimBackupPath -PathType Container) {
    Remove-Item -Path $nvimBackupPath -Recurse -Force
}
Rename-Item -Path (Join-Path $env:LOCALAPPDATA 'nvim') -NewName 'nvim.backup'

$nvimDataPath = Join-Path $env:LOCALAPPDATA 'nvim-data'

if (Test-Path -Path $nvimDataPath -PathType Container) {
    Remove-Item -Path $nvimDataPath -Recurse -Force
}

$destinationPath = Join-Path $env:LOCALAPPDATA 'nvim'
$tempPath = Join-Path $env:TEMP 'nvim_temp'
Expand-Archive -Path "nvim.zip" -DestinationPath $tempPath -Force
Move-Item -Path (Join-Path $tempPath 'nvim\*') -Destination $destinationPath -Force
Remove-Item -Path $tempPath -Recurse -Force
Write-Host "Done"
