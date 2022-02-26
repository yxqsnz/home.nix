{ pkgs, config, ... }:
with builtins;
let
  # dirs = (mapAttrs
  #   (x: _: xdg.configFile."nvim/" + x config.lib.file.mkOutOfStoreSymlink x)
  #   (readDir ../../config/nvim));

in {

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];
  programs.neovim = {
    vimAlias = true;
    enable = true;
    package = pkgs.neovim-nightly;

    plugins = with pkgs.vimPlugins;
      [
  
      ];
    extraConfig = builtins.concatStringsSep "\n" [
      ''
      luafile ${builtins.toString ../../config/nvim/start.lua}
      ''
    ];

  };



}
