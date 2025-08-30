echo copying nixos files
cp --update /etc/nixos ~/Configs/
echo copying config files
cp -r --update .config ~/Configs/.config
rm -f ~/Configs/nixos/hardware-configuration.nix
rm -rf ~/Configs/.config/.config
echo updated files
echo please remember to manually copy new important configs to ~/Configs/
echo have a good day winter:3
