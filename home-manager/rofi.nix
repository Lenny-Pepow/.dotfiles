{ inputs, config, pkgs, ... }:

{
programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
        rofimoji
        rofi-mpd
        rofi-bluetooth
      ];
    theme = "~/.dotfiles/extras/rofi/minimal.rasi";
};
}
