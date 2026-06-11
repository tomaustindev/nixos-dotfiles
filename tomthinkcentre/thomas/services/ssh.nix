{ config, pkgs, ... }:

{
  sshAuthSock.enable = true;
  services.ssh-agent.enable = true;
}

