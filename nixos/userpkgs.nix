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


  #if you want my config change this to your username

  
  users.users.winter.packages = 
  (with pkgs; [

    ## terminal emulator
      foot
      alacritty
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
          ffmpeg-full
          waypaper
	  imagemagick
	  
    #browser
      librewolf           #personal browser
      firefox 		        #school browser
    #file explorer
	    nautilus
    #discord
      vesktop
    #video viewer
      mpv
    #photo tools
      loupe
    #torrent app for legal downloads
      qbittorrent
    #customisable minecraft client with easy mod support 
      prismlauncher
    #bluetooth tool
      blueberry
    #notes
      obsidian

    ]);
}
