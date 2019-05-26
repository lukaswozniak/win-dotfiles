@echo off
call "%userprofile%\win-dotfiles\elevate.bat" %~0
if %errorlevel% == 1 exit /b

"%userprofile%\win-dotfiles\bin\WinSCP.com" /keygen "%userprofile%\.ssh\id_rsa" /output="%userprofile%\.ssh\id_rsa.ppk"
reg import "%userprofile%\win-dotfiles\putty-sessions.reg"
reg add "HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\linux" /f /t REG_SZ /v PublicKeyFile /d "%userprofile%\.ssh\id_rsa.ppk"
pause
