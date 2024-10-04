Remove-Item -Recurse -Force "$env:APPDATA\alacritty"
New-Item -Path "$env:APPDATA\alacritty" -ItemType SymbolicLink -Value .\
