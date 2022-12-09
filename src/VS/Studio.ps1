$files = Get-ChildItem -Path ",\" -Include "*.json" -Recurse
ForEach($file in $files) {
    winget install --accept-package-agreements --accept-source-agreements $file.FullName
}

dotnet tool install --global dotnet-ef;
dotnet tool install --global dotnet-update-all-tools;
dotnet tool install --global dotnet-codegencs;
dotnet tool install --global jetbrains.resharper.globaltools;
dotnet tool install --global upgrade-assistant;
dotnet tool install --global dotnet-outdated-tool;