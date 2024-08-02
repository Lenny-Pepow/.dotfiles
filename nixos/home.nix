{ inputs, config, pkgs, ... }:
let
	username = "duque";
in
{
imports = [
#    inputs.ags.homeManagerModules.default
#    ../home-manager/ags.nix
#	./programs
#	./scripts
#	./themes
];

	home = {
		username = "duque";
		homeDirectory = "/home/duque";
		stateVersion = "24.11";
		packages = with pkgs; [
				# terminal apps
			kitty
			zed-editor
			lf
			btop
#			fastfetch
			iosevka #monospace font
			iosevka-comfy.comfy
			iosevka-comfy.comfy-motion
			geist-font
			nerdfonts #icon font
				# user apps
    		];
		sessionVariables = {
		EDITOR = "nvim";
		};
	};
#	programs = {
#	   ags = {
#				enable = true;
#				configDir = ../ags;
#				extraPackages = with pkgs; [
#				    gtksourceview
#					webkitgtk
#					accountsservice
#				];
#	   };
#	;
#};
#programs.home-manager.enable = true;
#home.stateVersion = "24.05";
}
