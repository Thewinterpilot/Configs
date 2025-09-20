{ config, pkgs, ... }:


{


  #usernames setup
    home.username = "winter";
    home.homeDirectory = "/home/winter";
    home.stateVersion = "25.05";
    programs.home-manager.enable = true;

  #bash scripts
    programs.bash = {
      enable = true;
      bashrcExtra = "nitch";
      shellAliases = {
        btw = "echo 'I use flakes btw'";
        m = "micro";
        sm = "sudo micro";
        v = "vim";
        c = "clear";
        cc = "clear; nitch";
	      sv = "sudo vim";
        code = "codium";
        rs = "sudo nixos-rebuild switch; bash ~/Configs/update.bash";
        rss = "sudo nixos-rebuild switch";
	      up = "bash ~/Configs/update.bash";
        nx = "codium /etc/nixos/";
        ss = "nh search ";
        upgrade = "sudo nixos-rebuild switch --upgrade";
	      hypr = "vim ~/.config/hypr/";
        nd = "cd /etc/nixos/";
        vnx = "sudo vim /etc/nixos/";
    };

  #startup message 
    initExtra = ''
        export PS1='\[\e[38;5;171m\]\u\[\e[38;5;39m\]@\[\e[38;5;171m\]\h\[\e[38;5;33m\]@\[\e[38;5;171m\]\W\[\e[0m\] '
      '';
  }; ######THIS IS THE END OF THE PROGRAMS.BASH	SEGMENT
    services.swww.enable = true;
}

