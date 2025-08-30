echo copying nixos files
cp --update /etc/nixos/configuration.nix ~/Configs/configuration.nix
cp --update /etc/nixos/home.nix ~/Configs/home.nix
cp --update /etc/nixos/systempackages.nix ~/Configs/systempackages.nix
echo copying config files

cp -r --update .config ~/Configs/


echo updated files
echo please remember to manually copy new important configs to ~/Configs/
echo have a good day winter:3
