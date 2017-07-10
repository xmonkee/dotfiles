#!/bin/sh
feh --bg-scale $HOME/wallpaper
xbindkeys_autostart
setxkbmap -option ctrl:swapcaps &
pgrep xautolock || xautolock -time 5 -locker $HOME/.config/i3/lock &
pgrep xss-lock || xss-lock -- $HOME/.config/i3/lock &
xinput set-prop 'DLL06E5:01 06CB:7A13 Touchpad' 'libinput Natural Scrolling Enabled' 1 &
pgerp enpass || enpass &
killall caffeine;  caffeine & 
#killall caffeine-indicator; caffeine-indicator & 
pgrep nm-applet || nm-applet &
pgrep blueman-applet || blueman-applet &
pgrep redshift || redshift &
killall clipit ; clipit &
dropbox start &
#pgrep indicator-sound || indicator-sound-switcher &
~/.pia_manager/pia_manager/run.sh --startup &
