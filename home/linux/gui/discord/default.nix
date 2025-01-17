{ pkgs, ... }:
{
  programs.nixcord = {
    enable = true; # enable Nixcord. Also installs discord package
    discord.package = pkgs.discord-canary; # set the discord package
    config = {
      useQuickCss = true; # use out quickCSS
      themeLinks = [
        # or use an online theme
        "https://raw.githubusercontent.com/link/to/some/theme.css"
      ];
      frameless = true; # set some Vencord options
      plugins = {
        hideAttachments.enable = true; # Enable a Vencord plugin

      };
    };
  };

}
