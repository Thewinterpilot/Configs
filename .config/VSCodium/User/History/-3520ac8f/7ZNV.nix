{ config, pkgs, ... }:


{

  #usernames setup
  home.username = "winter";
  home.homeDirectory = "/home/winter";
  home.stateVersion = "25.05";

#bash scripts
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

    initExtra = ''
      export PS1='\h @ \W\\$  '
    '';
    

    programs.foot = {
      enable = true;

      font= monospace:size=8

      #scrollback.lines = 10000

      alpha= 0.6:


    }


  };

}

