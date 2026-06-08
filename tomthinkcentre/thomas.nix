{ config, pkgs, ... }:

{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";
  home.stateVersion = "25.11";

  programs.neovim.enable = true;

  home.packages = [
   # Tools
   # ======
    pkgs.tree
  ];
  
  home.sessionVariables = {
    EDITOR = "nvim";
  };

}

