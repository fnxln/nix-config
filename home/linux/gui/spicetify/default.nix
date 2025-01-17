{ spicetify-nix, pkgs, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify =

    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
        keyboardShortcut
        beautifulLyrics
      ];
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };

}
