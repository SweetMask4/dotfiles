#!/usr/bin/env sh 

cache="$HOME/.cache/qutebrowser"
other="$HOME/.local/share/qutebrowser" 

[ -d "$cache" ] && rm -rf "$cache"
[ -d "$other" ] && rm -rf "$other"
