{ pkgs, ... }:
{
  services.redis = {
    enable = true;
    package = pkgs.redis;
    servers = {
      main = {
        appendOnly = true;
        bind = "0.0.0.0";
      };
    };
  };
}
