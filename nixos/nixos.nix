{ config, pkgs, inputs, lib, ... }:
let
	username = "duque";
in
{
  imports =
  [
    ./hyprland.nix
    ../hardware-configuration.nix
  ];

nixpkgs.config.allowUnfree = true;
programs.hyprland.enable = true;
users.users.${username} = {
	isNormalUser = true;
#	extraGroups = [];
};

home-manager = {
  backupFileExtension = "backup"; #backup automatically existing .config files when generating home-manager ones.
  useGlobalPkgs = true;
  useUserPackages = true;
  extraSpecialArgs = {inherit inputs;};
  users.${username} = {
	home.username = username;
	home.homeDirectory = "/home/${username}";
	home.stateVersion = "24.11";
    imports = [
#        ../home-manager/ags.nix
        ../home-manager/browser.nix
        ../home-manager/cmd.nix
        ../home-manager/fastfetch.nix
        ../home-manager/git.nix
        ../home-manager/hyprland.nix
        ../home-manager/neovim.nix
        ../home-manager/rofi.nix
        ../home-manager/starship.nix
#        ../home-manager/tmux.nix
        ../home-manager/waybar.nix
        ../home-manager/yazi.nix
        ./home.nix
    ];
  };
};
}
