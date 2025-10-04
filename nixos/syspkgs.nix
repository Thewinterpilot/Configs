{ config, pkgs, ...}:

{  

  #set up nerdfonts
    fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  #enabling services
  #hyprland is a dynamic tiling window manager and wayland compositor
    programs.hyprland.enable = true;
  #ly is a simple, tui display manager with a minimal login screen look
    services.displayManager.ly.enable = true;

  ##battery life tools
    services.tlp.enable = false;
    services.auto-cpufreq.enable = true;
  

}
