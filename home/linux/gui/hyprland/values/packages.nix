{
  pkgs,
  pkgs-unstable,
  swww,
  ...
}:
{
  home.packages = with pkgs; [
    waybar # the status bar
    swaybg # the wallpaper
    swayidle # the idle timeout
    swaylock # locking the screen
    wlogout # logout menu
    wl-clipboard # copying and pasting
    mpvpaper
    winbox4
    megasync
    cura
    pulsemixer
    feh
    hyprpicker # color picker
    alacritty
    wofi
    localsend
    wezterm
    virt-manager
    swww.packages.${pkgs.system}.swww
    neovide
    scrcpy
    cmake
    meson
    cpio
    android-tools
    pcmanfm

    flameshot
    ledger-live-desktop
    sparrow
    insomnia
    # feather
    kitty
    dolphin-emu
    bitwarden-desktop
    bitwarden-cli
    parsec-bin

    jetbrains-toolbox
    telegram-desktop
    kdePackages.kdeconnect-kde
    electron-mail
    #megasync
    mullvad-vpn
    obsidian
    cliphist
    freerdp
    k9s
    talosctl

    obs-studio

    pkgs-unstable.hyprshot # screen shot
    grim # taking screenshots
    slurp # selecting a region to screenshot
    wf-recorder # screen recording
    alacritty
    mako # the notiication daemon, the same as dunst

    yad # a fork of zenity, for creating dialogs

    # audio
    alsa-utils # provides amixer/alsamixer/...
    mpd # for playing system sounds
    rmpc
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor
  ];
}
