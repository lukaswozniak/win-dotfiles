@echo off

xcopy /s/e/y "%userprofile%/win-dotfiles/shortcuts" "%userprofile%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs"

choco install autohotkey -y
forfiles /p %userprofile%\win-dotfiles\shortcuts\Startup /m *.ahk /c "cmd /c start \"\" @path"
