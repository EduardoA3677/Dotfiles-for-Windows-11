choco install -y "dotnet-sdk";
refreshenv;
dotnet tool install --global dotnet-ef;
dotnet tool install --global dotnet-update-all-tools;
dotnet tool install --global dotnet-codegencs;
dotnet tool install --global jetbrains.resharper.globaltools;
dotnet tool install --global upgrade-assistant;
dotnet tool install --global dotnet-outdated-tool;