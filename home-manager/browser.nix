{ inputs, config, pkgs, ... }:

{

programs = {
    firefox.enable = true;
    qutebrowser = {
      enable = true;
      package = pkgs.qutebrowser;
      searchEngines = {
		w = "https://en.wikipedia.org/wiki/Special:Search?search={}&amp;go=Go&amp;ns0=1";
		aw = "https://wiki.archlinux.org/?search={}";
		nw = "https://wiki.nixos.org/index.php?search={}";
		g = "https://www.google.com/search?hl=en&amp;q={}";
		};
	  settings = {
	  colors = {
	    tabs.bar.bg = "#000000";
	    hints = {
		  bg = "#000000";
		  fg = "#ffffff";
	    }; #hints
	  }; #colors
	  auto_save.session = true;
	}; #settings

    }; #qutebrowser
}; #programs

}
