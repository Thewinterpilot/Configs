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
      bashrcExtra = "cat ~/.cache/wal/sequences";
      shellAliases = {
        btw = "echo 'I use flakes btw'";
        m = "micro";
        sm = "sudo micro";
        v = "nvim";
        c = "clear";
        cc = "clear; nitch";
	      sv = "sudo nvim";
        code = "codium";
        rs = "sudo nixos-rebuild switch; bash ~/Configs/scripts/update";
        rss = "sudo nixos-rebuild switch";
	      up = "bash ~/Configs/scripts/update";
        nx = "codium /etc/nixos/";
        ss = "nh search ";
        upgrade = "sudo nixos-rebuild switch --upgrade";
	      hypr = "nvim ~/.config/hypr/";
        nd = "cd /etc/nixos/";
        vnx = "sudo nvim /etc/nixos/";
    };

  #startup message 
    initExtra = ''
        export PS1='\[\e[3m\]\w\[\e[0m\] >'
      '';
  }; ######THIS IS THE END OF THE PROGRAMS.BASH	SEGMENT

    services.swww.enable = true;
}

