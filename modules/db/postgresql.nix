{ pkgs, ... }:
{
  services.postgresql = {
    enable = true;
    ensureDatabases = [
      "k3s"
    ];
    package = pkgs.postgresql_16_jit;
    enableTCPIP = true;

    authentication = pkgs.lib.mkOverride 10 ''
      local all       all     trust
      host  all      all     0.0.0.0/0 md5 
    '';
  };
}
