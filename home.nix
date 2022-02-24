{ pkgs, ... }:
{
  imports = [
    ./modules/packages/pkgs.nix
    ./modules/core/theme/gtk.nix
    ./modules/core/sway.nix 
    ./modules/shell/zsh.nix
    ./modules/apps/git.nix
    ./modules/apps/waybar.nix
    ./modules/apps/code.nix
    ./modules/other/xdg.nix
    ./modules/apps/code.nix
  ];
}
