{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";
  home.stateVersion = "25.11";


  imports = [ 
    ./programs/bash.nix
    ./programs/fastfetch/fastfetch.nix
    ./programs/foot.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./services/ssh.nix
  ];


  # Bat
  # ====
  programs.bat.enable = true;


  # Flavours
  # =========
  xdg.configFile."flavours" = {
    source = create_symlink "${dotfiles}/flavours";
  };


  # Fuzzel
  # =======
  programs.fuzzel.enable = true;
  xdg.configFile."fuzzel" = {
    source = create_symlink "${dotfiles}/fuzzel";
  };


  # Hyprland
  # =========
  xdg.configFile."hypr" = {
    source = create_symlink "${dotfiles}/hypr";
  };
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;


  # Hyprshot
  # =========
  programs.hyprshot = {
    enable = true;
    saveLocation = "$HOME/Pictures";
  };


  # Neovim
  # =======
  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/nvim";
  };


  # Waybar
  # =======
  programs.waybar.enable = true;
  xdg.configFile."waybar" = {
    source = create_symlink "${dotfiles}/waybar";
  };


  # Yazi
  # =====
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };
  xdg.configFile."yazi" = {
    source = create_symlink "${dotfiles}/yazi";
  };


  # Zathura
  # ========
  programs.zathura.enable = true;


  home.packages = with pkgs; [
   # Coding
   # =======
    clang-tools
    cmake
    gcc
    gdb
    gnumake42
    lua
    nasm
    python3
   # Hyprland
   # =========
    hyprpaper
   # Neovim
   # =======
    fd
    neovim
    ripgrep
   # System Info
   # ============
    btop
   # Terminal
   # =========
    tmux
    tmuxifier
   # Tools
   # ======
    bluetui
    tree
  ];
  
  home.sessionVariables = {
    EDITOR = "nvim";
  };

}

