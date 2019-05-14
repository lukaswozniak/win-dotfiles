@echo off

set /p linuxuser="Enter linux vm username (default lukaszw): "
if "%linuxuser%" == "" (
	set linuxuser="lukaszw"
)
cd "%userprofile%\win-dotfiles\submodules\vagrant"
vagrant --user=%linuxuser% up
