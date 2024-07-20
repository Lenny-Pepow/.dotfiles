{ inputs, pkgs, ... }:
#let
#    hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
#in
{
wayland.windowManager.hyprland = {
    enable = true;
#    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
        exec-once = [
            "swww-daemon --format xrgb"
        ];
        monitor = [ ",preferred,auto,1" ];
        general = {
            layout = "dwindle";
            gaps_in = 2;
            gaps_out = 10;
            border_size = 4;
            "col.active_border" = "rgba(9101e3FF)";
            "col.inactive_border" = "rgba(0a0c1e88)";
            resize_on_border = true;
        };
        misc = {
            disable_splash_rendering = true;
            force_default_wallpaper = 1;
        };
        input = {
            kb_layout = "br";
            follow_mouse = 1;
            sensitivity = 0;
            float_switch_override_focus = 2;
        };
        binds.allow_workspace_cycles = true;
        dwindle = {};
        gestures = {
            workspace_swipe = true;
            workspace_swipe_use_r = true;
        };
        windowrule = [];
        bind = let
            binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
            mvfocus = binding "SUPER" "movefocus";
            ws = binding "SUPER" "workspace";
            resizeactive = binding "SUPER CTRL" "resizeactive";
            mvactive = binding "SUPER ALT" "moveactive";
            mvtows = binding "SUPER SHIFT" "movetoworkspace";
            e = "exec, ags -b hypr";
            arr = [1 2 3 4 5 6 7 8 9];
#            fileManager = "firefox";
        in [
            "SUPER, W, exec, firefox"
            "SUPER, E, exec, thunar"
            "SUPER, D, exec, rofi -show drun"
            ", Print,       ${e} -r 'recorder.screenshot()'"
            "SHIFT, Print,  ${e} -r 'recorder.screenshot(true)'"
            "SUPER, Return, exec, foot"

            "ALT, Tab, focuscurrentorlast"
            "CTRL ALT, Delete, exit" #exit hyprland session
            "ALT, Q, killactive"
            "SUPER, G, togglefloating"
            "SUPER, F, fullscreen"
            "SUPER SHIFT, F, fullscreen, 1"
            "SUPER, P, togglesplit"

            (mvfocus "k" "u")
            (mvfocus "j" "d")
            (mvfocus "l" "r")
            (mvfocus "h" "l")
            (ws "left" "e-1")
            (ws "right" "e+1")
            (mvtows "left" "e-1")
            (mvtows "right" "e+1")
            (resizeactive "k" "0 -20")
            (resizeactive "j" "0 20")
            (resizeactive "l" "20 0")
            (resizeactive "h" "-20 0")
            (mvactive "k" "0 -20")
            (mvactive "j" "0 20")
            (mvactive "l" "20 0")
            (mvactive "h" "-20 0")
        ]
        ++ (map (i: ws (toString i) (toString i)) arr)
        ++ (map (i: mvtows (toString i) (toString i)) arr);

#    bundle = []; #4 brightness and volume keys
#    bind1 = []; #4 music
    bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
    ];

    decoration = {
        rounding = 10;
        drop_shadow = "yes";
        shadow_range = 8;
        shadow_render_power = 2;
#        col_shadow = "rgba(0000001a)";

        dim_inactive = true;
        dim_strength = 0.2;

        blur = {
            enabled = true;
            size = 8;
            passes = 3;
            new_optimizations = "on";
            noise = 0.01;
            contrast = 0.9;
            brightness = 0.8;
            popups = true;
        };
    };

    animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
            "windows, 1, 5, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
        ];
    };

    plugin = {
        overview = {
            centerAligned = true;
            hideTopLayers = true;
            hideOverlayLayers = true;
            showNewWorkspace = true;
            exitOnClick = true;
            exitOnSwitch = true;
            drawActiveWorkspace = true;
        };
        hyprbars = {
            bar_color = "rgb(2a2a2a)";
            bar_height = 28;
            col_text = "rgba(ffffffdd)";
            bar_text_size = 12;
            bar_text_font = "Source Code Pro";

            buttons = {
                button_size = 0;
                "col.maximaze" = "rgba(ffffff11)";
                "col.close" = "rgba(ff111133)";
            };
        };
    };

    };
};
}
