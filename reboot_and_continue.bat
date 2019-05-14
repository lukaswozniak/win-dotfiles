@echo off

xcopy "%userprofile%\win-dotfiles\setup.bat" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
shutdown.exe /r /t 00
