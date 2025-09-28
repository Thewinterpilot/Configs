{ config, pkgs, ...}:

{  


  #enabling services
    #hyprland is a tiling window manager and wayland compositor
    programs.hyprland.enable = true;
    
    
    programs.sway = {
      enable = false;
      wrapperFeatures.gtk = true;
    };

  #ly is a simple, tui display manager with a minimal login screen look
      services.displayManager.ly.enable = true;

  ##battery life tools
    services.tlp.enable = true;
    services.auto-cpufreq.enable = true;

  ## systempackages
    environment.systemPackages = (with pkgs; [
    ## terminal emulator
      alacritty
    ## swww
      swww
      ## hyprland specific things
        waybar          #decent bar
	walker          #app launcher
        hyprshot        #screenshot util
	hyprlock        #lock screen utility
        hypridle        #idle utility
	hyprpicker      #needed for --freeze in hyprshot and a colour picker
        rofi    #yet another app launcher
      ##cli tools
        ##spec fetching utils
          hyfetch		        #shows basic pc spec overlay
            fastfetch       #needed for hyfetch
            cpufetch	      #shows cpu spec overlay
            nitch           #search util
            btop		        #shows cpu/gpu/ram usage and list of running applications
          ##other cli tools
            nh              #nixos search utility
            python3         #literally just python
            parted          #useful for resizing disks
          ##wallpaper and theming utilities
            swww
            pywalfox-native
            imagemagick
            pywal16
      #vscodium permission tool ig
        lxqt.lxqt-policykit
      #brightness tool for brightness keys
        brightnessctl
      #net things
        #samba shares things for my nas
          cifs-utils
          samba
      #theme changer
        themechanger
      #notifications
        mako
	libnotify
      #killall command
        killall
      #ark
        kdePackages.ark
      #git
        git
      #Text editors
        vim
        neovim
        vscodium
        micro
      #network manager
        iwd

    ]);

}
