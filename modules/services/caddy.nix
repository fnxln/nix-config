{ myvars, ... }:
{
  services.caddy = {

    enable = true;
    virtualHosts = {
      "v.fnxln.com" = {
        extraConfig = ''
          encode gzip
          reverse_proxy http://127.0.0.1:8222
        '';
      };
    };
  };
}
