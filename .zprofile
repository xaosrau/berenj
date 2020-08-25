#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.

# X server on windows
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
# previous environment variable
export DISTRO_DNS=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}')
# Force rendering on "windows side"
export LIBGL_ALWAYS_INDIRECT=1

# pulse server for WSL2
export PULSE_SERVER=tcp:$(grep nameserver /etc/resolv.conf | awk '{print $2}');

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ] && shortcuts >/dev/null 2>&1

