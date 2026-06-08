{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";
  home.stateVersion = "25.11";


  # Bash
  # =====
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#tomthinkcentre";
    };
    initExtra = ''
      export PS1='[\[\e[91m\]\T\[\e[0m\]]: \[\e[36m\]\u\[\e[0m\] in \[\e[94m\]\w\[\e[0m\] \\$ '
      export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent"
    '';
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


  # Neovim
  # =======
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
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


  # Yazi
  # =====
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };
  xdg.configFile."yazi" = {
    source = create_symlink "${dotfiles}/yazi";
  };


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

