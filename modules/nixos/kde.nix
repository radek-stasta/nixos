{ config, pkgs, ... }:

{
  imports = [
    nvidia_sync.nix
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