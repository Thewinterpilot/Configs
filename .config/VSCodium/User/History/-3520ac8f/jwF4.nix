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
      c = "codium";
      rs = "sudo nixos-rebuild switch";
      cff = "codium /etc/nixos/";
      vff = "sudo neovim /etc/nixos/";
      

    };
  };
}

