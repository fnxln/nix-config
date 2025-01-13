{ pkgs, firefox-addons, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.lin = {
      id = 0;
      extensions = with firefox-addons.packages.${pkgs.system}; [
        stylus
        ublock-origin
      ];
    };

  };

}
