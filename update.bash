echo copying nixos config files...
cp --update /etc/nixos/configuration.nix ~/Configs/nixos/configuration.nix
cp --update /etc/nixos/home.nix ~/Configs/nixos/home.nix
cp --update /etc/nixos/systempackages.nix ~/Configs/nixos/systempackages.nix


echo copying .config files...
cp --update ~/.config/hyfetch.json ~/Configs/.config/


echo copying .config folders...
cp -r --update ~/.config/alacritty ~/Configs/.config/
cp -r --update ~/.config/dunst ~/Configs/.config/
cp -r --update ~/.config/gtk-3.0 ~/Configs/.config/
cp -r --update ~/.config/gtk-4.0 ~/Configs/.config/
cp -r --update ~/.config/hypr ~/Configs/.config/
cp -r --update ~/.config/walker ~/Configs/.config/
cp -r --update ~/.config/waybar ~/Configs/.config/

echo pushing to git...
cd ~/Configs
git add -A
git commit -a
git push
cd 
echo please remember to manually copy new important configs to this script update.bash
echo please update github through codium when you make signifigant changes
echo have a good day winter:3
