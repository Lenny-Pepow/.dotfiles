let
  name = "Lenny-Pepow";
  email = "lennymedeiros2022@outlook.com";
in {
  programs.git = {
    enable = true;
    extraConfig = {
      init.defautBranch = "main";
#color.ui = true;
#core.editor = "nvim";
#credential.helper = "store";
#      github.user = name;
#      github.email = email;
#push.autoSetupRemote = true;
    };
  };
}
