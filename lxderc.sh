#Reference this file in ~/.config/lxsession/Lubuntu/autostart
#Remember to make this file executable and call by
# /home/{user}/lxderc.sh

setxkbmap -option ctrl:nocaps #Caps = Control
synclient MaxTapTime=0 #Disable Tap To Click

dropbox start #Start Dropbox

gnome-terminal --window --full-screen #Terminal Screen @ Start
