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
        xfce4-desktop = {
          "backdrop/screen0/monitorVirtual-1/workspace0/last-image" = "${config.home.homeDirectory}/.local/share/wallpapers/nord/nord.jpeg";
        };
      };
    };
  };
}