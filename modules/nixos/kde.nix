{ config, pkgs, ... }:

{
  imports = [
  ];

  config = {
    services = {
      xserver.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
      desktopManager.plasma6.enable = true;
    };
  };
}