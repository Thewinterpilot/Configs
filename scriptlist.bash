

chosen=$(ls ~/configs/scripts | rofi -show filebrowser -dmenu -font JetBrainsMono Nerd Font 12 -p scripts) || exit 0

bash ~/configs/scripts/$chosen
