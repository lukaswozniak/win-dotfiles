@echo off
call "%userprofile%\win-dotfiles\elevate.bat" %~0
if %errorlevel% == 1 exit /b

rem System tray expanded
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer /f /t REG_DWORD /v EnableAutoTray /d 0

rem Shake to hide all windows disabled
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /f /t REG_DWORD /v DisallowShaking /d 1

rem Time in UTC for dual booting
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation /f /t REG_DWORD /v RealTimeIsUniversal /d 1

rem Show file extensions
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /f /t REG_DWORD /v HideFileExt /d 0