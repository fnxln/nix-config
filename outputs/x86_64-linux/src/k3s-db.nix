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
} @ args: let
  name = "k3s-db";
  tags = [name];
  ssh-user = "root";
  base-modules = {
    nixos-modules = map mylib.relativeToRoot [
      # common
      "modules/core"
      "modules/server"
      "modules/db"
      # host specific
      "hosts/k3s-db"
    ];
    home-modules = map mylib.relativeToRoot [
      "home/base/home.nix"
      "home/base/tui"
      "home/base/home.nix"
      "home/base/core"
      "home/base/core/shells"
    ];
  };
in {
  nixosConfigurations.${name} = mylib.nixosSystem (base-modules // args);
  colmena.${name} =
    mylib.colmenaSystem (base-modules // args // { inherit tags ssh-user; });
}  
