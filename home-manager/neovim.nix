{ inputs, config, pkgs, ... }:

{

programs.neovim = 
  let
  	##following lines add variables with functions used to cleanup the configuration path for the plugins
	toLua = str: "lua << EOF\n${str}\nEOF\n";
	toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
{
 enable = true;
 package = pkgs.neovim-unwrapped;
 viAlias = true;
 vimAlias = true;
 vimdiffAlias = true;
 extraPackages = [ pkgs.xclip ];
 plugins = with pkgs.vimPlugins; [

   {
    plugin = telescope-nvim;
	config = toLuaFile ./nvim/plugin/telescope.lua;
   }

   {
    plugin = catppuccin-nvim;
    config = toLuaFile ./nvim/plugin/catppuccin.lua;
   }

   {
    #treesitter is a language hiligter
	plugin = nvim-treesitter.withAllGrammars; #downloads ALL grammars (about 180mb)
    config = toLuaFile ./nvim/plugin/treesitter.lua;
   }
   
    nvim-fzf
    telescope-fzf-native-nvim
	vim-nix
 ];
 extraLuaConfig = ''
	${builtins.readFile ./nvim/options.lua}
 '';
};

}
