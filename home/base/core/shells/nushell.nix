{ pkgs, lin-vim, ... }: {

  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    configFile.source = ./config.nu;
    environmentVariables = {

    LAZYVIM_PATH = lin-vim.outPath;
    };

  };


}
