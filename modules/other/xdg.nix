{ config, pkgs, ... }:
with config.lib.file; {
  xdg.enable = true;
  xdg.configFile = {
    #"waybar".source = ../../config/waybar;
    "nvim" = {
      source = ../../config/nvim;
      recursive = true;
    };
    "alacritty/alacritty.yml".source = ../../config/alacritty.yml;
  };
}
