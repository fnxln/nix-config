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

  name = "nix-wsl";
  modules = {
    nixos-modules = map mylib.relativeToRoot [
      # common
      # host specific
      "hosts/nix-wsl"
    ];
    home-modules = map mylib.relativeToRoot [
      "home/base/home.nix"
      "home/base/tui"
      "home/base/core/shells"
    ];
  };
  systemArgs = modules // args;

in
{
  nixosConfigurations.${name} = mylib.nixosSystem systemArgs;

}
