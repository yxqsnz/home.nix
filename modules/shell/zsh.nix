{ pkgs, ... }:
with builtins;
{
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    initExtraFirst = readFile ../../config/zsh/powerlevel10k.zsh;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      pls = "sudo";
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