function Set-VSCode-Configuration {
  $VSCodeSettingsPath = Join-Path -Path $env:appdata -ChildPath "Code" | Join-Path -ChildPath "User";
  $DotfilesVSCodeSettingsFolder = Join-Path -Path $DotfilesWorkFolder -ChildPath "VSCode";
  
  if (-not (Test-Path -Path $VSCodeSettingsPath)) {
    Write-Host "Configuring Visual Studio Code:" -ForegroundColor "Green";
    New-Item $VSCodeSettingsPath -ItemType directory;
  }

  Get-ChildItem -Path "${DotfilesVSCodeSettingsFolder}\*" -Include "*.json" -Recurse | Copy-Item -Destination $VSCodeSettingsPath;
}

choco install -y "vscode" --params "/NoDesktopIcon /NoQuicklaunchIcon /NoContextMenuFiles /NoContextMenuFolders";
Set-VSCode-Configuration;
refreshenv;
# Formatting and Rules
code-insiders --install-extension dbaeumer.vscode-eslint --force
code-insiders --install-extension esbenp.prettier-vscode --force
code-insiders --install-extension aaron-bond.better-comments --force
code-insiders --install-extension oderwat.indent-rainbow --force
code-insiders --install-extension ue.alphabetical-sorter --force
# HTML and CSS
code-insiders --install-extension formulahendry.auto-rename-tag --force
code-insiders --install-extension naumovs.color-highlight --force
code-insiders --install-extension anteprimorac.html-end-tag-labels --force
# Git
code-insiders --install-extension github.vscode-pull-request-github --force
code-insiders --install-extension eamodio.gitlens-insiders --force
code-insiders --install-extension usernamehw.errorlens -- force
# Angular
code-insiders --install-extension angular.ng-template --force
# .NET
code-insiders --install-extension ms-dotnettools.csharp --force
code-insiders --install-extension visualstudioexptteam.vscodeintellicode --force
# Test Runners
code-insiders --install-extension ms-playwright.playwright --force
# Markdown
code-insiders --install-extension yzhang.markdown-all-in-one --force
code-insiders --install-extension davidanson.vscode-markdownlint --force
code-insiders --install-extension robole.markdown-snippets -- force
# Rest Client
code-insiders --install-extension rangav.vscode-thunder-client --force
# Miscellaneous
code-insiders --install-extension github.copilot --force
code-insiders --install-extension ms-azuretools.vscode-docker -- force
code-insiders --install-extension pkief.material-icon-theme -- force

code-insiders --install-extension ms-vscode.powershell -- force
code-insiders --install-extension ms-vscode-remote.remote-containers -- force
code-insiders --install-extension ms-vscode-remote.remote-wsl -- force