#!/bin/sh

#Clipboard Stuff
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# Network Manager
pkill nm-applet
(nm-applet) &

# Quickshell
pkill qs
#(QS_NO_RELOAD_POPUP=1 qs) & # Quickshell Dist
(qs) &                    # Quickshell Debug

# kdeconnectd
pkill kdeconnectd
(kdeconnectd) &


(/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1)

# ---- cliphist (safe) ----
pgrep -x wl-paste >/dev/null || {
  wl-paste --type text --watch cliphist store --max-items 25 &
  wl-paste --type image --watch cliphist store --max-items 25 &
}
