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
  name = "nix-dev";
  tags = [ name ];
  ssh-user = "root";
  base-modules = {
    nixos-modules = map mylib.relativeToRoot [
      # common
      "modules/core"
      "modules/server"
      # host specific
      "hosts/nix-dev"
    ];
    home-modules = map mylib.relativeToRoot [
      "home/base/home.nix"
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
