@echo off
call "%userprofile%\win-dotfiles\elevate.bat" %~0
if %errorlevel% == 1 exit /b

git config --global core.autocrlf false
git config --global user.name "Lukasz Wozniak"
git config --global user.email "lukas.wozniak@outlook.com"

call "%userprofile%\win-dotfiles\setup_registry.bat"
call "%userprofile%\win-dotfiles\setup_shortcuts_and_startup.bat"
call "%userprofile%\win-dotfiles\configure_putty_profile.bat"
call "%userprofile%\win-dotfiles\restart_explorer.bat"

"%userprofile%\win-dotfiles\bin\SetWallpaper.exe" "%userprofile%\win-dotfiles\wallpaper.jpg"

pause
