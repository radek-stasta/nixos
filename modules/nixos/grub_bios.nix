{ config, pkgs, ... }:

{
  config = {
    boot.loader.grub = {
      enable = true;
      devices = [ "/dev/vda" ];
    };
  };
}