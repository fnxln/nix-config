{ self
, nixpkgs
, ...
} @ inputs:
let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib { inherit lib; };
  myvars = import ../vars { inherit lib; };

  # Add my custom lib, vars, nixpkgs instance, and all the inputs to specialArgs,
  # so that I can use them in all my nixos/home-manager/darwin modules.
  genSpecialArgs = system:
    inputs
    // {
      inherit mylib myvars;

      # use unstable branch for some packages to get the latest updates
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system; # refer the `system` parameter form outer scope recursively
        # To use chrome, we need to allow the installation of non-free software
        config.allowUnfree = true;
      };
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        # To use chrome, we need to allow the installation of non-free software
        config.allowUnfree = true;
      };
    };

  # This is the args for all the haumea modules in this folder.
  args = { inherit inputs lib mylib myvars genSpecialArgs; };

  # modules for each supported system
  nixosSystems = {
    x86_64-linux = import ./x86_64-linux (args // { system = "x86_64-linux"; });
    # aarch64-linux = import ./aarch64-linux (args // {system = "aarch64-linux";});
    # riscv64-linux = import ./riscv64-linux (args // {system = "riscv64-linux";});
  };
  allSystems = nixosSystems;
  allSystemNames = builtins.attrNames allSystems;
  nixosSystemValues = builtins.attrValues nixosSystems;
  allSystemValues = nixosSystemValues;

  # Helper function to generate a set of attributes for each system
  forAllSystems = func: (nixpkgs.lib.genAttrs allSystemNames func);
in
{
  # Add attribute sets into outputs, for debugging
  debugAttrs = { inherit nixosSystems allSystems allSystemNames; };

  # NixOS Hosts
  nixosConfigurations =
    lib.attrsets.mergeAttrsList (map (it: it.nixosConfigurations or { }) nixosSystemValues);

  # Colmena - remote deployment via SSH
  colmena =
    {
      meta =
        (
          let
            system = "x86_64-linux";
          in
          {
            # colmena's default nixpkgs & specialArgs
            nixpkgs = import nixpkgs { inherit system; };
            specialArgs = genSpecialArgs system;
          }
        )
        // {
          # per-node nixpkgs & specialArgs
          nodeNixpkgs = lib.attrsets.mergeAttrsList (map (it: it.colmenaMeta.nodeNixpkgs or { }) nixosSystemValues);
          nodeSpecialArgs = lib.attrsets.mergeAttrsList (map (it: it.colmenaMeta.nodeSpecialArgs or { }) nixosSystemValues);
        };
    }
    // lib.attrsets.mergeAttrsList (map (it: it.colmena or { }) nixosSystemValues);

  # Packages
  packages = forAllSystems (
    system: allSystems.${system}.packages or { }
  );

}