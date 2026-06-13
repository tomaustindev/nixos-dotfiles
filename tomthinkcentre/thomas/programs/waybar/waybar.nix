{ config, pkgs, ... }:

{
  imports = [ ./style.nix ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 8; # gaps between modules
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "network"
          "clock"
          "custom/power"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "2";
            "3" = "";
            "4" = "4";
            "5" = "󰖟";
            "6" = "6";
            "7" = "󰇰";
          };
        };
        clock = {
          format = "{:%I:%M %p}";
          format-alt = "{:%a %d %b %Y}";
          tooltip = false;
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-disconnected = "Disconnected ⚠";
          tooltip = false;
        };
        "custom/power" = {
          format = "⏻";
          tooltip = false;
          menu = "on-click";
          menu-file = builtins.toString ./power_menu.xml;
          menu-actions = {
            shutdown = "shutdown now";
            reboot = "reboot";
            suspend = "systemctl suspend";
            hibernate = "systemctl hibernate";
          };
        };
      };
    };
  };
}

