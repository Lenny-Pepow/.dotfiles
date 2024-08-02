{ config, lib, pkgs, ... }:
let
	primary = "#571dc2"; #saturated purple
	secondary = "#7c54b0"; #desaturated purple
	active = "#14db49"; #green
	urgent = "#a2e655"; #bright green
in
{

programs.waybar = {
    enable = true;
    systemd = {
        enable = false;
        target = "graphical-session.target";
    };
    style = ''
	* {
	  font-family: "geistmono";
	  font-size: 16px;
	  font-weight: bold;
	  border-radius: 0px;
	  transition-property: background-color;
	  transition-duration: 0.5s;
	}
	@keyframes blink_red {
	  to{
		background-color: rgb(242, 143, 173);
		color: rgb(26, 24, 38);
	  }
	}
	window#waybar {
	  background-color: transparent;
	}
	window > box {
	  background-color: #000000;
	}
	#workspaces button {
	  padding-top: 5px;
	  padding-bottom: 5px;
	  padding-left: 6px;
	  padding-right: 6px;
	  color: ${primary};
	}
	#workspaces button.active {
	  background-color: #FFFFFF;
	  color: ${active};
	}
	#workspaces button.urgent {
	  color: ${urgent};
	}
	#workspaces button.hover {
	  color: ${secondary};
	}
    '';
    settings = [
        {
          "layer" = "top";
          "position" = "top";
      modules-left = [
	    #"custom/launcher"
	    "hyprland/workspaces"
	    "hyprland/window"
	    "custom/wall"
      ];
	  modules-center = [
	    "clock"
	  ];
	  modules-right = [
	    "mpris"
	    "wireplumber"
#	    "backlight"
	    "network"
	    "battery"
	    "tray"
	    "custom/powermenu"
	  ];

		#modules config
		#modules left

	  "custom/launcher" = {
	    "format" = "[❄️]";
	    "on-click" = "rofi -show drun";
	    "tooltip" = false;
	  };
	  "hyprland/workspaces" = {
	    "format" = "{icon}";
	    "on-click" = "activate";
	    "on-scroll-up" = "hyprctl dispatch workspace e+1";
	    "on-scroll-down" = "hyprctl dispatch workspace e-1";
	    "format-icons" = {
		"1" = "1";
		"2" = "2";
		"3" = "3";
		"4" = "4";
		"5" = "5";
		"6" = "6";
		"7" = "7";
		"8" = "8";
		"9" = "9";
		"urgent" = "!";
		"active" = "X";
		"default" = "V";
	    };
	  };

	  	#modules center
	  "clock" = {
	    "internal" = 1;
	    "format" = "{:%I:%M %p %b %d}";
	    "tooltip" = true;
	    "tooltip-format" = "<tt>{calendar}</tt>";
	    "on-click" = "~/.dotfiles/extras/random-wallpaper.sh";
	  };
	  "hyprland/window" = {
	    max-length = 25;
	    separate-outputs = false;
	    rewrite = {
		"" = "[v.v]";
	    };
	  };
	  	#modules right
	  "mpris" = {
          	"format" = "♪【{artist} - {title}】";
          	"format-paused" = "・【{artist} - {title}】";
	  };
	  "wireplumber" = {
            "scroll-step" = 2;
	    "format" = " {icon} {volume}% ";
            "format-muted" = "󰎊";
            "format-icons" = {
		"default" = [
			"󰎇"
			"󰎌"
			"󰽶"
		];
	    };
            "on-click" = "pavucontrol";
            "tooltip" = true;
	  };
	  "network" = {
            "format-disconnected" = "󰯡 Disconnected";
            "format-ethernet" = "𖤣.𖥧.𖡼.⚘";
            "format-linked" = "󰖪 (No IP)";
            "format-wifi" = "󰖩 ";
            "interval" = 1;
            "tooltip" = true;
            "tooltip-format" = "{essid} ({ipaddr})";
            "on-click" = "nm-applet --indicator";
	  };
	  "battery" = {
            "interval" = 10;
            "states" = {
		"warning" = 20;
        	"critical" = 10;
            };
            "format" = "{icon} {capacity}%";
            "format-icons" = [
        	"󰁺"
        	"󰁻"
        	"󰁼"
        	"󰁽"
        	"󰁾"
        	"󰁿"
        	"󰂀"
        	"󰂁"
        	"󰂂"
        	"󰁹"
            ];
            "format-full" = "{icon} {capacity}%";
            "format-charging" = "󰂄 {capacity}%";
            "tooltip" = "{capacity}%";
	  };
#	  "" = {};
#	  "" = {};
        }
    ];
};

}
