{ myvars, ... }:
{

  services.openssh = {
    authorizedKeysFiles = myvars.sshAuthorizedKeys;
    enable = true;
  };
}
