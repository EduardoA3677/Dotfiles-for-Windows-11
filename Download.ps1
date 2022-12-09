$GitHubRepositoryName = 'Dotfiles-for-Windows-11';

# Request custom values
$ComputerName = ( ($defaultValue = 'NFG-PC'), (Read-Host "Input the new computer name here [$defaultValue]")) -match '\S' | Select-Object -Last 1

$GitUserName =  ( ($defaultValue = 'DakineMI'), (Read-Host "Input your Git user name here [$defaultValue]")) -match '\S' | Select-Object -Last 1

$GitUserEmail = ( ($defaultValue = 'Jonathan.m.hughes.1@gmail.com'), (Read-Host "Input your Git user email here [$defaultValue]")) -match '\S' | Select-Object -Last 1

$ValidDisks = Get-PSDrive -PSProvider "FileSystem" | Select-Object -ExpandProperty "Root";
do {
  Write-Host "Choose the location of your development workspace:" -ForegroundColor "Green";
  Write-Host $ValidDisks -ForegroundColor "Green";
  $WorkspaceDisk = ( ($defaultValue = 'C:\'), (Read-Host "Please choose one of the available disks [$defaultValue]")) -match '\S' | Select-Object -Last 1

}
while (-not ($ValidDisks -Contains $WorkspaceDisk));

$GitHubRepositoryUri = "https://github.com/${GitUserName}/${GitHubRepositoryName}/archive/refs/heads/main.zip";

$DotfilesFolder = Join-Path -Path $HOME -ChildPath '.dotfiles';
$ZipRepositoryFile = Join-Path -Path $DotfilesFolder -ChildPath "${GitHubRepositoryName}-main.zip";
$DotfilesWorkFolder = Join-Path -Path $DotfilesFolder -ChildPath "${GitHubRepositoryName}-main" | Join-Path -ChildPath 'src';

$DownloadResult = $FALSE;

# Create Dotfiles folder
if (Test-Path $DotfilesFolder) {
  Remove-Item -Path $DotfilesFolder -Recurse -Force;
}
New-Item $DotfilesFolder -ItemType directory;

# Download Dotfiles repository as Zip
Try {
  Invoke-WebRequest $GitHubRepositoryUri -O $ZipRepositoryFile;
  $DownloadResult = $TRUE;
}
catch [System.Net.WebException] {
  Write-Host "Error connecting to GitHub, check the internet connection or the repository url." -ForegroundColor "Red";
}

if ($DownloadResult) {
  Add-Type -AssemblyName System.IO.Compression.FileSystem;
  [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipRepositoryFile, $DotfilesFolder);
  Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "Setup.ps1");
}

function LoadModule(
    [CmdletBinding()]
    [Parameter(Position = 0)][System.String]$module)
{
	if (!(Get-Module -ListAvailable -Name $module)) {
		Install-Module $module
	}

	Import-Module $module;
}


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

LoadModule "PoshFunctions";