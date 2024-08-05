{ config, pkgs, ... }:

{
  config = {
    # Home
    home = {
      username = "rstasta";
      homeDirectory = "/home/rstasta";
    };

    # Packages
    home.packages = with pkgs; [
      jetbrains.webstorm
      sassc                 # for building Orchis Theme
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