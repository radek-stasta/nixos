{ config, pkgs, ... }:

{
  config = {
    hardware.nvidia.prime.sync.enable = true;
  };
}