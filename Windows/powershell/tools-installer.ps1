Write-Host "Downloading NVM..."

$url = "https://github.com/coreybutler/nvm-windows/releases/download/1.1.12/nvm-setup.exe"
$file = "$env:TEMP\nvm-setup.exe"

Invoke-WebRequest -Uri $url -OutFile $file

Write-Host ""
Write-Host "Installing NVM..."

Start-Process -FilePath $file `
    -ArgumentList "/SILENT" `
    -Wait

Start-Sleep -Seconds 3

Write-Host ""
Write-Host "Installing NodeJS..."
& nvm install 24
& nvm install 20
& nvm install 14
& nvm use 24

Remove-Item $file -Force

Write-Host ""
Write-Host "NVM and NodeJS installation finished!"
Write-Host ""
Write-Host "---"
Write-Host ""

Write-Host "Downloading Git..."

$url = "https://github.com/git-for-windows/git/releases/download/v2.54.0.windows.1/Git-2.54.0-64-bit.exe"
$file = "$env:TEMP\Git-2.54.0-64-bit.exe"

Invoke-WebRequest -Uri $url -OutFile $file

Write-Host ""
Write-Host "Installing Git..."

Start-Process -FilePath $file `
    -ArgumentList "/SILENT" `
    -Wait

Start-Sleep -Seconds 3

Write-Host ""
Write-Host "Setting Git configs..."
& git config --global init.defaultBranch "main"
& git config --global core.longpaths true
& git config --global alias.cp "cherry-pick"
& git config --global alias.cm "commit -m"
& git config --global alias.c "!git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done"

New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" `
-Name "LongPathsEnabled" `
-Value 1 `
-PropertyType DWORD `
-Force

Write-Host ""
Write-Host "Git installation finished!"
Write-Host ""
Write-Host "---"
Write-Host ""