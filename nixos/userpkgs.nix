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

    #music player daemon
      mpd
      plattenalbum
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
