{pkgs, ...}:
with pkgs;
with sway-contrib;
let
  pkgs = [
    micro
    neovim
    firefox
    xdg-utils
    papirus-icon-theme
    waybar
    mako
    grimshot
    tdesktop
    obs-studio
    gnome.nautilus
    # Dev
    rustup
    llvmPackages_13.libcxxClang
    gdb
    lldb
    git
    vscode
    acpi
    discord-canary
    nixfmt
    mold
    udiskie
		alacritty
		arc-theme
		mpd
		playerctl
    wl-clipboard
    pkg-config
    sccache
    fd
    openssl
    libkrb5
    zlib
    docker
    python3
    nodejs
    yarn
    gnumake
    coreutils
    pinentry
    gnupg
    libcxx
    libcxxabi
    exa
  ];
in {
  nixpkgs.config.allowUnfree = true;
  home.packages = pkgs;
}
