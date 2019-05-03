@echo off

set /p linuxuser="Enter linux vm username: "
set /p linuxpassword="Enter linux vm password: "
set /p githubuser="Enter github username: "
set /p githubpassword="Enter github password: "

where choco
if %errorlevel% neq 0 (
    "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

choco install git /GitOnlyOnPath /NoAutoCrlf /WindowsTerminal /NoShellIntegration -y
git config --global core.autocrlf false
choco install openssh curl -y

echo(n|ssh-keygen -t rsa -N "" -f %userprofile%/.ssh/id_rsa
set /p key=<%userprofile%/.ssh/id_rsa.pub

curl -u "%githubuser%:%githubpassword%" -X POST -d "{\"title\":\"\",\"key\":\"%key%\"}" https://api.github.com/user/keys
ssh-keyscan -t rsa -H github.com >> %userprofile%/.ssh/known_hosts
ssh -T git@github.com

git clone git@github.com:lukaswozniak/win-dotfiles.git %userprofile%/win-dotfiles
cd %userprofile%/win-dotfiles

call setup.bat
