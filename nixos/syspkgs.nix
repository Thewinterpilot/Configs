{ config, pkgs, ...}:

{  


  #enabling services
    #hyprland is a tiling window manager and wayland compositor
    programs.hyprland.enable = true;
    
    
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

  #ly is a simple, tui display manager with a minimal login screen look
      services.displayManager.ly.enable = true;

  ##battery life tools
    services.tlp.enable = true;
    services.auto-cpufreq.enable = true;

  ## systempackages
    environment.systemPackages = (with pkgs; [
      #home manager
        home-manager
      ##hyprland specific things
        waybar          #decent bar
	      walker          #app launcher
        grimblast       #screenshot util
	      hyprlock        #lock screen utility
        hypridle        #idle utility
	      swww            #wallpaper setter
        rofi-wayland    #yet another app launcher
      #vscodium permission tool ig
        lxqt.lxqt-policykit
      #brightness tool for brightness keys
        brightnessctl
      #net things
        #samba shares things for my nas
          cifs-utils
          samba
        #onedrive
          onedriver
      #theme changer
        themechanger
      #notifications
        dunst
	      libnotify
      #killall command
        killall
      #ark
        kdePackages.ark
      #git
        git
      #Text editors
        vim
        vscodium
        micro
      #fingerpint
        fprintd
    ]);

}
