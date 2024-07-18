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
			vim
			neovim
			zed-editor
			lf
			btop
#			fastfetch
			nerdfonts
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
#	   bash = {
#				enable = true;
#				shellAliases = {
#				    f = "fastfetch";
#					n = "nvim";
#					cd = "z";
#				};
#				bashrcExtra = ''
#					eval "$(zoxide init bash)"
#				'';
#	   };
#	};
#programs.bash = {
#	enable = true;
#	shellAliases = {
#		f = "fastfetch";
#		n = "vim";
#	};
#};
#programs.home-manager.enable = true;
#home.stateVersion = "24.05";
}
