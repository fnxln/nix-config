{ pkgs, ... }:
{
  services.postgresql = {
    enable = true;

    enableTCPIP = true;
    package = pkgs.postgresql_17_jit;
    authentication = pkgs.lib.mkOverride 10 ''
      local all       all     trust
      host  all      all     0.0.0.0/0 scram-sha-256
      host  all      all     ::/0  scram-sha-256
    '';
  };
}
