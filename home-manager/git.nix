let
  name = "Lenny-Pepow";
in {
  programs.git = {
    enable = true;
    extraConfig = {
      init.defautBranch = "main";
#color.ui = true;
#core.editor = "nvim";
#credential.helper = "store";
#github.user = name;
#push.autoSetupRemote = true;
    };
    userName = "Lenny-Pepow";
    userEmail = "lennymedeiros2022@outlook.com";
  };
}
