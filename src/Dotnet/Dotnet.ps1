$DownloadAndInstall= $PSScriptRoot+"\install-vsix.ps1"
& $DownloadAndInstall -PackageName "4a196712-2c3f-4730-ad1d-e7cda4185eb3"

refreshenv;
dotnet tool install --global dotnet-ef;
dotnet tool install --global dotnet-update-all-tools;
dotnet tool install --global dotnet-codegencs;
dotnet tool install --global jetbrains.resharper.globaltools;
dotnet tool install --global upgrade-assistant;
dotnet tool install --global dotnet-outdated-tool;