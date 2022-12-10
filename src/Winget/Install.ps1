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
wip Grammarly.Grammarly 
wip Grammarly.Grammarly.Office 
wip Grammarly.ForWindows
wip HermannSchinagl.LinkShellExtension 
wip JanDeDobbeleer.OhMyPosh 
wip jasongin.nvs 
wip Canonical.Ubuntu
wip Kubernetes.minikube 
wip Microsoft.AzureDataStudio 
wip Microsoft.BotFrameworkComposer 
wip Microsoft.BotFrameworkEmulator 
wip Microsoft.DeploymentToolkit 
wip Microsoft.DotNet.SDK.3_1 
wip Microsoft.DotNet.SDK.5 
wip Microsoft.DotNet.SDK.6 
wip Microsoft.DotNet.SDK.7 
wip Microsoft.WindowsSDK 
wip Microsoft.OpenSSH.Beta 
wip Microsoft.PowerAppsCLI 
wip Microsoft.PowerAutomateDesktop 
wip Microsoft.PowerToys 
wip Microsoft.Sqlcmd 
wip Microsoft.Sysinternals.Autoruns 
wip Microsoft.Sysinternals.ProcessExplorer 
wip Microsoft.TeamMate 
wip Microsoft.VisualStudio.Locator 
wip Microsoft.vott 
wip Microsoft.WindowsAdminCenter 
wip Microsoft.WingetCreate 
wip Notepad++.Notepad++ 
wip OpenJS.NodeJS 
wip Postman.Postman.Canary 
wip wethat.onenotetaggingkit 
wip WinMerge.WinMerge 
wip 7zip.7zip                               
wip AgileBits.1Password           
wip CodeSector.TeraCopy 
wip DisplayLink.GraphicsDriver
wip Postman.Postman.Canary

winget install -e --id Microsoft.VisualStudio.2022.Community --override "--passive --wait --config (.\.vsconfig)"
#--add Microsoft.VisualStudio.Workload.MSBuildTools
#--add Microsoft.VisualStudio.Workload.WebBuildTools 
#--add Microsoft.VisualStudio.Workload.NodeBuildTools
#--add Microsoft.VisualStudio.Workload.DataBuildTools
#--add Microsoft.VisualStudio.Workload.ManagedDesktopBuildTools
#--add Microsoft.VisualStudio.Workload.UniversalBuildTools
#--add Microsoft.VisualStudio.Workload.VisualStudioExtensionBuildTools 
#--includeRecommended"

wip XPFFTQ037JWMHS					# Microsoft Edge Browser
wip 9NBLGGH4QGHW					# Microsoft Sticky Notes
wip 9NBLGGH5R558					# Microsoft To Do
wip 9MSPC6MP8FM4 					# Microsoft Whiteboard
wip XP8BT8DW290MPQ					# Microsoft Teams
wip 9MZ1SNWT0N5D					# PowerShell
wip 9N0DX20HK701					# Windows Terminal
wip XPDCFJDKLZJLP8					# Visual Studio Community 2022
wip XP8LFCZM790F6B					# Visual Studio Code - Insiders
wip 9WZDNCRD29V9					# Office (Microsoft 365)

wip Microsoft.BingWallpaper
wip Discord.Discord  
wip Dropbox.Dropbox 
wip Google.Drive 
wip JetBrains.Toolbox 
wip JetBrains.dotUltimate
wip ScooterSoftware.BeyondCompare4 
wip 9WZDNCRFJ2G6 					# Line

wip WiresharkFoundation.Wireshark
wip SleuthKit.Autopsy



# Likely has a have a virus! Use with caution 
# wip mentebinaria.retoolkit 