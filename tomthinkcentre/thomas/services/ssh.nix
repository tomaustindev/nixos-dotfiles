{ config, pkgs, ... }:

{
  sshAuthSock = {
    enable = true;
    # initialization.bash = ''
    #   export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent"
    # '';
  };

  services.ssh-agent.enable = true;
}

