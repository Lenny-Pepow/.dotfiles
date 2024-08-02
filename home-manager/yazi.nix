{ inputs, config, pkgs, ... }:

{

programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    
    settings = {
	  input.cursor_blink = true;
	  manager = {
		ratio = [ 1 2 2 ];
	  };
	  preview = {
		tab_size = 4;
		image_filter = "lanczos3";
		max_width = 1920;
		max_height = 1080;
		image_quality = 90;
	  };
    };
    
#    theme = {
#      
#    };
    
    keymap = {
      manager.append_keymap = [
          #
        { on = [ "C" "S" ]; run = [ "shell $SHELL --block --confirm" ];}
          #Teleport to directory
        { on = [ "C" "C" ];	run = [ "cd --interactive" ]; } #Choose the directory
        { on = [ "C" "d" ];	run = [ "cd ~/Downloads" ]; }
        { on = [ "C" "D" ];	run = [ "cd ~/Desenhos" ]; }
        { on = [ "C" "b" ];	run = [ "cd ~/Blender" ]; }
        { on = [ "C" "c" ];	run = [ "cd ~/.dotfiles" ]; }
        { on = [ "C" "m" ];	run = [ "cd ~/Music" ]; }
        { on = [ "C" "p" ];	run = [ "cd ~/Pictures" ]; }
        { on = [ "C" "w" ];	run = [ "cd ~/Pictures/wallpapers" ]; }
        { on = [ "C" "s" ];	run = [ "cd ~/SoundVideoPack" ]; }
        { on = [ "C" "v" ];	run = [ "cd ~/Videos" ]; }

          #Scripts
        {
          on = [ "U" "d" ];
          run = [ "shell 'dipc catppuccin -s mocha --dir-output ~/Pictures/wallpapers/catppuccin/ $@' --confirm" ];
          #Convert to catppuccin theme using dipc and sent to the random wallpaper selection dir automatically
          #By using the yazi "shell" all the selected files can be sent to a command using $@.
          #This arrangement is just for organization sake.
        }

      ];
    };
};

}
