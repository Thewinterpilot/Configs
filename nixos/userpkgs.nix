{ config, pkgs, ... }:

{



#   #steam
# programs.steam = {
#   enable = true;
#   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
#   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
#   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
# };

# #obs studio
# environment.systemPackages = [
#   (pkgs.wrapOBS {
#     plugins = with pkgs.obs-studio-plugins; [
#       wlrobs
#       obs-backgroundremoval
#       obs-pipewire-audio-capture
#     ];
#   })
# ];


  # if you want my config change this to your username

  
  users.users.winter.packages = 
  (with pkgs; [
home-manager
    ## terminal & cli tools
      foot
        #tui fileman
          yazi            #terminal file explorer
          ##spec fetching utils
            hyfetch		      #shows basic pc spec overlay
              fastfetch       #needed for hyfetch
              cpufetch	      #shows cpu spec overlay
	      nitch           #search util
            btop		        #shows cpu/gpu/ram usage and list of running applications
          ##hyprland specific things
            waybar          #bar
	          walker          #app launcher
            hyprpaper       #wallpaper utility
	          hyprlock        #lock screen utility
          ##other cli tools
            tree            #show file trees
            nh              #nixos search utility
            python3
            parted          #useful for resizing disks
	    cowsay          #dont ask
    #browser
      librewolf
    #file explorers
      kdePackages.dolphin
	    nautilus
    #discord
      vesktop
    #video player
      vlc
    #3d modeling
      dune3d
    #torrent app for legal downloads
      qbittorrent
    #calendar
      morgen
    #customisable minecraft client with easy mod support 
      prismlauncher
    #music player
	    museeks
    #game engine
      godot
    #bluetooth tool
      blueberry
    #notes
      obsidian
    #screenshot tool
      grimblast

  


    ]);
}
