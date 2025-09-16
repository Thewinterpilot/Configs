#!/bin/zsh

rofi -e "$(zsh -c "$(rofi -dmenu -p 'Run command' -theme-str 'listview {lines: 0;}')" 2>&1 )"
