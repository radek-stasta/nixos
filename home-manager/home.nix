{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # Home
  home = {
    username = "rstasta";
    homeDirectory = "/home/rstasta";

    file = {
      "${config.home.homeDirectory}/.config/autostart/xrandr.desktop" = {
        source = ../dotfiles/bios/xfce/autostart/xrandr.desktop;
      };
    };
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

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
