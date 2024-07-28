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
  };

  # Packages
  home.packages = with pkgs; [
  ];

  # Programs
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.gh.enable = true;
  programs.neovim.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
