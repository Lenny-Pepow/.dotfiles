{ inputs, pkgs, lib, config, ... }:

{

programs.starship = {
  enable = true;
  package = pkgs.starship;
  enableBashIntegration = true;
  settings = {
    add_newline = true;
    format = lib.concatStrings [
      "$directory$nix_shell$git_status$character(green)"
    ];
    scan_timeout = 10;
#    directory = {
#    };
    character = {
      success_symbol = "[>](white)";
      error_symbol = "[#](red)";
    };
  };
};

}
