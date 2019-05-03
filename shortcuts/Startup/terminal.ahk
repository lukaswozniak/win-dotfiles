#SingleInstance Force

^!t:: ; Ctrl+Alt+t
EnvGet, userProfile, USERPROFILE
Run %userProfile%/win-dotfiles/shortcuts/terminal
