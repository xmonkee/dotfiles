feh --bg-center $HOME/Desktop/Media/Images/city.jpg
setxkbmap -option ctrl:swapcaps &
xautolock -time 5 -locker $HOME/.config/i3/lock &
xss-lock -- $HOME/.config/i3/lock &
xinput set-prop 'DLL06E5:01 06CB:7A13 Touchpad' 'libinput Natural Scrolling Enabled' 1 &
#enpass &
compton &
caffeine &
~/.pia_manager/pia_manager/run.sh --startup &
caffeine-indicator &
nm-applet &
blueman-applet &
volti &
indicator-sound-switcher &
redshift-gtk &
clipit &
dropbox start &
albert &
#google-chrome &
#spotify &
killall statusbar 
~/.config/scripts/statusbar &
