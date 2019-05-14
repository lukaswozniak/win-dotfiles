#SingleInstance Force

^!t:: ; Ctrl+Alt+t
EnvGet, userProfile, USERPROFILE
Run ssh.exe localhost -p 2222 "source ~/.profile && DISPLAY=10.0.2.2:0.0 nohup st>/dev/null 2>&1",, Hide