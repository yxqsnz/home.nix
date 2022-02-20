{pkgs, ...}:
{
  xdg.enable = true;
	xdg.configFile = {
    "sway".source = ../../config/sway;
    "waybar".source = ../../config/waybar;
    "alacritty/alacritty.yml".source = ../../config/alacritty.yml;
  };
}