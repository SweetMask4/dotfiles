### Development
export EDITOR="nvim"
export VISUAL="$EDITOR"

### Default apps
export MANPAGER="less"                             # man pages with less
export BROWSER="io.gitlab.librewolf-community"     # Default web browser
export TERMINAL="st"

### Cleaning up home folder
export XDG_DATA_HOME="${XDG_DATA_HOME:="$HOME/.local/share"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:="$HOME/.cache"}"
export XDG_STATE_HOME="${XDG_STATE_HOME:="$HOME/.local/state"}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME/.config"}"

export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"               # X11 initialization script
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"           # X server script
export GOPATH="$XDG_DATA_HOME/go"                           # Go workspace
export GNUPGHOME="$XDG_DATA_HOME/gnupg"                     # GnuPG directory
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"       # GTK2 configuration file
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"                       # Zsh configuration directory
export CARGO_HOME="$XDG_DATA_HOME/cargo"                    # Cargo (Rust package manager) directory
export STACK_ROOT="$XDG_DATA_HOME/stack"                    # Haskell Stack directory
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"                # Wget configuration file
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"          # Less history file
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"             # Password Store directory
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"   # NPM configuration file
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"     # Wine prefix directory
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
# export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

### Other program settings
export XDG_SESSION_TYPE="x11"                    # Xorg sessions
export _JAVA_AWT_WM_NONREPARENTING=1             # Fix for Java applications in dwm
export AWT_TOOLKIT="MToolkit wmname LG3D"        # May have to install wmname
export QT_QPA_PLATFORMTHEME="gtk2"               # Have QT use gtk2 theme.
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass" # Dmenu-based password prompt for sudo


### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/share/flatpak/exports/bin" ] ;
  then PATH="$HOME/.local/share/flatpak/exports/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] ;
  then PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

if [ -d "$HOME/scripts" ] ;
  then PATH="$HOME/scripts:$PATH"
fi
