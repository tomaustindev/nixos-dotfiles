{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/tomaustindev";
        identitiesOnly = true;
        addKeysToAgent = "yes";
      };
    };
  };

}

