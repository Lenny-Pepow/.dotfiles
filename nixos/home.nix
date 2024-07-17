{ config, pkgs, ... }:
let
	username = "duque";
in
{
imports = [
#	./programs
#	./scripts
#	./themes
];

home-manager.users.${username} = {
imports = [
	../home-manager/cmd.nix
	../home-manager/git.nix
];
home = {
	username = "duque";
	homeDirectory = "/home/duque";
	packages = with pkgs; [
# terminal apps
		kitty
		vim
		neovim
		zed-editor
		lf
		btop
		fastfetch
		nerdfonts
# user apps
];
	sessionVariables = {
	EDITOR = "nvim";
};
};
#programs.bash = {
#	enable = true;
#	shellAliases = {
#		f = "fastfetch";
#		n = "vim";
#	};
#};
#programs.home-manager.enable = true;
};
#home.stateVersion = "24.05";
}
