{pkgs, ...}:
{
  xdg.enable = true;
	xdg.configFile = {
    "waybar".source = ../../config/waybar;
    "alacritty/alacritty.yml".source = ../../config/alacritty.yml;
  };
}