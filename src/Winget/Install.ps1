function WingetInstallPackage(
    
    [CmdletBinding()]
    [Alias("WIP")]
    [Parameter(Position = 0)][System.String]$package)
{
    $item = $wingetList | Where-Object IdPrefix -eq $package 
    $status = if($item) {if($item.Available){'Upgrade'}else{'Current'}} else {'Install'}
    if($status -eq 'Current')
    {
        Write-Host -Fore Yellow ` ($package + ' installed at current version')
    }
    if($status -eq 'Install')
    {
        Write-Host -Fore Yellow ` ('Installing ' + $package)
        winget install $package -h --exact --accept-source-agreements --accept-package-agreements --force
    }
    if($status -eq 'Upgrade') 
    {
        Write-Host -Fore Yellow ` ('Upgrading ' + $package)
        winget upgrade $package -h --exact --accept-source-agreements --accept-package-agreements --include-unknown --force
    }
}
Set-Alias -Name "WIP" -Value "WingetInstallPackage";

function WingetUninstallPackage(

    [CmdletBinding()]
    [Alias("WUIP")]
    [Parameter(Position = 0)][System.String]$package)
{
    if(winget list --exact -q=$package) 
    {
        Write-Host -Fore Yellow ` ('Uninstalling ' + $package)
        winget uninstall $package -h --exact 
    }
}
Set-Alias -Name "WUIP" -Value "WingetUninstallPackage";

winget source list
winget source update
$wingetList = Invoke-WingetList
#$InstalledSoftware = Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
#foreach($obj in $InstalledSoftware){write-host $obj.GetValue('DisplayName') -NoNewline; write-host " | " -NoNewline; write-host $obj.GetValue('DisplayVersion')}

wip Microsoft.NuGet 
wip Git.Git 
wip GitExtensionsTeam.GitExtensions 
wip GitHub.cli 
wip HermannSchinagl.LinkShellExtension 
wip JanDeDobbeleer.OhMyPosh 
wip jasongin.nvs 
wip Microsoft.OpenSSH.Beta 
wip Microsoft.vott 
wip Microsoft.WingetCreate 
wip OpenJS.NodeJS 

#winget install -e --id Microsoft.VisualStudio.2022.Community --override "--passive --wait --config (.\.vsconfig)"

wip 9MZ1SNWT0N5D					# PowerShell
wip 9N0DX20HK701					# Windows Terminal

# Likely has a have a virus! Use with caution 
# wip mentebinaria.retoolkit 
