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
    users.users.winter.packages = with pkgs; [
    ## visible apps (not terminal tools or dependancies)

      #Text editors
        neovim              #terminal text editor
        vscodium            #gui IDE
      #terminals
	      alacritty           #allows what I need with easy syntax
      #browsers
        librewolf           #private secure browser w customisation
      #login manager
        ly
      #hyprland specific things
        hyprland            #window manager
        waybar              #bar
	      walker              #app launcher
        hyprpaper           #wallpaper utility
        hyprshot            #screenshot utility
	      hyprlock            #lock screen utility
      #git
        git                 #idk its git, self explanitory
      #file explorers
        kdePackages.dolphin #gui file explorer
	      nautilus            #gui file explorer 2
        yazi                #terminal file explorer
      #spec fetching utils
        hyfetch		          #shows basic pc spec overlay
        cpufetch	          #shows cpu spec overlay
        btop		            #shows cpu/gpu/ram usage and list of running applications
      #discord
        vesktop 	          #foss discord with vencord
      #windows app software
        bottles		          #run windows apps in "bottles"
      #search utils
        nh                  #nixos search utility
      #video tools 
        vlc		              #video player ive always used idk
        shotcut             #video editor
	      libsForQt5.kdenlive #video editor 2
      #theme changer
        themechanger        #theme changer
      #qbittorrent
        qbittorrent         #torrent things
      #note apps
	      obsidian            #markdown notes locally
      #mc
        prismlauncher       #customisable minecraft client with easy mod support 
      #music player
	      museeks             #local gui music player
      #game engine
        godot               #simple 2d/3d game engine
       #cloud things
	      onedriver           #connect to onedrive
	    #warpinator
	      warpinator          #warp files across lan
      #screenshot
	      grimblast           #screenshot manager
      #tldr
        tldr                #shows tldr of a commands manpage
      #bluetooth
        blueberry           #gui bluetooth tool

    ## dependencies
      #vscodium
      lxqt.lxqt-policykit   #allows permissions for vscode sudo
      #brightness
      brightnessctl         #allows brightness keys to work
      #samba shares
          cifs-utils        #network shares terminal util
          samba		          #allows connecting to network shares
      #python3
        python3             #python
      #fastfetch
        fastfetch           #needed for hyfetch
      #notifications
        dunst               #notification deamon
	      libnotify           #apperently important for dunst
      #killall command
        killall             #used for the toggling of waybar
      #ark
        kdePackages.ark     #zip and unzip files


    ];

}
