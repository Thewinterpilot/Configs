# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

let 
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
in 


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./systempackages.nix
      (import "${home-manager}/nixos")
    ];

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


#steam
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};


#bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
	};
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
	};
      };
    };

  services.blueman.enable = true;



  #home manager things
    home-manager.useUserPackages = true;
    home-manager.useGlobalPkgs = true;
    home-manager.backupFileExtension = "backup";
    home-manager.users.winter = import ./home.nix;

  # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;


  #define hostname
    networking.hostName = "pilot";
  


  # Enable networking
    networking.networkmanager.enable = true;
  
  #auto clean
    system.autoUpgrade.enable = true;
    nix.settings.auto-optimise-store = true;
    nix.gc.automatic = true;
    nix.gc.dates = "daily";
    nix.gc.options = "--delete-older-than 4d";


  #enable flakes and nix command
    nix.settings.experimental-features = ["nix-command" "flakes" ];

  #enable the thingy for sudo permissions in vscode
    systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
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

  # Set your time zone.
    time.timeZone = "America/Vancouver";

  # Select internationalisation properties.
    i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
    services.xserver.enable = true;


  # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

  # Enable CUPS to print documents.
    services.printing.enable = true;

  # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

  # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.winter = {
      isNormalUser = true;
      description = "winter";
      extraGroups = [ "networkmanager" "wheel" ];
      
  };



 # Power button invokes suspend, not shutdown.
    services.logind = {
    extraConfig = "HandlePowerKey=suspend";
    lidSwitch = "hibernate";
}; 


  #set up nerdfonts

    fonts = {
      packages = [
        pkgs.nerd-fonts.bigblue-terminal
        pkgs.nerd-fonts.jetbrains-mono
      
      ];
    };


  # Allow unfree packages
    nixpkgs.config.allowUnfree = true;



  ##samba
    services.gvfs = {
      enable = true;
    };
  
    networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns    '';






  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
    #services.openssh.enable = true;

  # Open ports in the firewall for samba share
   networking.firewall.allowedTCPPorts = [ 455 139 138 127 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?










}
