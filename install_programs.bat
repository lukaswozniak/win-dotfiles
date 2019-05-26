@echo off
call "%userprofile%\win-dotfiles\elevate.bat" %~0
if %errorlevel% == 1 exit /b

set need_reboot=false

rem Install VirtualBox
if not exist "C:\Program Files\Oracle\VirtualBox" (
	if not exist "%userprofile%\win-dotfiles\downloads\virtualbox.exe" (
		echo "Downloading VirtualBox..."
		"%userprofile%\win-dotfiles\bin\wget" -O "%userprofile%\win-dotfiles\downloads\virtualbox.exe" "https://download.virtualbox.org/virtualbox/6.0.6/VirtualBox-6.0.6-130049-Win.exe"
	)
	"%userprofile%\win-dotfiles\downloads\virtualbox.exe"
)

rem Install Vagrant
if not exist "C:\HashiCorp\Vagrant" (

	if not exist "%userprofile%\win-dotfiles\downloads\vagrant.msi" (
		echo "Downloading Vagrant..."
		"%userprofile%\win-dotfiles\bin\wget" -O "%userprofile%\win-dotfiles\downloads\vagrant.msi" "https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.msi"
	)
	"%userprofile%\win-dotfiles\downloads\vagrant.msi"
	set need_reboot=true
)

rem Install OpenSSH
if not exist "C:\Program Files\OpenSSH" (
	if not exist "%userprofile%\win-dotfiles\downloads\OpenSSH-Win64.zip" (
		echo "Downloading OpenSSH..."
		"%userprofile%\win-dotfiles\bin\wget" -O "%userprofile%\win-dotfiles\downloads\OpenSSH-Win64.zip" "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v7.9.0.0p1-Beta/OpenSSH-Win64.zip"
	)
	"%userprofile%\win-dotfiles\bin\unzip" "%userprofile%\win-dotfiles\downloads\OpenSSH-Win64.zip" -d "C:\Program Files\OpenSSH"
	setx path "%PATH%;C:\Program Files\OpenSSH\OpenSSH-Win64" /M
)

rem Install AutoHotkey
if not exist "C:\Program Files\AutoHotkey" (
	if not exist "%userprofile%\win-dotfiles\downloads\ahk-install.exe" (
		echo "Downloading AutoHotkey..."
		"%userprofile%\win-dotfiles\bin\wget" -O "%userprofile%\win-dotfiles\downloads\ahk-install.exe" "https://www.autohotkey.com/download/ahk-install.exe"
	)
	"%userprofile%\win-dotfiles\downloads\ahk-install.exe"
)

rem Install StartIsBack
if not exist "C:\Program Files (x86)\StartIsBack" (
    if not exist "%userprofile%\win-dotfiles\downloads\startisback.exe" (
        echo "Downloading StartIsBack..."
        "%userprofile%\win-dotfiles\bin\wget" -O "%userprofile%\win-dotfiles\downloads\startisback.exe" "https://s3.amazonaws.com/startisback/StartIsBackPlusPlus_setup.exe"
    )
    "%userprofile%\win-dotfiles\downloads\startisback.exe"
)

rem Install PuTTY
if not exist "C:\Program Files\PuTTY" (
    if not exist "%userprofile%\win-dotfiles\downloads\putty.msi" (
        echo "Downloading PuTTY..."
        "%userprofile%\win-dotfiles\bin\wget" -O "%userprofile%\win-dotfiles\downloads\putty.msi" "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.71-installer.msi"
    )
    "%userprofile%\win-dotfiles\downloads\putty.msi"
)
call "configure_putty_profile.bat"

if %need_reboot% equ true (
	call "%userprofile%/win-dotfiles/reboot_and_continue.bat"
)
