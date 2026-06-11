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
    ./programs/git.nix
  ];


  # Bat
  # ====
  programs.bat.enable = true;


  # Flavours
  # =========
  xdg.configFile."flavours" = {
    source = create_symlink "${dotfiles}/flavours";
  };


  # Foot
  # =====
  programs.foot.enable = true;
  xdg.configFile."foot" = {
    source = create_symlink "${dotfiles}/foot";
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


  # SSH
  # ====
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
  services.ssh-agent.enable = true;


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
    fastfetch
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

