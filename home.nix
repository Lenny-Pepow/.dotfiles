{ config, pkgs, ... }:

{
imports = [
	./programs
	./scripts
	./themes
]
home.username = "duque";
home.homeDirectory = "/home/duque";
home.stateVersion = "24.05";
home.packages = [
	# terminal apps
		pkgs.kitty
		pkgs.vim
		pkgs.neovim
		pkgs.lf
		pkgs.btop
		pkgs.fastfetch
		
	# user apps
  ];
home.sessionVariables = {
     EDITOR = "nvim";
};

programs.bash = {
	enable = true;
	shellAliases = {
		f = "fastfetch";
		n = "vim";
	};
};

programs.home-manager.enable = true;
}
