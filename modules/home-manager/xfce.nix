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
            opacity = 0.8;
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
      };
    };

    xfconf = {
      enable = true;
      settings = {
        xsettings = {
          "Net/ThemeName" = "orchis-dark-nord";
          "Xfce/SyncThemes" = true;
        };
        xfwm4 = {
          "general/theme" = "orchis-dark-nord";
        };
        xfce4-keyboard-shortcuts = {
          "commands/custom/F9" = "tdrop -ma alacritty";
        };
      };
    };
  };
}