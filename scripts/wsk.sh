#!/usr/bin/env bash

wsk() {
    wshowkeys -a bottom -a right -m 30 -F 'JetBrains Mono Nerd Font 22' -f '#FFFFFFff' -b '#111111cc' -t 350
}

if pgrep -x wshowkeys > /dev/null; then
    pkill -x wshowkeys
else
    wsk
fi
