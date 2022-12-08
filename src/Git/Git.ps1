function Set-Git-Configuration {
  Write-Host "Configuring Git:" -ForegroundColor "Green";
  git config --global user.name $Config.GitUserName;
  git config --global user.email $Config.GitUserEmail;
  git config --global push.default current
  git config --global push.autoSetupRemote true
  git config --global pull.rebase true
  git config --global core.editor code-insiders -w
  git config --global init.defaultBranch main
  Write-Host "Git was successfully configured." -ForegroundColor "Green";
}

choco install -y "git" --params "/NoAutoCrlf /WindowsTerminal /NoShellIntegration /SChannel";
Set-Git-Configuration;
