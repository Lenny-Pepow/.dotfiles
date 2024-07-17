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
        protonup
        obsidian
    ];
    sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS =
            "/home/user/.steam/root/compatibilitytools.d";
    };
};
}
