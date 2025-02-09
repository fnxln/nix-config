{ ... }:
{
  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowBroken = true;
  nix.settings = {
    # Add the usernames you want to trust here
    trusted-users = [
      "root"
      "lin"
    ];
  };
}
