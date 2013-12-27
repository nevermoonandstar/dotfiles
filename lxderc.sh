#Reference this file in ~/.config/lxsession/Lubuntu/autostart
#Remember to make this file executable and call by
# /home/{user}/lxderc.sh

dropbox start #Start Dropbox
gnome-terminal --window --full-screen #Terminal Screen @ Start
xfce4-power-manager #Start power daemon, since Lubuntu doesn't
#Move my org files into my Dropbox at startup
find '/home/hoppe/org' '/home/hoppe/org_files' -type f | xargs mv -t /home/hoppe/Dropbox/org_files
#Move any local documents into my Dropbox
find '/home/hoppe/Documents' -type f | xargs mv -t /home/hoppe/Dropbox/personal_docs
