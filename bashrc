# .bashrc
# ugly mess :)

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Prompt:
LIGHT_BLUE='\[\033[1;34m\]'
YELLOW='\[\033[1;33m\]'
NO_COLOR='\[\033[0m\]'
DGY_ON_GY='\[\033[1;30;47m\]'
BU_ON_GY='\[\033[1;34;47m\]'
# ls-farben:
LS_COLORS='no=00:fi=00:di=01;33:ln=00;36:pi=40;33:so=00;35:do=00;35:bd=40;33;00:cd=40;33;00:or=40;31;00:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=00;31:*.tgz=00;31:*.svgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.dz=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.rar=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.ogm=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.txt=00;32:*.pdf=00;32:*.odt=00;32:*.doc=00;32:*.html=00;32:*.sla=00;32:*.tex=00;32:*.ly=00;32:';
export LS_COLORS
#### colorcodes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
####

PS1="$DGY_ON_GY\W $BU_ON_GY\$$NO_COLOR "

# Aliase
alias ls='ls --color=tty --group-directories-first'
alias l='ls --color=tty'
alias l.='ls -ld .*'
alias cls='tput clear'
alias du='du -h'
alias df='df -h'
alias ll='ls -lhG --color=tty'
alias lsn='ls --color=none'
alias lo='ls -lonth'
alias i3conf='vim ~/.config/i3/config'
alias vrc='vim ~/.vimrc'
alias poweroff='sudo systemctl poweroff'
alias wetter='python3 ~/src/python/wetter/wetter.py'
# disable screensaver and energy saving for watching videos etc.:
alias vidmode='xset -dpms s off'
# restore screensaver and energy saving settings:
alias novidmode='xset +dpms s on'

#PROMPT_COMMAND='echo -ne "\033]0; ::xterm:: \007"'

PATH="$PATH:$HOME/bin"

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
       . /etc/bash_completion
      fi
  fi

