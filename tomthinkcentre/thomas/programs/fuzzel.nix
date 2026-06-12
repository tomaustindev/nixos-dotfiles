{ config, pkgs, ... }:

let
  c = config.lib.stylix.colors;
  f = config.stylix.fonts;
in

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "${f.monospace.name}";
        use-bold = true;
        placeholder = "Search Tom's Thinkcentre...";
        icon-theme = "default";
        icons-enabled = true;
        horizontal-pad = 20;
      };
      colors = {
        background = "${c.base00}e6";
        text = "${c.base0F}ff";
        prompt = "${c.base0F}ff";
        placeholder = "${c.base06}80";
        input = "${c.base0F}ff";
        match = "${c.base09}ff";
        selection = "${c.base0F}ff";
        selection-text = "${c.base00}ff";
        selection-match = "${c.base09}ff";
        border = "${c.base0E}ff";
      };
      border = {
        width = 2;
        radius = 5;
      };
      key-bindings = {
        next = "Down Control+j";
        prev = "Up Control+k";
        prev-page = "Left Control+h";
        next-page = "Right Control+l";
        delete-prev = "BackSpace";
        # unbinds
        cursor-left = "none";
        cursor-right = "none";
        delete-line-forward = "none";
      };
    };
  };
}

