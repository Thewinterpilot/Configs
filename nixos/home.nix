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
        v = "nvim";
	      sv = "sudo nvim";
        code = "codium";
        rs = "sudo nixos-rebuild switch && bash ~/Configs/update.bash";
        nx = "codium /etc/nixos/";
        ss = "nh search ";
        upgrade = "sudo nixos-rebuild switch --upgrade";
	      hypr = "nvim ~/.config/hypr/";
    };

  #startup message 
    initExtra = ''
        export PS1='\[\e[38;5;207m\]\u\[\e[38;5;34m\]\H\[\e[0m\] \[\e[38;5;214m\]\w\[\e[0m\\$ '
      '';
  }; ######THIS IS THE END OF THE PROGRAMS.BASH	SEGMENT
  



}

