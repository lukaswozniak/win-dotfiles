@echo off

call %userprofile%/win-dotfiles/setup_registry.bat

call %userprofile%/win-dotfiles/setup_virtual_machine.bat

call %userprofile%/win-dotfiles/setup_x_server.bat

call %userprofile%/win-dotfiles/setup_shortcuts_and_startup.bat

call %userprofile%/win-dotfiles/restart_explorer.bat

pause
