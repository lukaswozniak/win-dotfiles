@echo off

call %userprofile%/win-dotfiles/setup_registry.bat

call %userprofile%/win-dotfiles/setup_virtual_machine.bat

call %userprofile%/win-dotfiles/setup_x_server.bat

call %userprofile%/win-dotfiles/setup_shortcuts_and_startup.bat

call %userprofile%/win-dotfiles/restart_explorer.bat

del "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\setup_as_admin.lnk"
pause
