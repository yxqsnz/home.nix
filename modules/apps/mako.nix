{ pkgs, ... }: {
  programs.mako = {
    enable = true;
    layer = "overlay";
    font = "Iosevka Nerd Font";

    backgroundColor = "#2D3748";
    progressColor = "source #718096";
    textColor = "#F7FAFC";
    borderColor = "#718096";
    width = 400;
    height = 90;
    
    borderSize = 2;
    borderRadius = 4;

    defaultTimeout = 10000;
    extraConfig = ''
      [urgency=high]
      ignore-timeout=1
      text-color=#742A2A
      background-color=#FEB2B2
      progress-color=source #FC8181
    '';
  };
}