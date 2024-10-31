{...}: {
  nix.settings = {
    # Add the usernames you want to trust here
    trusted-users = ["root" "lin"];
  };
}
