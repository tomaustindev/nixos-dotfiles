{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#tomthinkcentre";
      nrsu = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-dotfiles#tomthinkcentre";
    };
    initExtra = ''
      export PS1="[\[\e[91m\]\T\[\e[0m\]]: \[\e[36m\]\u\[\e[0m\] in \[\e[94m\]\w\[\e[0m\] \\$ "
    '';
  };
}

