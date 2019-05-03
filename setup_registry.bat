@echo off

reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer /f /t REG_DWORD /v EnableAutoTray /d 0
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /f /t REG_DWORD /v DisallowShaking /d 1
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation /f /t REG_DWORD /v RealTimeIsUniversal /d 1
