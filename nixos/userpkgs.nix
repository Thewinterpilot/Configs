{ config, pkgs, ... }:

{



  #steam
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};

#obs studio
environment.systemPackages = [
  (pkgs.wrapOBS {
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  })
];


#users.users.winter2.packages = with pkgs; [
#  #terminal emulator
#    kitty
#  
#];


  # if you want my config change this to your username

  
  users.users.winter.packages = with pkgs; [

    ## terminal tools
      foot                #considering switching
        #printer
          bat             #cat clone with syntax highlighting
        #tui fileman
          yazi            #terminal file explorer
          ##spec fetching utils
            hyfetch		      #shows basic pc spec overlay
            cpufetch	      #shows cpu spec overlay
            fastfetch       #needed for hyfetch
            btop		        #shows cpu/gpu/ram usage and list of running applications
          ##hyprland specific things
            waybar              #bar
	          walker              #app launcher
            hyprpaper           #wallpaper utility
            hyprshot            #screenshot utility
	          hyprlock            #lock screen utility
          ##other terminal tools
          tree            #file tree tool
          nh              #nixos search utility
          python3         #python
          tldr            #shows tldr of a commands manpage
    #browser
      librewolf           #private secure browser w customisation

    #file explorers
      kdePackages.dolphin #gui file explorer
	    nautilus            #gui file explorer 2
    #discord
      vesktop 	          #foss discord with vencord
     #windows app software
      bottles		          #run windows apps in "bottles"
    #video tools 
      vlc		              #video player ive always used idk
      shotcut             #video editor
	    libsForQt5.kdenlive #video editor 2
    #qbittorrent
      qbittorrent         #torrent things
    #note apps
	    obsidian            #markdown notes locally
    #calendar
      morgen              #calendar app with good looking dark theme
    #mc
      prismlauncher       #customisable minecraft client with easy mod support 
    #music player
	    museeks             #local gui music player
    #game engine
      godot               #simple 2d/3d game engine
     #cloud things
	    onedriver           #connect to onedrive
    #screenshot
	    grimblast           #screenshot manager
    #bluetooth
      blueberry           #gui bluetooth tool

    ];
}