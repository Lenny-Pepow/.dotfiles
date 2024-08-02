{ config, pkgs, inputs, lib, ... }:

{
hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
};

environment = {
    systemPackages = with pkgs; [
        xfce.thunar #file manager
        grim
        wayshot #screenshots
        wf-recorder #terminal screen recorders
        slurp #screen area selection for terminal prograns
        pavucontrol #sound manager
        swww #wallpaper daemon
        mangohud #game info
        protonup #steam
        obsidian #notation
        fragments #bittorrent client
        wl-clipboard
        wl-gammactl
        libsForQt5.kdenlive
        qownnotes
        oculante #img viewer
        audacity
        qpwgraph #pipewire graph
        ncmpcpp
        mus
        mpd
        carla
        aether-lv2 #reverb
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

services.mpd = {
    enable = true;
    user = "duque";
    musicDirectory = "/home/duque/Music";
    extraConfig = ''
        audio_output {
            type "pipewire"
            name "My PipeWire Output"
        }
    '';
    network.listenAddress = "any";
    startWhenNeeded = true;
};

systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
};


}
