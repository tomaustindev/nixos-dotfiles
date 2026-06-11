{ config, lib, pkgs, zen-browser, ... }:

let 
  grub2-themes-bsol = pkgs.stdenv.mkDerivation {
    name = "bsol";
    src = builtins.fetchGit {
      url = "https://github.com/harishnkr/bsol.git";
      rev = "afcc66069d104e4c02bc962e6bebd9c453c0f163";
    };
    installPhase = "cp -r ./bsol $out";
  };
in
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
    theme = grub2-themes-bsol;
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

  # hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # stylix (ricer)
  stylix = {
    enable = true;
    base16Scheme = ./themes/crunchy-forest.yaml;
    autoEnable = false;
  };

  # X11 (fallback)
  services.xserver.enable = true;

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
   # Aesthetics
   # ===========
    flavours
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
    brightnessctl
    freac
    playerctl
    wget
   # XDG & Wayland
   # ==============
    xdg-user-dirs
    wev
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  system.stateVersion = "25.11"; # DO NOT CHANGE!

}

