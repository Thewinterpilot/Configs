{ config, lib, pkgs, ... }:


#this is not generally considered the best way to use home manager but hey, it works.
#let 
  #home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
#in 

{
  imports =
    [
      ./hardware-configuration.nix
      ./syspkgs.nix
      ./userpkgs.nix
     
      <home-manager/nixos>
    ];


  #home manager things
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.winter = import ./home.nix;
  };

  
 

services = {
    #Enable touchpad support.
      libinput.enable = true;

    #needed for samba shares
      gvfs.enable = true;

    #Power button invokes hibernate, not shutdown.
      #logind = {
      
      #HandleLidSwitch = "sleep";
      #}; 
    #xserver things idk
      xserver.enable = true;

      xserver.xkb = {
        layout = "us";
        variant = "";
      };
};


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
    settings= {
      General = {
        Experimental = true;
        FastConnectable = true;
	    };
    Policy.AutoEnable = true;
	    };
  };

  

  #Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

  #keep kernel up to date
    # boot.kernelPackages = pkgs.linuxPackages_latest;

  
  #Enable networking
    networking.networkmanager.enable = true;
    networking.hostName = "FMS";

  #auto clean
    system.autoUpgrade.enable = true;
    nix.settings.auto-optimise-store = true;
    nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 4d";
    };

  #enable flakes
     nix.settings.experimental-features = ["nix-command" "flakes" ];
    
  #unfree packages
    nixpkgs.config.allowUnfree = true;



  #locale 
    time.timeZone = "America/Vancouver";

    i18n.defaultLocale = "en_CA.UTF-8";




  #Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };



  #user
    users.users.winter = {
      isNormalUser = true;
      description = "main user";
      extraGroups = [ "networkmanager" "wheel" ];
      
  };




  #set up nerdfonts
    fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];


    networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns    '';
  #allowing network ports for samba shares
    networking.firewall.allowedTCPPorts = [ 455 139 138 127 ];
 
  #dont change this when you update
    system.stateVersion = "25.05";

}
