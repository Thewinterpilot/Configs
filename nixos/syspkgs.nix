{ config, pkgs, ...}:

{  


  ##enableing services
    programs.hyprland.enable = true;  #hyprland yk

    services.displayManager.ly.enable = true;  #login manager (tui)

    security.polkit.enable = true; #idk permission manager thingy

  
  ##battery life tools

    services.tlp.enable = true;   #changes power modes based on whether its on battery or not

    services.auto-cpufreq.enable = true;  #changes frequency based on things idk


  ## systempackages
    environment.systemPackages = with pkgs; [

      #Text editors
        neovim              #terminal text editor
        vscodium            #gui IDE
      #vscodium
      lxqt.lxqt-policykit   #allows permissions for vscode sudo
      #brightness
      brightnessctl         #allows brightness keys to work
      #samba shares
          cifs-utils        #network shares terminal util
          samba		          #allows connecting to network shares
      #git
        git                 #github idk
      #theme changer
        themechanger        #theme changer
      #notifications
        dunst               #notification deamon
	      libnotify           #apperently important for dunst
      #killall command
        killall             #used for the toggling of waybar
      #ark
        kdePackages.ark     #zip and unzip files


    ];

}
