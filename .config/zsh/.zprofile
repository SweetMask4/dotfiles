#/usr/bin/env sh
# Check if the current terminal is /dev/tty1
if [ "$(tty)" = "/dev/tty1" ] && [ "$EUID" -ne 0 ]; then
    # Create the xorg directory if it does not exist
    mkdir -p "$XDG_DATA_HOME/xorg"
    
    # Launch startx with XINITRC and redirect output to xorg.log
    exec startx "$XINITRC" -- -keeptty > "$XDG_DATA_HOME/xorg/xorg.log" 2>&1
fi
