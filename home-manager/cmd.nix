{ inputs, pkgs, ... }:
{
home.packages = with pkgs; [
	yazi
	fzf
];
}
