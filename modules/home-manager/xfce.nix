{ config, pkgs, ... }:

{
  config = {
    # Packages
    home.packages = with pkgs; [
      nordzy-cursor-theme
      papirus-nord
      sassc # for building Orchis Theme
      tdrop
    ];

    # Programs
    programs = {
      alacritty = {
        settings = {
          window = {
            decorations = "None";
            opacity = 0.9;
          };
          font = {
            normal = {
              family = "UbuntuMono Nerd Font Mono";
            };
            size = 14;
          };
        };
      };
      eww = {
        enable = true;
        configDir = ../../dotfiles/shared/eww;
      };
      rofi.enable = true;
    };

    home = {
      file = {
        # Theme
        "${config.home.homeDirectory}/.themes/orchis-dark-nord" = {
          source = ../../dotfiles/shared/themes/orchis-dark-nord;
        };

        # Settings (needs to be out of store link so changes are reflected in dotfiles)
        "${config.home.homeDirectory}/.config/xfce4/xfconf/xfce-perchannel-xml" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/shared/xfce/xfconf";
          recursive = true;
        };

        # Gtk styles for panel (needs to be out of store link so changes are reflected in dotfiles)
        "${config.home.homeDirectory}/.config/gtk-3.0/gtk.css" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/shared/xfce/gtk3/gtk.css";
        };

        # Panel launchers (needs to be out of store link so changes are reflected in dotfiles)
        "${config.home.homeDirectory}/.config/xfce4/panel" = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/shared/xfce/panel";
          recursive = true;
        };

        # Rofi
        "${config.home.homeDirectory}/.config/rofi" = {
          source = ../../dotfiles/shared/rofi;
        };
      };
    };
  };
}