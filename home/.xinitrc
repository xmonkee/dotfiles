# xmodmap "$HOME/.Xmodmap"
setxkbmap -option ctrl:swapcaps
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
