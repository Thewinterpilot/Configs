echo copying nixos files
cp --update /etc/nixos/configuration.nix ~/Configs/nixos/configuration.nix
cp --update /etc/nixos/home.nix ~/Configs/nixos/home.nix
cp --update /etc/nixos/systempackages.nix ~/Configs/nixos/systempackages.nix
echo copying config files

cp -r --update .config/alacritty ~/Configs/.config/
cp -r --update .config/folder ~/Configs/.config/



echo updated files
echo please remember to manually copy new important configs to ~/Configs/
echo have a good day winter:3
