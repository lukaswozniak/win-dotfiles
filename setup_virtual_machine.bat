@echo off

set /p linuxuser="Enter linux vm username: "
set /p linuxpassword="Enter linux vm password: "
set /p githubuser="Enter github username: "
set /p githubpassword="Enter github password: "

git clone git@github.com:lukaswozniak/vagrant.git %userprofile%/vagrant
cd %userprofile%/vagrant
vagrant --user=%linuxuser% --password=%linuxpassword% --githubuser=%githubuser% --githubpassword=%githubpassword% up
