{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # systemd-boot setup
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # connection
  networking.hostName = "tomthinkcentre";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.printing.enable = true; # (CUPS)

  # TODO: setup firewall
  # services.openssh.enable = true;

  # location-based setup
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  # X11
  services.xserver = {
    enable = true;
    xkb.layout = "gb";
  };

  # audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.thomas = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # enables "sudo"
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
   # Coding
   # =======
    vim # (fallback)
   # Terminal
   # =========
    alacritty # (fallback)
   # Tools
   # ======
    wget
  ];

  system.stateVersion = "25.11"; # DO NOT CHANGE!

}

