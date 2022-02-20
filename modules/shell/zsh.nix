{ pkgs, ... }:
with builtins; {
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    initExtraFirst = readFile ../../config/zsh/powerlevel10k.zsh;
    initExtra = ''
      bindkey "^[[H" beginning-of-line
      bindkey "^[[6~" end-of-line
    '';
    shellAliases = {
      ll = "ls -l";
      system-update = "sudo nixos-rebuild switch";
      update = "home-manager switch";
      pls = "sudo";
      ls = "exa -a --icons";
      tree = "exa --tree --icons";
      "with" = "nix-shell -p";
    };
    history = {
      size = 10000;
      path = ".zsh_history";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        }
        { name = "zdharma-continuum/fast-syntax-highlighting"; }
      ];
    };
  };
}
