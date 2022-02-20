{ pkgs, ... }:
{
  imports = [
    ./modules/packages/pkgs.nix
    ./modules/shell/zsh.nix
    ./modules/apps/git.nix
    ./modules/apps/code.nix
    ./modules/other/xdg.nix
    ./modules/apps/code.nix
  ];
}
