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
    ];

    # Programs
    programs = {
      firefox.enable = true;
      git.enable = true;
      gh.enable = true;
      home-manager.enable = true;
      neovim.enable = true;
    };
  };
}