{ config, pkgs, ... }:


{
  home.username = "winter";
  home.homeDirectory = "/home/winter";
  home.stateVersion = "24.11";



  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos btw";


    };
  };
}

