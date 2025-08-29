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
      v = "nvim";
      sv = "sudo nvim";
      code = "codium";
      c = "codium";
      rs = "sudo nixos-rebuild switch";
      cff = "codium /etc/nixos/";
      vff = "sudo nvim /etc/nixos/";


    };

    initExtra = ''
      export PS1='\h @ \W\\$  '
    '';
    

    


  };
programs.foot.settings = {
      enable = true;

    main = {
      font= monospace:size=8;
    };
    colors = {
      alpha= 0.6;
      background = 000000;
    };

    };
}

