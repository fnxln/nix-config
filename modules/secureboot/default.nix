{
  lib,
  pkgs,
  lanzaboote,
  ...
}:
{
  imports = [
    lanzaboote.nixosModules.lanzaboote
  ];
  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
  environment.systempackages = with pkgs; [
    sbctl
  ];
}
