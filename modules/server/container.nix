{ pkgs, ... }:
{
  virtualisation.containers.enable = true;
  virtualisation = {
    oci-containers.backend = "docker";
    docker = {
      # enableNvidia = true;
      enable = true;
      # rootless.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    docker-compose
  ];

}
