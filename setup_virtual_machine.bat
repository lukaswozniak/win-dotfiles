@echo off

choco install vagrant virtualbox -y

git clone git@github.com:lukaswozniak/vagrant.git %userprofile%/vagrant
cd %userprofile%/vagrant
vagrant --user=%linuxuser% --password=%linuxpassword% --githubuser=%githubuser% --githubpassword=%githubpassword% up
