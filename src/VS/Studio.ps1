$files = Get-ChildItem -Path ",\" -Include "*.json" -Recurse
ForEach($file in $files) {
    winget install --accept-package-agreements --accept-source-agreements $file.FullName
}
