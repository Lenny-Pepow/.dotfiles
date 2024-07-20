{ inputs, config, pkgs, ... }:
{
#home-manager.users.${username} =
home = {
	packages = with pkgs; [
		zoxide
		yazi
		fzf
	];
};
# by adding the "package" option programs can instaled directly in home-manager
programs = {
	bash = {
		enable = true;
		shellAliases = {
			f = "fastfetch";
			n = "nvim";
			cd = "z";
		};
		bashrcExtra = ''
			eval "$(zoxide init bash)"
		'';
	};
	kitty = {
	   enable = true;
	   package = pkgs.kitty;
	   extraConfig = ''
			background_opacity 0.5
			background_blur 2
	   '';
	};
	foot = {
	   enable = true;
	   package = pkgs.foot;
	   server.enable = true;
	   settings = {
			main = {
			     font = "geistmono-Medium:size=12";
			};
			cursor = {
			     style = "beam";
				 blink = "yes";
			};
			colors = {
			        alpha = "0.8";
					background = "000000";
					foreground = "ffffff";
					regular0 = "000000";
					regular1 = "571dc2";
					regular2 = "14db49";
					regular3 = "403d70";
					regular4 = "385a70";
					regular5 = "384894";
					regular6 = "4f3a5e";
					regular7 = "999999";
					bright0 = "38c72c";
					bright1 = "7c54b0";
					bright2 = "a2e655";
					bright3 = "9c6f59";
					bright4 = "323f5c";
					bright5 = "5e6c99";
					bright6 = "667d77";
					bright7 = "ffffff";
			};
	   };
	};
	emacs = {
	   enable = true;
	   package = pkgs.emacs-gtk;
	   extraConfig = ''
	       (setq standard-indent 2)
	   '';
	};
};
}
