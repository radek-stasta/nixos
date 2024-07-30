{ config, pkgs, ... }:

{
  config = {
    home = {
      file = {
        "${config.home.homeDirectory}/.config/autostart/xrandr.desktop" = {
          source = ../../../dotfiles/virtual/xfce/autostart/xrandr.desktop;
        };
      };
    };
  };
}