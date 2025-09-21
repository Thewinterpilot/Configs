# README

This is my personal nixos config that is only public because its slightly easier that way so 
**I will attempt to keep the main branch stable but the working branch can be considered unstable and very well may be completely nonfunctional**

a lot of the configs are just modifications [tonybanters' hyprland-btw](https://github.com/tonybanters/hyprland-btw) configuration




#### Things I'm using & why
- Hyprland (duh) its a good tiling wm and wayland compositor
- Waybar because I liked it and understand how to use it
- alacritty because I like it idk
- rofi because there was a good config for it
- VSCodium because its very themeable and easy for gui modification of things
- Librewolf because its very simple and reasonably secure (might switch to something else)
- Obsidian because idk honestly idk I dont even use their servers I should switch to something thats FOSS but whatever


#### How to set this up on your own nixos system

1. Clone my git directory into your ~ directory with 
   `cd ; git clone https://github.com/Thewinterpilot/Configs` 
2. Edit my configurations to have your username and preferred hostname instead of mine (my username is winter and the hostname is pilot)
3. Copy the contents of the Configs/nixos directory into your /etc/nixos directory **BUT** Preserve your own hardware-configuration.nix file to avoid bricking your system
4. copy my hypr, dunst, foot, gtk3&4, walker and waybar directories, as well as hyfetch.json (or just what you want idk) into your ~/.config directory
5. run sudo nixos-rebuild switch and reboot for good measure (you shouldn't have to but its a good idea)
