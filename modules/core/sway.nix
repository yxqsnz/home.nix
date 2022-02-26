{ config, lib, pkgs, ... }:
with pkgs;
with lib;

let
  wallpaper = "/home/yxqsnz/Documents/nixos-darkblueice.png";
  cfg = config.wayland.windowManager.sway;
in {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraConfig = ''
      seat seat0 xcursor_theme Numix-Color 24
    '';
    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=sway
      export XDG_CURRENT_DESKTOP=sway
      export MOZ_ENABLE_WAYLAND=1
      export CLUTTER_BACKEND=wayland
      export QT_QPA_PLATFORM=wayland-egl
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export ECORE_EVAS_ENGINE=wayland-egl
      export ELM_ENGINE=wayland_egl
      export SDL_VIDEODRIVER=wayland
      export _JAVA_AWT_WM_NONREPARENTING=1
      export NO_AT_BRIDGE=1 
       '';
    config = {
      modifier = "Mod4";
      menu = "wofi --show drun";
      seat = { "*" = { hide_cursor = "when-typing enable"; }; };
      bars = [{ command = "waybar"; }];
      gaps = {
        inner = 12;
        outer = 12;
      };
      colors = let
        border = "#A4B9EF";
        foc_bg = "#332E41";
        foc_cb = "#A4B9EF";
        foc_text = "#E5B4E2";
        indicator = "#DADAE8";
      in {
        focused = {
          border = border;
          background = foc_bg;
          text = foc_text;
          indicator = indicator;
          childBorder = foc_cb;
        };
        focusedInactive = {
          border = border;
          background = foc_bg;
          text = foc_text;
          indicator = indicator;
          childBorder = foc_cb;
        };
        unfocused = {
          border = border;
          background = "#1E1E28";
          text = "#DADAE8";
          indicator = indicator;
          childBorder = "#575268";
        };
        urgent = {
          border = border;
          background = "#1E1E28";
          text = indicator;
          indicator = indicator;
          childBorder = "#EBDDAA";
        };
      };
      output."*" = { bg = "${wallpaper} fill"; };
      input."type:keyboard" = {
        xkb_layout = "br";
        xkb_options = "grp:alt_caps_toggle";
        xkb_numlock = "enabled";
      };
      input."type:touchpad" = {
        tap = "enabled";
        natural_scroll = "disabled";
        scroll_method = "two_finger";
      };

      keybindings = let
        mod = cfg.config.modifier;
        audio = "exec ${pkgs.pulseaudio-ctl}/bin/pulseaudio-ctl";
        playerctl = "exec ${pkgs.playerctl}/bin/playerctl";
        light = "exec ${pkgs.light}/bin/light";
      in {
        XF86AudioRaiseVolume = "${audio} up";
        XF86AudioLowerVolume = "${audio} down";
        XF86AudioMute = "${audio} mute";
        XF86AudioMicMute = "${audio} mute-input";
        # Control media
        XF86AudioPlay = "${playerctl} play-pause";
        XF86AudioPause = "${playerctl} play-pause";
        XF86AudioNext = "${playerctl} next";
        XF86AudioPrev = "${playerctl} previous";
        # Control brightness
        XF86MonBrightnessUp = "${light} -A 10";
        XF86MonBrightnessDown = "${light} -U 10";
        "Print" = "exec grimshot copy screen";
        "Shift+Print" = "exec grimshot copy area";
        "${cfg.config.modifier}+Return" = "exec ${cfg.config.terminal}";
        "${cfg.config.modifier}+Shift+q" = "kill";
        "${cfg.config.modifier}+Space" = "exec ${cfg.config.menu}";

        "${cfg.config.modifier}+${cfg.config.left}" = "focus left";
        "${cfg.config.modifier}+${cfg.config.down}" = "focus down";
        "${cfg.config.modifier}+${cfg.config.up}" = "focus up";
        "${cfg.config.modifier}+${cfg.config.right}" = "focus right";

        "${cfg.config.modifier}+Left" = "focus left";
        "${cfg.config.modifier}+Down" = "focus down";
        "${cfg.config.modifier}+Up" = "focus up";
        "${cfg.config.modifier}+Right" = "focus right";

        "${cfg.config.modifier}+Shift+${cfg.config.left}" = "move left";
        "${cfg.config.modifier}+Shift+${cfg.config.down}" = "move down";
        "${cfg.config.modifier}+Shift+${cfg.config.up}" = "move up";
        "${cfg.config.modifier}+Shift+${cfg.config.right}" = "move right";

        "${cfg.config.modifier}+Shift+Left" = "move left";
        "${cfg.config.modifier}+Shift+Down" = "move down";
        "${cfg.config.modifier}+Shift+Up" = "move up";
        "${cfg.config.modifier}+Shift+Right" = "move right";

        "${cfg.config.modifier}+b" = "splith";
        "${cfg.config.modifier}+v" = "splitv";
        "${cfg.config.modifier}+f" = "fullscreen toggle";
        "${cfg.config.modifier}+a" = "focus parent";

        "${cfg.config.modifier}+Shift+s" = "layout stacking";
        "${cfg.config.modifier}+w" = "layout tabbed";
        "${cfg.config.modifier}+e" = "layout toggle split";

        "${mod}+s" = "floating toggle";
        "Mod1+f" = "focus mode_toggle";

        "${cfg.config.modifier}+1" = "workspace number 1";
        "${cfg.config.modifier}+2" = "workspace number 2";
        "${cfg.config.modifier}+3" = "workspace number 3";
        "${cfg.config.modifier}+4" = "workspace number 4";
        "${cfg.config.modifier}+5" = "workspace number 5";
        "${cfg.config.modifier}+6" = "workspace number 6";
        "${cfg.config.modifier}+7" = "workspace number 7";
        "${cfg.config.modifier}+8" = "workspace number 8";
        "${cfg.config.modifier}+9" = "workspace number 9";

        "${cfg.config.modifier}+Shift+1" =
          "move container to workspace number 1";
        "${cfg.config.modifier}+Shift+2" =
          "move container to workspace number 2";
        "${cfg.config.modifier}+Shift+3" =
          "move container to workspace number 3";
        "${cfg.config.modifier}+Shift+4" =
          "move container to workspace number 4";
        "${cfg.config.modifier}+Shift+5" =
          "move container to workspace number 5";
        "${cfg.config.modifier}+Shift+6" =
          "move container to workspace number 6";
        "${cfg.config.modifier}+Shift+7" =
          "move container to workspace number 7";
        "${cfg.config.modifier}+Shift+8" =
          "move container to workspace number 8";
        "${cfg.config.modifier}+Shift+9" =
          "move container to workspace number 9";

        "${cfg.config.modifier}+Shift+minus" = "move scratchpad";
        "${cfg.config.modifier}+minus" = "scratchpad show";

        "${cfg.config.modifier}+Shift+c" = "reload";
        "${cfg.config.modifier}+Shift+e" =
          "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

        "${cfg.config.modifier}+r" = "mode resize";
      };
      startup = [
        {
          command =
            "${pkgs.sway-contrib.inactive-windows-transparency}/bin/inactive-windows-transparency.py -o 0.8";
        }
        {
          command =
            "${udiskie}/bin/udiskie -s --appindicator --menu-update-workaround -f ${pkgs.gnome.nautilus}/bin/nautilus";
        }
        { command = "gnome-keyring-daemon --start --components=secrets"; }
      ];
      terminal = "${pkgs.alacritty}/bin/alacritty";
      window = {
        border = 2;
        commands = let
          rule = command: criteria: {
            command = command;
            criteria = criteria;
          };
        in [ (rule "split toggle" { app_id = ".*"; }) ];
      };
    };
  };
}

