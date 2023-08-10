# _____      _____  ___| |_   _ __ ___   __ _ ___| | __
# / __\ \ /\ / / _ \/ _ \ __| | '_ ` _ \ / _` / __| |/ /
# \__ \\ V  V /  __/  __/ |_  | | | | | | (_| \__ \   <
# |___/ \_/\_/ \___|\___|\__| |_| |_| |_|\__,_|___/_|\_\

# profile file. run on login.
[[ -f ~/.bashrc ]] && . "$HOME/.bashrc"

# Development
export ALTERNATE_EDITOR=""
export EDITOR="nvim"
export VISUAL="emacsclient -c -a emacs"

# Programs
export TERMINAL="st"
export BROWSER="librewolf"
export PAGER="less -RF"

# XDG user directories
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export GOPATH="$XDG_DATA_HOME"/go
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export STACK_ROOT="$XDG_DATA_HOME"/stack
export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# Xorg sessions
export XDG_SESSION_TYPE="x11"
# do not save the same command in the history
export HISTCONTROL=ignoreboth:erasedups
export _JAVA_AWT_WM_NONREPARENTING=1

# Path
PATH="$HOME/.bin/:\
$HOME/.local/bin:\
$HOME/scripts:\
$HOME/.config/emacs/bin:\
$PATH"

if [ "$(tty)" = "/dev/tty1" ] && [ "$EUID" -ne 0 ]; then
    # Create xorg directory if it does not exist
    mkdir -p "$XDG_DATA_HOME/xorg"
    
    # Launch startx and redirect output to xorg.log
    exec startx "$XINITRC" -- -keeptty > "$XDG_DATA_HOME/xorg/xorg.log" 2>&1
fi
