@echo off
call "%userprofile%\win-dotfiles\elevate.bat" %~0
if %errorlevel% == 1 exit /b

git submodule update --init --recursive --remote

git config --global core.autocrlf false
git config --global user.name "Lukasz Wozniak"
git config --global user.email "lukas.wozniak@outlook.com"

call "%userprofile%\win-dotfiles\install_programs.bat"
call "%userprofile%\win-dotfiles\setup_virtual_machine.bat"

call "%userprofile%\win-dotfiles\setup_registry.bat"
call "%userprofile%\win-dotfiles\restart_explorer.bat"

del "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\setup.bat"
pause
