{ config, pkgs, ... }:

{
  imports = [
    ./localization.nix
    ./sound.nix
  ];

  config = {
    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_zen;

    # Hostname
    networking.hostName = "nixos";

    # Users
    users.users = {
      rstasta = {
        initialPassword = "password";
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = ["wheel" "networkmanager" "audio"];
      };
    };

    # Programs
    programs.fish.enable = true;

    # Fonts
    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "SourceCodePro" "Ubuntu" "UbuntuMono" ]; })
    ];

    # Services
    services.gnome.gnome-keyring.enable = true;
  };
}