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
    wf-recorder
    # Dev
    rustup
    llvmPackages_13.libcxxClang
    #gcc
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
  ];
in {
  nixpkgs.config.allowUnfree = true;
  home.packages = pkgs;
}
