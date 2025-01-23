{
  # NOTE: the args not used in this file CAN NOT be removed!
  # because haumea pass argument lazily,
  # and these arguments are used in the functions like `mylib.nixosSystem`, `mylib.colmenaSystem`, etc.
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  ...
}@args:
let
  name = "services";
  tags = [ name ];
  ssh-user = "root";
  base-modules = {
    nixos-modules =
      map mylib.relativeToRoot [
        # common
        "modules/core"
        "modules/server"
        # host specific
        "hosts/services"
        "modules/services/postgres.nix"
        "modules/services/caddy.nix"
        "modules/services/vaultwarden.nix"
      ]
      ++ [
        inputs.disko.nixosModules.disko
      ];
    home-modules = map mylib.relativeToRoot [
      "home/base/home.nix"
      "home/base/tui"
      "home/base/core"
      "home/base/core/shells"
    ];
  };
in
{
  nixosConfigurations.${name} = mylib.nixosSystem (base-modules // args);
}
