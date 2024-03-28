{ config, lib, pkgs, ... }:

{
  options = {
    services.nginx.scada-web.api = lib.mkOption {
      type = lib.types.str;
      default = "http://127.0.0.1:85/scada.api";
      description = "URL of scada api";
    };
    services.nginx.webpanel.api = lib.mkOption {
      type = lib.types.str;
      default = "http://127.0.0.1:85/api";
      description = "URL of webpanel api";
    };
  };

  config = {
    services.nginx = {
      enable = true;
      user = "rstasta";
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      virtualHosts = {
        "scada-web" = {
          listen = [ { addr = "localhost"; port = 81; } ];
          root = "/var/www/scada-web";
          locations = {
            "/" = {
              index = "index.html";
              tryFiles = "$uri $uri/ /index.html";
            };
            "/scada.api" = {
              proxyPass = "${config.services.nginx.scada-web.api}";
            };
          };
        };
        "webpanel" = {
          listen = [ { addr = "localhost"; port = 83; } ];
          root = "/var/www/webpanel";
          locations = {
            "/" = {
              index = "index.html";
              tryFiles = "$uri $uri/ /index.html";
            };
            "/api" = {
              proxyPass = "${config.services.nginx.webpanel.api}";
            };
          };
        };
      };
    };
  };
}