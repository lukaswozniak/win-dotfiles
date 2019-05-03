@echo off

choco install vcxsrv -y
call %userprofile%/win-dotfiles/shortcuts/Startup/config.xlaunch
