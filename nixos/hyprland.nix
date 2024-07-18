{ config, pkgs, inputs, lib, ... }:

{
hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
};

environment = {
    systemPackages = with pkgs; [
        ags #bar
        xfce.thunar #file manager
        wayshot #screenshots
        pavucontrol #sound manager
        swww #wallpaper daemon
        mangohud #game info
        protonup #steam
        obsidian #notation
        fragments #bittorrent client
    ];
    sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS =
            "/home/user/.steam/root/compatibilitytools.d";
    };
}; #enviroment

programs.hyprland = {
    enable = true;
#    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
};

}
