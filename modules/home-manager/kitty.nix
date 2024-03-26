{ config, lib, pkgs, ... }:

{
  options = {
    programs.kitty.background_opacity = lib.mkOption {
      type = lib.types.str;
      default = "0.8";
      description = "Background opacity for Kitty";
    };
  };

  config = {
    programs.kitty = {
      enable = true;
      settings = {
        background_opacity = "${config.programs.kitty.background_opacity}";
      };
    };
  };
}