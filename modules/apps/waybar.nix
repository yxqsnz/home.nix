{ pkgs, ... }:

let
  battery = { name }: {
    bat = name;
    states = {
      warning = 30;
      critical = 15;
    };
    format = "{icon} {capacity}%";
    format-charging = " {capacity}%";
    format-plugged = " ";
    format-alt = "{time} {icon}";
    format-icons = [ "" "" "" "" "" ];
  };

  media = { number }: {
    format = "{icon} {}";
    return-type = "json";
    max-length = 55;
    format-icons = {
      Playing = "";
      Paused = "";
    };
    exec = "mediaplayer ${number}";
    exec-if = "[ $(${pkgs.playerctl}/bin/playerctl -l | wc -l) -ge ${number} ]";
    interval = 1;
  };
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.override { pulseSupport = true; };
    settings = [{
      height = 40;
      modules-left =
        [ "sway/workspaces" "sway/mode" "custom/media#1" "custom/media#2" ];
      modules-center = [ ];
      modules-right = [
        "tray"
        "pulseaudio"
        "network"
        "custom/nordvpn"
        "cpu"
        "memory"
        "backlight"
        "battery#bat0"
        "battery#bat1"
        "clock"
        "custom/power"
      ];
      modules = {
        "sway/workspaces" = {
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "1" = " ";
            "2" = " ";
            "3" = " ";
            "4" = " ";
            "5" = "";
            "6" = " ";
            "9" = " ";
            "10" = " ";
            focused = " ";
            urgent = " ";
            default = " ";
          };
        };
        tray = { spacing = 10; };
        clock = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = "{:%A, %d %b}";
        };
        cpu = { format = "{usage}% 神 "; };
        memory = { format = "{}% 力 "; };
        backlight = {
          format = "{icon}";
          format-alt = "{percent}% {icon}";
          format-alt-click = "click-right";
          format-icons = [ " " " " " " ];
          on-scroll-down = "light -U 10";
          on-scroll-up = "light -A 10";
        };
        "battery#bat0" = battery { name = "BAT0"; };
        "battery#bat1" = battery { name = "BAT1"; };
        network = {
          format-wifi = "  {essid} ({signalStrength}%) ";
          format-ethernet = " Ethernet";
          format-linked = " Ethernet (No IP)";
          format-disconnected = " Disconnected";
          format-alt = "{bandwidthDownBits}/{bandwidthUpBits}";
          on-click-middle = "nm-connection-editor";
        };
        pulseaudio = {
          scroll-step = 1;
          format = "{icon}  {volume}%  {format_source}";
          format-bluetooth = "{icon} {volume}%  {format_source}";
          format-bluetooth-muted = "{icon}   {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };
        "custom/media#1" = media { number = "1"; };
        "custom/media#2" = media { number = "2"; };
        "custom/power" = {
          format = " ";
          on-click = "nwgbar -o 0.2";
          escape = true;
          tooltip = false;
        };
        "custom/nordvpn" = {
          format = "{}  ";
          exec = "curl -s www.icanhazip.com";
          interval = 30;
        };
      };
    }];
    style = builtins.readFile ../../config/waybar/style.css;
  };
}
