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
        vh = "nvim .";
	sv = "sudo nvim";
	svh = "sudo nvim .";
        code = "codium";
        rs = "sudo nixos-rebuild switch && bash ~/Configs/update.bash";
        cff = "codium /etc/nixos/";
        vff = "sudo nvim /etc/nixos/";
	hypr = "nvim ~/.config/hypr/";
	c = "clear";
	hy = "hyfetch";
	chy = "clear && hyfetch";
    };

  #startup message 
    initExtra = ''
        export PS1='\[\e[38;5;207m\]\u\[\e[38;5;34m\]\H\[\e[0m\] \[\e[38;5;214m\]\w\[\e[0m\\$ '
      '';
  }; ######THIS IS THE END OF THE PROGRAMS.BASH	SEGMENT
  



}

