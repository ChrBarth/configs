# configs
.vimrc and other config files

# Filename mapping:

  + bashrc_base -> ~/.config/bashrc_base
  + ranger_base.conf -> ~/.config/ranger_base.conf
  + build_configs.sh -> ~/bin/build_configs.sh
  + folder_shortcuts.txt -> ~/.config/folder_shortcuts.txt
  + bashrc -> ~/.bashrc
  + inputrc -> ~/.inputrc
  + rc.conf -> ~/.config/ranger/rc.conf
  + tmux.conf -> ~/.tmux.conf
  + udiskie_config.yml -> ~/.config/udiskie/config.yml
  + vimrc -> ~/.vimrc
  + Xmodmap -> ~/.Xmodmap
  + Xresources -> ~/.Xresources
  + prompt_git.sh -> ~/bin/prompt_git.sh

# .bashrc and rc.conf (ranger) update:

I don't edit ~/.bashrc and ~/.config/ranger/rc.conf directly.
Instead I edit bashrc_base and ranger_base.conf and then run
build_configs.sh which creates some aliases/mappings
from folder_shortcuts.txt. This is just a test so see if I
really need this (it might be too much for just a handful
of aliases/shortcuts...)
