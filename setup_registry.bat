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

rem All connections as metered to disable feature updates
%userprofile%\win-dotfiles\bin\SetACL -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" -ot reg -actn setowner -ownr "n:Administrators"
%userprofile%\win-dotfiles\bin\SetACL -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" -ot reg -actn ace -ace "n:Administrators;p:full"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" /f /t REG_DWORD /v Default /d 2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" /f /t REG_DWORD /v Ethernet /d 2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\DefaultMediaCost" /f /t REG_DWORD /v WiFi /d 2
