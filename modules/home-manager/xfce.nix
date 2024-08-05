{ config, pkgs, ... }:

{
  config = {
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
      };
    };
  };
}