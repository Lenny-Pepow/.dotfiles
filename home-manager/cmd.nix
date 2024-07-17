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
};
}
