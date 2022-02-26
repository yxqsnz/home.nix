{ pkgs, ... }:
with pkgs;
with sway-contrib;
let
  pkgs = [
    fd
    emacs
    gdb
    lld
    git
    mpd
    exa
    lldb
    tokei
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
    flashfocus
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
    kdenlive
    coreutils
    openssl
    openssl.dev
    libcxxabi
    libnotify
    pkg-config
    clang-tools
    wl-clipboard
    obs-studio
    discord-canary
    tdesktop
    cargo-edit
    rnix-lsp
    fantasque-sans-mono
    sumneko-lua-language-server
    wofi
    papirus-icon-theme
    gh
    pfetch
    rust-analyzer
    numix-cursor-theme
    flat-remix-icon-theme
    brave
    #binutils-unwrapped
  ];
in {
  nixpkgs.config.allowUnfree = true;
  home.packages = pkgs;
}
