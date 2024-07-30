{ config, pkgs, ... }:

{
  imports = [
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