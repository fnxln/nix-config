{
  config,
  lib,
  ...
}:
{
  wayland.windowManager.hyprland.settings.env = [
    # for hyprland with nvidia gpu, ref https://wiki.hyprland.org/Nvidia/
    "LIBVA_DRIVER_NAME,nvidia"
    "XDG_SESSION_TYPE,wayland"
    "GBM_BACKEND,nvidia-drm"
    "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    "NVD_BACKEND,direct"
    "ELECTRON_OZONE_PLATFORM_HINT,auto"
  ];

}
