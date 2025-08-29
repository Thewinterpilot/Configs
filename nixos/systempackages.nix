{ config, pkgs, ...}:

{  

  ##enableing services
    programs.hyprland.enable = true;  #hyprland yk

    services.displayManager.ly.enable = true;  #login manager (tui)

    security.polkit.enable = true; #idk permission manager thingy

    

  ##battery life tools

    services.tlp.enable = true;   #changes power modes based on whether its on battery or not

    services.auto-cpufreq.enable = true;  #changes frequency based on things idk


  ##systempackages
    environment.systemPackages = with pkgs; [
    ##visible apps (not terminal tools or dependancies)

      #Text editors
        neovim              #terminal text editor
        vscodium            #gui IDE
      #terminals
        foot		    #terminal emulator
	alacritty
      #browsers
        librewolf           #browser
      #login manager
        ly
      #hyprland specific things
        hyprland            #window manager
        waybar              #bar
	walker              #app launcher
        hyprpaper           #wallpaper utility
        hyprshot            #screenshot utility
	hyprlock            #lock screen utility
	  libfprint
      #git
        git                 #idk its git, self explanitory
      #file explorers
        nnn		    #terminal file explorer
        kdePackages.dolphin #gui file explorer
	yazi                #terminal file explorer 2
	nautilus            #gui file explorer 2
      #spec fetching utils
        hyfetch		    #shows basic pc spec overlay
        cpufetch	    #shows cpu spec overlay
        btop		    #shows cpu/gpu/ram usage and list of running applications
      #discord
        vesktop 	    #foss discord with vencord
      #windows app software
        bottles		    #run windows apps in "bottles"
	virtualbox          #virtual machine software
      #video tools
        vlc		    #video player ive always used idk
        shotcut             #video editor
	libsForQt5.kdenlive #video editor 2
      #theme changer
        themechanger        #theme changer
      #qbittorrent
        qbittorrent         #torrent things
      #note apps
	obsidian            #notes
      #mc
        prismlauncher       #mc idk
      #music player
        aonsoku             #server gui mp
	musikcube           #local tui mp
	museeks             #local gui mp
      #game engine
        godot               #simple 2d/3d game engine
    ##dependencies
      #assorted
        lxqt.lxqt-policykit #allows permissions for vscode sudo
        brightnessctl       #allows brightness keys to work
      #cloud things
        #onedrive
	  onedriver
        #samba shares
          cifs-utils        #network shares terminal util
          samba		    #allows connecting to network shares
      #python3
        python3             #python
      #fastfetch
        fastfetch           #needed for hyfetch
      #notifications
        dunst               #notification deamon
	libnotify           #apperently important for dunst
      #killall command
        killall             #used for the toggling of waybar
      #screenshot
	grimblast           #screenshot manager
      #tldr
        tldr                #tldr, gives tldr of a commands manpages
      #ark
        kdePackages.ark     #zip and unzip files
      #bluetooth
        blueberry           #bluetooth tool
	bluez
	bluez-tools
    ];

}
