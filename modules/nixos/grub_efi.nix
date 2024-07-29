{ config, pkgs, ... }:

{
  config = {
    boot.loader.grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
  };
}