@echo off
call "%userprofile%\win-dotfiles\elevate.bat" %~0
if %errorlevel% == 1 exit /b

forfiles /p "%userprofile%\win-dotfiles\shortcuts" /c "cmd /c cd \"%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\" & mklink @file @path"
forfiles /p "%userprofile%\win-dotfiles\startup" /c "cmd /c cd \"%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" & mklink @file @path & if @ext == \"bat\" (cmd /c @path) else (start \"\" @path)"
