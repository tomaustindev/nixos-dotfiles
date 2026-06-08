{ config, pkgs, ... }:

{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";
  home.stateVersion = "25.11";

  programs.neovim.enable = true;

  home.packages = with pkgs; [
   # Coding
   # =======
    clang-tools
    cmake
    gcc
    gdb
    git
    gnumake42
    lua
    nasm
    python3
   # Tools
   # ======
    tree
  ];
  
  home.sessionVariables = {
    EDITOR = "nvim";
  };

}

