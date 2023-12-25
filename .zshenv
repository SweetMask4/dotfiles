# Development
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Default apps
export MANPAGER="less"                             # man pages with less
export BROWSER="librewolf"                         # Default web browser
export TERMINAL="alacritty"

# Cleaning up home folder
export XDG_DATA_HOME="${XDG_DATA_HOME:="$HOME/.local/share"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:="$HOME/.cache"}"
export XDG_STATE_HOME="${XDG_STATE_HOME:="$HOME/.local/state"}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME/.config"}"

export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"        # X11 initialization script
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"    # X server script
export GOPATH="$XDG_DATA_HOME/go"                   # Go workspace
export GNUPGHOME="$XDG_DATA_HOME/gnupg"             # GnuPG directory
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"   # GTK2 configuration file
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"               # Zsh configuration directory
export CARGO_HOME="$XDG_DATA_HOME/cargo"           # Cargo (Rust package manager) directory
export STACK_ROOT="$XDG_DATA_HOME/stack"           # Haskell Stack directory
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"       # Wget configuration file
export LESSHISTFILE="$XDG_CACHE_HOME/less/history" # Less history file
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"    # Password Store directory
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"   # Dmenu-based password prompt for sudo
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"   # NPM configuration file
export WINEPREFIX="$XDG_DATA_HOME/wine"           # Wine prefix directory
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"   # Starship prompt configuration file

# Other program settings
export XDG_SESSION_TYPE="x11"               # Xorg sessions
export _JAVA_AWT_WM_NONREPARENTING=1        # Fix for Java applications in dwm
export AWT_TOOLKIT="MToolkit wmname LG3D"   # May have to install wmname
export QT_QPA_PLATFORMTHEME="gtk2"          # Have QT use gtk2 theme.

# PATH
typeset -U path PATH
path=(
  "$HOME/scripts/"
  "$HOME/.local/bin"
  "$HOME/.bin"
  "$HOME/.local/share/flatpak/exports/bin"
  "$HOME/Applications" 
  "$path[@]"
)
export PATH
