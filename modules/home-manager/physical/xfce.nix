{ config, pkgs, ... }:

{
  config = {
    home = {
      file = {
        "${config.home.homeDirectory}/.config/autostart/xrandr.desktop" = {
          source = ../../../dotfiles/physical/xfce/autostart/xrandr.desktop;
        };
      };
    };
  };
}