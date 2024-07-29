{ config, pkgs, ... }:

{
  imports = [
    ./nvidia_sync.nix
  ];

  config = {
    services = {
      xserver.enable = true;
      displayManager = {
        sddm.enable = true;
        defaultSession = "plasmax11";
      };
      desktopManager.plasma6.enable = true;
    };
  };
}