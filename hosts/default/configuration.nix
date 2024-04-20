# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/nginx.nix
      ../../modules/nixos/nvidia.nix
    ];

  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable wireguard
  networking.wireguard.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "cs_CZ.UTF-8";
    LC_IDENTIFICATION = "cs_CZ.UTF-8";
    LC_MEASUREMENT = "cs_CZ.UTF-8";
    LC_MONETARY = "cs_CZ.UTF-8";
    LC_NAME = "cs_CZ.UTF-8";
    LC_NUMERIC = "cs_CZ.UTF-8";
    LC_PAPER = "cs_CZ.UTF-8";
    LC_TELEPHONE = "cs_CZ.UTF-8";
    LC_TIME = "cs_CZ.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable GDM display manager
  services.xserver.displayManager.gdm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "cz";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "cz-lat2";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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
  # services.xserver.libinput.enable = true;

  # Enable steam input devices
  hardware.steam-hardware.enable = true;

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rstasta = {
    isNormalUser = true;
    description = "rstasta";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users = {
      "rstasta" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    google-chrome
    jetbrains.webstorm
    neovim
    lshw
    eww
    swaynotificationcenter
    libnotify
    rofi-wayland
    firefox
    hyprpaper
    gnome.nautilus
    nordzy-cursor-theme
    nordzy-icon-theme
    remmina
    brightnessctl
    subversion
    nodePackages.npm
    nodePackages.nodejs
    nodePackages.grunt-cli
    nodePackages."@angular/cli"
    steam
    grim
    slurp
    wl-clipboard
    xwaylandvideobridge
    jq
    pavucontrol
    ntfs3g
    protonup-qt
    krdc
    vulkan-tools
    glxinfo
    kodi
    libreoffice-fresh
    ios-webkit-debug-proxy
    libimobiledevice
    ifuse
    dotnet-sdk_8
    godot_4
    gimp
    spotify
    playerctl
    blender
    krita
  ];

  environment.etc."wireguard/wgEC.conf" = {
    source = ../../config/wgEC.conf;
  };

  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts
    iosevka
    source-code-pro
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.fish.enable = true;

  virtualisation.docker.enable = true;

  # List services that you want to enable:
  services.gnome.gnome-keyring.enable = true;
  services.usbmuxd.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 4200 ];
  networking.firewall.allowedUDPPorts = [ 4200 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
