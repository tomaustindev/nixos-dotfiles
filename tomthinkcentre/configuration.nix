{ config, lib, pkgs, zen-browser, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # nvidia
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # grub setup
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
  };

  # connection
  networking.hostName = "tomthinkcentre";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.printing.enable = true; # (CUPS)

  # TODO: setup firewall
  # services.openssh.enable = true;

  # location-based
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  # display manager
  services.displayManager.ly.enable = true;

  # greeter
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       user = "greeter";
  #     };
  #   };
  # };

  # hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

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

  # define user
  users.users.thomas = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # enables "sudo"
  };

 # Packages
 # =========
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
   # Browsing
   # =========
    zen-browser.packages."${stdenv.hostPlatform.system}".default
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

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  system.stateVersion = "25.11"; # DO NOT CHANGE!

}

