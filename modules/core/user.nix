{ pkgs, ... }: {
  users.users.lin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "openrazer" "libvirtd" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.nushell;
  };


}
