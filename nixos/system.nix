{ pkgs, ... }:
{
# nix
#documentation.nixos.enable = false;
nixpkgs.config.allowUnfree = true;
nix.settings = {
    experimental-features = "nix=command flakes";
    auto-optimise-store = true;
};

fonts.fonts = with pkgs; [
    source-code-pro
];

}
