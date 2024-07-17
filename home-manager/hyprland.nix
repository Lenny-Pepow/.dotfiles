{ inputs, pkgs, ... }:
let
    hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
in
{
wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;


};
}
