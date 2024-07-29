{ config, lib, pkgs, ... }:

{
  options = {
    localization.timeZone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/Prague";
      description = "Timezone";
    };
    localization.locale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = "Default system locale";
    };
    localization.extraLocale = lib.mkOption {
      type = lib.types.str;
      default = "cs_CZ.UTF-8";
      description = "Extra locale for numbers, time, currency, ...";
    };
    localization.xkbLayout = lib.mkOption {
      type = lib.types.str;
      default = "cz";
      description = "Keyboard layout";
    };
    localization.consoleLayout = lib.mkOption {
      type = lib.types.str;
      default = "cz-lat2";
      description = "Keyboard layout for console";
    };
  };

  config = {
    time.timeZone = "${config.localization.timeZone}";
    i18n.defaultLocale = "${config.localization.locale}";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "${config.localization.extraLocale}";
      LC_IDENTIFICATION = "${config.localization.extraLocale}";
      LC_MEASUREMENT = "${config.localization.extraLocale}";
      LC_MONETARY = "${config.localization.extraLocale}";
      LC_NAME = "${config.localization.extraLocale}";
      LC_NUMERIC = "${config.localization.extraLocale}";
      LC_PAPER = "${config.localization.extraLocale}";
      LC_TELEPHONE = "${config.localization.extraLocale}";
      LC_TIME = "${config.localization.extraLocale}";
    };
    services.xserver.xkb = {
      layout = "${config.localization.xkbLayout}";
      variant = "";
    };
    console.keyMap = "${config.localization.consoleLayout}";
  };
}