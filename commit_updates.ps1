$gitdir = Get-Location
Set-Location $env:LOCALAPPDATA
Rename-Item -Path .\nvim.zip -NewName nvim.zip.old -ErrorAction SilentlyContinue
Compress-Archive -Path .\nvim -DestinationPath "$gitdir\nvim.zip" -Force
Set-Location $gitdir
git add nvim.zip
git commit -m "updated nvim config"
git push
