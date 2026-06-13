{ config, pkgs, ... }:

let
  c = config.lib.stylix.colors;
  f = config.stylix.fonts;
in

{
  programs.waybar.style = ''
    * {
      font-family: ${f.monospace.name};
      font-size: ${builtins.toString f.sizes.desktop}px;
      padding: 1px 7px;
    }

    window#waybar {
      background-color: rgba(${c.base00-rgb-r}, ${c.base00-rgb-g}, ${c.base00-rgb-b}, 0.8);
      color: #${c.base0F};
    }

    #workspaces button {
      background-color: transparent;
      color: #${c.base06};
    }

    #workspaces button:hover {
      box-shadow: inherit;
      text-shadow: inherit;
      background: transparent;
      border: transparent;
      padding: inherit;
      color: #${c.base07};
    }

    #workspaces button.focused, #workspaces button.active {
      color: #${c.base0F};
    }

    /* If workspaces is the leftmost module, omit left margin */
    .modules-left > widget:first-child > #workspaces {
      margin-left: 0;
    }

    /* If workspaces is the rightmost module, omit right margin */
    .modules-right > widget:last-child > #workspaces {
      margin-right: 0;
    }

    #clock {
      color: #${c.base06};
    }

    #network {
      color: #${c.base04};
    }

    #network.disconnected {
      color: #${c.base09};
    }

    #custom-power {
      color: #${c.base0A};
    }

    menu {
      background: #${c.base00};
      color: #${c.base0A};
      padding: 4px;
    }

    menuitem {
      border-radius: 8px;
    }
  '';
}

