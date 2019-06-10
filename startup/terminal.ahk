#SingleInstance Force

^!t:: ; Ctrl+Alt+t
EnvGet, userProfile, USERPROFILE
Run putty.exe -load linux,,max
