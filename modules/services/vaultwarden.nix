{
  services.vaultwarden = {
    enable = true;
    dbBackend = "postgresql";
    environmentFile = "/var/lib/vaultwarden/vaultwarden.env";
  };
}
