{ myvars, pkgs, ... }:
{
  users.users.lin = {
    isNormalUser = true;
    initialHashedPassword = myvars.initialHashedPassword;
    extraGroups = [
      "wheel"
      "openrazer"
      "libvirtd"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.nushell;
  };

}
