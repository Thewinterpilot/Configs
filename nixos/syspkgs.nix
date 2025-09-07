{ config, pkgs, ...}:

{  

  ##battery life tools
    services.tlp.enable = true;
    services.auto-cpufreq.enable = true;


  ## systempackages
    environment.systemPackages = (with pkgs; [

      #vscodium permission tool ig
        lxqt.lxqt-policykit
      #brightness tool for brightness keys
        brightnessctl
      #net things
        #samba shares things for my nas
          cifs-utils
          samba
        #onedrive
          onedriver
      #theme changer
        themechanger
      #notifications
        dunst
	      libnotify
      #killall command
        killall
      #ark
        kdePackages.ark
      #git
        git
      #Text editors
        vim
        vscodium

    # ])

    # ++

    # (with pkgs-unstable; [

      
    ]);

}
