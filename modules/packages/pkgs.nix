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
    mako
    gnupg
    vscode
    nixfmt
    docker
    nodejs
    libcxx
    rustup
    waybar
    udiskie
    ncurses
    sccache
    firefox
    libkrb5
    python3
    gnumake
    xdg-utils
    clang_13
    libiconv
    pinentry
    grimshot
    playerctl
    alacritty
    arc-theme
    coreutils
    openssl
    openssl.dev
    libcxxabi
    libnotify
    pkg-config
    clang-tools
    wl-clipboard
    discord-canary
    #binutils-unwrapped
  ];
in {
  nixpkgs.config.allowUnfree = true;
  home.packages = pkgs;
}
