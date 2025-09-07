{
  description = "allows for use of both nixos stable and unstable packages along with home-manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:

    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      username = "winter";
      name = "winter";
    in {
      nixosConfigurations = {
        pilot = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
          specialArgs = {
            inherit username;
            inherit name;
            inherit pkgs-unstable;
          };
        };
      };
      homeConfigurations = {
        winter = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ /etc/nixos/home.nix ];
          extraSpecialArgs = {
            inherit username;
            inherit name;
            inherit pkgs-unstable;
          };
        };
      };
    };
}

