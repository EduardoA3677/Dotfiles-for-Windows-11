function Set-VSCode-Configuration {
  $VSCodeSettingsPath = Join-Path -Path $env:appdata -ChildPath "Code" | Join-Path -ChildPath "User";
  $DotfilesVSCodeSettingsFolder = Join-Path -Path $DotfilesWorkFolder -ChildPath "VSCode";
  
  if (-not (Test-Path -Path $VSCodeSettingsPath)) {
    Write-Host "Configuring Visual Studio Code:" -ForegroundColor "Green";
    New-Item $VSCodeSettingsPath -ItemType directory;
  }

  Get-ChildItem -Path "${DotfilesVSCodeSettingsFolder}\*" -Include "*.json" -Recurse | Copy-Item -Destination $VSCodeSettingsPath;
}

Set-VSCode-Configuration;
refreshenv;
# Formatting and Rules
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension esbenp.prettier-vscode --force
code --install-extension aaron-bond.better-comments --force
code --install-extension oderwat.indent-rainbow --force
code --install-extension ue.alphabetical-sorter --force
# HTML and CSS
code --install-extension formulahendry.auto-rename-tag --force
code --install-extension naumovs.color-highlight --force
code --install-extension anteprimorac.html-end-tag-labels --force
# Git
code --install-extension github.vscode-pull-request-github --force
code --install-extension eamodio.gitlens-insiders --force
code --install-extension usernamehw.errorlens -- force
# Angular
code --install-extension angular.ng-template --force
# .NET
code --install-extension ms-dotnettools.csharp --force
code --install-extension visualstudioexptteam.vscodeintellicode --force
# Test Runners
code --install-extension ms-playwright.playwright --force
# Markdown
code --install-extension yzhang.markdown-all-in-one --force
code --install-extension davidanson.vscode-markdownlint --force
code --install-extension robole.markdown-snippets -- force
# Rest Client
code --install-extension rangav.vscode-thunder-client --force
# Miscellaneous
code --install-extension github.copilot --force
code --install-extension ms-azuretools.vscode-docker -- force
code --install-extension pkief.material-icon-theme -- force

code --install-extension ms-vscode.powershell -- force
code --install-extension ms-vscode-remote.remote-containers -- force
code --install-extension ms-vscode-remote.remote-wsl -- force