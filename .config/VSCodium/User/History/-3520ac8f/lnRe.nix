{ config, pkgs, ... }:


{
  home.username = "winter";
  home.homeDirectory = "/home/winter";
  home.stateVersion = "25.05";



  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos btw";
      v = "neovim";
      sv = "sudo neovim";
      code = "codium";
      c = "codium"

    };
  };
}

