# install chocolatey package manager
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# install tooling
$packages = @(
    "git"
    "poshgit"
    "vscode"
    "virtualbox"
    "vagrant"
    #"visualstudio2019community"
)
foreach ($package in $packages)
{
    cinst $package -y 
}

$feature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All

if ($feature.State -like 'Enabled')
{
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
}