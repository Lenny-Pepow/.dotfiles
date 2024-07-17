{ config, pkgs, ... }:
{
#home-manager.users.${username} = {
home.packages = [ pkgs.fastfetch ];
programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nix_small";
        padding.right = 1;
      };
      display = {
        binaryPrefix = "si";
        color = "blue";
        separator = " / ";
      };
      modules = [
        "datetime"
        "break"
        "host"
        "os"
        "packages"
        "disk"
#        "colors"
      ];
    };
};

}
