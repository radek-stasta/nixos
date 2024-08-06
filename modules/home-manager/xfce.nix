{ config, pkgs, ... }:

{
  config = {
    # Packages
    home.packages = with pkgs; [
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
        };
      };
    };

    home = {
      file = {
        # Theme
        "${config.home.homeDirectory}/.themes/orchis-dark-nord" = {
          source = ../../dotfiles/shared/themes/orchis-dark-nord;
        };

        # Settings
        "${config.home.homeDirectory}/.config/xfce4/xfconf/xfce-perchannel-xml" = {
          source = config.lib.file.mkOutOfStoreSymlink ../../dotfiles/shared/xfce;
        };
      };
    };
  };
}