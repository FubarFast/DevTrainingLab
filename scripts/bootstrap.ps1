# install chocolatey package manager
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install tooling
$packages = @(
    "git"
    "poshgit"
    "vscode"
    "visualstudio2019community"
)
foreach ($package in $packages)
{
    cinst $package -y 
}