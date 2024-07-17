# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "NewIdea"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Fortaleza";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
#  services.displayManager.sddm.enable = true;
#  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

# Enable Hyprland

programs.hyprland.enable = true;
environment.sessionVariables.NIXOS_OZONE_WL = "1";
environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";


#enviroment.sessionVariables = {
  #if your cursor becomes invisible
###  WLR_NO_HARDWARE_CURSORS = "1";
  # Hint eletron apps to use wayland
#  NIXOS_OZONE_WL = "1";
#};

#hardware = {
#    opengl.enable = true;
#    nvidia.modesetting.enable = true;
#};

#xdg.portal.enable = true;
#xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.duque = {
    isNormalUser = true;
    description = "New_Idea";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  kate
    #  thunderbird
    ];
  };

 hardware.opentabletdriver.enable = true;

  # steam
  programs.steam = {
   enable = true;
   remotePlay.openFirewall = true;
   dedicatedServer.openFirewall = true;
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.git.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    # Terminal apps
    pkgs.kitty
    pkgs.foot
    pkgs.vim
    pkgs.lf
    pkgs.fastfetch
    # Sistem and Hyprland
    pkgs.waybar
	(pkgs.waybar.overrideAttrs (oldAttrs: {
		mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
	  })
	)
    pkgs.home-manager
    pkgs.dunst # notifications
    pkgs.libnotify # dusnt needs
    pkgs.swww # wallpaper manager
    pkgs.rofi-wayland
    pkgs.networkmanagerapplet
    pkgs.dolphin
    pkgs.xfce.thunar
    pkgs.mpv
	# Drivers

#  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}