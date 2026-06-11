{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font:size=12";
      };
      colors-dark = {
        alpha = "0.9";
        background = "000f05";
        foreground = "dbffdb";
        
        regular0 = "000f05";
        regular1 = "694125";
        regular2 = "236b3e";
        regular3 = "967e53";
        regular4 = "62b196";
        regular5 = "8f8072";
        regular6 = "409860";
        regular7 = "c5f09f";
        
        bright0 = "0b2a23";
        bright1 = "f13a44";
        bright2 = "bfff1c";
        bright3 = "ffe343";
        bright4 = "79f6d3";
        bright5 = "c285de";
        bright6 = "80c884";
        bright7 = "dbffdb";
      };
    };
  };
}

