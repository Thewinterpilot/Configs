{ config, lib, pkgs, ... }:


#this is not generally considered the best way to use home manager but hey, it works.
let 
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
in 

{
  imports =
    [
      ./hardware-configuration.nix
      ./syspkgs.nix
      ./userpkgs.nix
      (import "${home-manager}/nixos")
    ];

  #home manager things
    home-manager.useUserPackages = true;
    home-manager.useGlobalPkgs = true;
    home-manager.backupFileExtension = "backup";
    home-manager.users.winter = import ./home.nix;

  #enabling services
    #hyprland is a tiling window manager and wayland compositor
    programs.hyprland.enable = true;
    #ly is a simple, tui display manager with a minimal login screen look
    services.displayManager.ly.enable = true;


  #enable the polkit for sudo permissions in vscode
      security.polkit.enable = true;
    systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit is a permission management toolkit that vscode uses";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };

#bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
	};
      Policy = {
        AutoEnable = true;
	};
      };
    };

  

  #Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

  
  #Enable networking
    networking.networkmanager.enable = true;

    networking.hostName = "FMS";

  #auto clean
    system.autoUpgrade.enable = true;
    nix.settings.auto-optimise-store = true;
    nix.gc.automatic = true;
    nix.gc.dates = "daily";
    nix.gc.options = "--delete-older-than 4d";



    nix.settings.experimental-features = ["nix-command" "flakes" ];
    
  #unfree packages
    nixpkgs.config.allowUnfree = true;
    
  #locale 
    time.timeZone = "America/Vancouver";

    i18n.defaultLocale = "en_CA.UTF-8";

  #xserver things
    services.xserver.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

  #Enable CUPS to print documents.
  #  services.printing.enable = true;

  #Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

  #Enable touchpad support.
    services.libinput.enable = true;

  #user
    users.users.winter = {
      isNormalUser = true;
      description = "main user";
      extraGroups = [ "networkmanager" "wheel" ];
      
  };



 #Power button invokes hibernate, not shutdown.
    services.logind = {
    extraConfig = "HandlePowerKey=sleep";
    lidSwitch = "sleep";
}; 


  #set up nerdfonts


    fonts = {
      packages = [
        pkgs.nerd-fonts.bigblue-terminal
        pkgs.nerd-fonts.jetbrains-mono
      
      ];
    };


  #samba shares (windows network drives)
    services.gvfs = {
      enable = true;
    };
  
    networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns    '';
  #allowing network ports for samba shares
    networking.firewall.allowedTCPPorts = [ 455 139 138 127 ];
 
  #dont change this when you update
    system.stateVersion = "25.05";

}
