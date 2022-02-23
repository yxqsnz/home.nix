{ pkgs, ... }:
with pkgs;
let 
  cursor-theme-name = "Numix-Cursor";
  theme = arc-theme;
  themeName = "Arc-Dark";
  iconTheme = papirus-icon-theme;
  iconThemeName = "Papirus-Dark";
in {
  gtk.enable = true;
  gtk.iconTheme.package = iconTheme;
  gtk.iconTheme.name = iconThemeName;
  gtk.theme.package = theme;
  gtk.theme.name = themeName;
  gtk.gtk2.extraConfig = ''
    gtk-cursor-theme-name = "${cursor-theme-name}"
  '';
  gtk.gtk3.extraConfig = {
    gtk-cursor-theme-name = cursor-theme-name;
  };
}
