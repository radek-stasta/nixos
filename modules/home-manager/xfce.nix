{ config, pkgs, ... }:

{
  config = {
    home = {
      file = {
        "${config.home.homeDirectory}/.config/autostart/xrandr.desktop" = {
          source = ../../dotfiles/bios/xfce/autostart/xrandr.desktop;
        };
      };

      # Packages
      packages = with pkgs; [
        google-chrome
      ];
    };
  };
}