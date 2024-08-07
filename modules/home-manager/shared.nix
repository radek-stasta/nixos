{ config, pkgs, ... }:

{
  config = {
    # Home
    home = {
      username = "rstasta";
      homeDirectory = "/home/rstasta";
      file = {
        "${config.home.homeDirectory}/.local/share/wallpapers" = {
          source = ../../assets/wallpapers;
        };
      };
      file = {
        "${config.home.homeDirectory}/.local/share/icons" = {
          source = ../../assets/icons;
        };
      };
    };

    # Packages
    home.packages = with pkgs; [
      jetbrains.webstorm
      killall
    ];

    # Programs
    programs = {
      alacritty = {
        enable = true;
        settings = {
          colors.primary.background = "#2E3440";
        };
      };
      firefox.enable = true;
      fish = {
        enable = true;
        functions = {
          fish_greeting = {
            body = "";
          };
        };
      };
      git.enable = true;
      gh.enable = true;
      home-manager.enable = true;
      neovim.enable = true;
      starship = {
        enable = true;
        enableFishIntegration = true;
        settings = builtins.fromTOML (builtins.readFile ../../dotfiles/shared/starship/nord.toml);
      };
    };
  };
}