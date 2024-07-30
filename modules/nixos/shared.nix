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
        extraGroups = ["wheel" "networkmanager" "audio"];
      };
    };
  };
}