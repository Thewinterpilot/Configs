{ config, pkgs, pkgs-unstable, ... }:

{

  
  users.users.winter.packages = 
  (with pkgs; [
  #notes
    obsidian
    ])
   ++
  (with pkgs-unstable; [

    #browser
      librewolf           #personal browser
      firefox 		        #school browser
    #file explorer
      kdePackages.dolphin
      yazi
    #discord
      vesktop
    #video viewer
      mpv
    #photo tools
      loupe
    #torrent app for legal downloads
      qbittorrent
    #bluetooth tool
      blueberry
    #icon theme
      dracula-icon-theme
    ]);
}
