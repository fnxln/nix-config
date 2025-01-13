{
  config,
  lib,
  pkgs,
  args,
  vscode-server,
  nixos-wsl,
  ...
}:

{

  imports = [
    vscode-server.nixosModules.default
    nixos-wsl.nixosModules.default

  ];
  wsl.enable = true;
  wsl.defaultUser = "lin";

  services.vscode-server.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nix-wsl";
  users.users.lin = {
    isNormalUser = true;
    home = "/home/lin";
    description = "Lin Vieira";
    extraGroups = [
      "wheel"
      "openrazer"
      "libvirtd"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    nh
    wget
    curl
    colmena
    nushell
  ];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
  system.stateVersion = "24.05"; # Did you read the comment?
}
