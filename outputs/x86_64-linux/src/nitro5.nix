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
  name = "nitro5";
  tags = [ name ];
  ssh-user = "root";
  base-modules = {
    nixos-modules =
      map mylib.relativeToRoot [
        # common
        "modules/core"
        "modules/server"
        "modules/hyprland"
        "modules/nvidia"
        "modules/nvidia/container.nix"
        "modules/vpn"

        "modules/desktop"
        "modules/desktop/bluetooh.nix"

        # host specific
        "hosts/nitro5"
      ]
      ++ [
        inputs.disko.nixosModules.disko
      ];
    home-modules =
      map mylib.relativeToRoot [
        "home/base/home.nix"
        "home/base/tui"
        "home/base/core"
        "home/base/core/shells"

        "home/base/gui"

        "home/linux/gui/hyprland"
        "home/linux/gui/hyprland/nvidia"

        "home/linux/gui/spicetify"
        "home/linux/gui/discord"
      ]
      ++ [
        inputs.spicetify-nix.homeManagerModules.default
        inputs.nixcord.homeManagerModules.nixcord
      ];
  };
in
{
  nixosConfigurations.${name} = mylib.nixosSystem (base-modules // args);
}
