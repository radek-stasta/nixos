{ config, pkgs, ... }:

{
  config = {
    hardware.nvidia.prime.offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };
}
