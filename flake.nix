{

description = "second flake";

inputs = {
	#nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
	nixpkgs.url = "nixpkgs/nixos-24.05";
	home-manager = {
	  url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs";
	};
#	hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
};

outputs = { self, nixpkgs, home-manager, ... }:
let
	lib = nixpkgs.lib;
  	system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
in
{
	nixosConfigurations = {
		NewIdea = lib.nixosSystem {
		inherit system;
		modules = [
		./configuration.nix
		./nixos/nixos.nix
		home-manager.nixosModules.home-manager
#		{
#		  home-manager.useGlobalPkgs = true;
#		  home-manager.useUserPackages = true;
#		  home-manager.users.duque = import ./home.nix;
#		  home-manager.extraSpecialArgs = specialArgs;
#		}
		];
		};
	};
};

}
