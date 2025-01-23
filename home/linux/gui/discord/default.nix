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
        alwaysAnimate.enable = true;
        alwaysTrust.enable = true;
        fixImagesQuality.enable = true;
        fullSearchContext.enable = true;
        iLoveSpam.enable = true;
        imageZoom.enable = true;
        messageLatency.enable = true;
        messageLogger.enable = true;
        moreKaomoji.enable = true;
        noF1.enable = true;
        noScreensharePreview.enable = true;
        serverInfo.enable = true;
        showHiddenChannels.enable = true;
        unlockedAvatarZoom.enable = true;
        viewRaw.enable = true;
        callTimer.enable = true;
        shikiCodeblocks = {
          enable = true;
          theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/refs/heads/main/packages/tm-themes/themes/catppuccin-mocha.json";
          useDevIcon = "COLOR";

        };

      };
    };
  };

}
