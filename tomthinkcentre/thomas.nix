{ config, pkgs, ... }:

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

