{ pkgs, lin-vim, ... }:
{

  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    configFile.source = ./config.nu;

  };
  programs.carapace.enable = true;

}
