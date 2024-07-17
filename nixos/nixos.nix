{ inputs, lib, ... }:
let
	username = "duque";
in
{
  imports = [
	../hardware-configuration.nix
	./home.nix
#	./hyprland.nix
  ];

#hyprland.enable = true;
users.users.${username} = {
	isNormalUser = true;
#	extraGroups = [];
};

home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;
  users.${username} = {
	home.username = username;
	home.homeDirectory = "/home/${username}";
	home.stateVersion = "24.05";
  };
};

}
