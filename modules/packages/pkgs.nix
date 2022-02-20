{ pkgs, ... }:
with pkgs;
with sway-contrib;
let
  pkgs = [
    fd
    gdb
    git
    mpd
    exa
    lldb
    acpi
    mold
    zlib
    yarn
    gnupg
    vscode
    nixfmt
    docker
    nodejs
    libcxx
    rustup
    udiskie
    ncurses
    sccache
    openssl
    libkrb5
    python3
    gnumake
    pinentry
    playerctl
    alacritty
    arc-theme
    coreutils
    libcxxabi
    libnotify
    pkg-config
    wl-clipboard
    discord-canary
    llvmPackages_13.libcxxClang
  ];
in {
  nixpkgs.config.allowUnfree = true;
  home.packages = pkgs;
}
