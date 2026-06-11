{ config, pkgs, ... }:

let
  c = config.lib.stylix.colors;
in

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font:size=12";
      };
      colors-dark = {
        alpha = "0.9";
        background = "${c.base00}";
        foreground = "${c.base0F}";

        regular0 = "${c.base00}";
        regular1 = "${c.base01}";
        regular2 = "${c.base02}";
        regular3 = "${c.base03}";
        regular4 = "${c.base04}";
        regular5 = "${c.base05}";
        regular6 = "${c.base06}";
        regular7 = "${c.base07}";

        bright0 = "${c.base08}";
        bright1 = "${c.base09}";
        bright2 = "${c.base0A}";
        bright3 = "${c.base0B}";
        bright4 = "${c.base0C}";
        bright5 = "${c.base0D}";
        bright6 = "${c.base0E}";
        bright7 = "${c.base0F}";
      };
    };
  };
}

