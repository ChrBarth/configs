# my .bashrc
# do not edit ~/.bashrc directly
# edit ~/.config/bashrc_base and then run ~/bin/build_configs.sh

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

# Prompt:
LIGHT_BLUE='\[\033[1;34m\]'
YELLOW='\[\033[1;33m\]'
NO_COLOR='\[\033[0m\]'
DGY_ON_GY='\[\033[1;30;47m\]'
BU_ON_GY='\[\033[1;34;47m\]'
# ls-farben:
LS_COLORS='no=00:fi=00:di=01;36:ln=00;36:pi=40;33:so=00;35:do=00;35:bd=40;33;00:cd=40;33;00:or=40;31;00:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=00;31:*.tgz=00;31:*.svgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.dz=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.rar=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.ogm=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.txt=00;32:*.pdf=00;31:*.odt=00;37:*.doc=00;37:*.html=00;36:*.htm=00;36:*.sla=00;32:*.tex=00;32:*.ly=00;32:*.md=00;37:*.aux=40;1;31:*.out=40;1;31:*.log=40;1;31:';
export LS_COLORS
#### colorcodes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
####
# \$(~/bin/prompt_git.sh)
# "\$(...)" so the script gets executed every time the prompt is displayed
PS1="$DGY_ON_GY\W $BU_ON_GY$NO_COLOR\$(~/bin/prompt_git.sh)\$ "

# Aliase
alias ls='ls --color=auto --group-directories-first'
alias l='ls --color=auto'
alias l.='ls -ld .*'
alias ll='ls -lhG --color=auto'
alias lsn='ls --color=none'
alias lo='ls -lonth'
alias cls='tput clear'
alias du='du -h'
alias df='df -h'
alias please='sudo $(history -p !!)'
alias v='vim'
alias i3c='v ~/.config/i3/config'
alias vrc='v ~/.vimrc'
alias brc='v ~/.config/bashrc_base'
alias rrc='v ~/.config/ranger_base.conf'
alias vfs='v ~/.config/folder_shortcuts.txt'
alias xr='v ~/.Xresources'
alias q3cfg='v ~/.q3a/baseq3/c.cfg'
alias poweroff='sudo systemctl poweroff'
alias wetter='python3 ~/src/python/wetter/wetter.py'
alias update='sudo apt --yes update && sudo apt --yes upgrade'
alias ssh_on='sudo systemctl start ssh.service'
alias ssh_off='sudo systemctl stop ssh.service'
alias xpaste='xclip -out -selection clipboard'
alias xcopy='xclip -in -selection clipboard'
alias xm='xrdb -merge ~/.Xresources'
alias reconfig='build_configs.sh && . ~/.bashrc'
alias xlog='journalctl -u session-${XDG_SESSION_ID}.scope'
# games:
alias cpma='q3start.sh +set fs_game cpma +exec c_cpma.cfg'
alias ctf='cpma +exec c_ctf.cfg'
alias tdm='cpma +exec c_tdm.cfg'
alias 1v1='cpma +exec c_1v1.cfg'
alias ffa='cpma +exec c_ffa.cfg'
alias iffa='cpma +exec c_iffa.cfg'
alias devmap='q3start.sh +exec c_schoen.cfg +set sv_pure 0 +devmap'
alias qw='~/Spiele/nquake/ezquake-linux-x86_64'
alias qtv='~/Spiele/nquake/ezquake-linux-x86_64 +qwurl'
alias fs="cat ~/.config/folder_shortcuts.txt | awk 'BEGIN { FS=\"\t\" } /^[^#]/ { printf(\"%5s -> %s\n\", \$1,\$2) }'"
alias newlatex='cat ~/.vim/templates/latex.tex | vim -c "set syntax=tex" -'
alias newlilytab='cat ~/.vim/templates/lilypond_tab.ly | vim -c "set syntax=lilypond" -'
alias newpython='cat ~/.vim/templates/python.py | vim -c "set syntax=python" -'
# disable screensaver and energy saving for watching videos etc.:
alias vidmode='xset -dpms s off'
# restore screensaver and energy saving settings:
alias novidmode='xset +dpms s on'
# fun stuff:
alias rot13='tr A-Za-z N-ZA-Mn-za-m'
alias loldate='toilet -t -f ~/files/fonts/figlet/slant.flf $(date) | lolcat'
# tmux stuff:
# htop in the lower half of the screen, alsamixer in the top left and .xsession-errors in the top right:
alias sysmon='tmux split-window "htop" \; split-window -h "tail -f ~/.xsession-errors"; alsamixer'

# smartphone stuff (adb)
alias battery='adb shell dumpsys batterymanager | grep level'

# webcam stuff:
# displays the webcams output using mplayer:
alias showcam='mplayer tv:// -tv driver=v4l2:width=1280:height=720:device=/dev/video0'
# records from webcam to file:
alias recordcam='ffmpeg -v 0 -hide_banner -f video4linux2 -s 1920x1080 -i /dev/video0 ~/Videos/EigeneVideos/wc_$(date +"%Y-%m-%d_%H%M%S").mkv'

# grab screen into video:
alias screencast='ffmpeg -hide_banner -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -f pulse -ac 2 -i default -vcodec libx264 -acodec flac ~/Videos/Screencasts/screencast$(date +"%Y-%m-%d_%H%M%S").mkv'
alias screencast_alsa='ffmpeg -hide_banner -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -f alsa -ac 2 -i default -vcodec libx264 -acodec flac ~/Videos/Screencasts/screencast$(date +"%Y-%m-%d_%H%M%S").mkv'
alias screencast_mute='ffmpeg -hide_banner -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -vcodec libx264 ~/Videos/Screencasts/screencast$(date +"%Y-%m-%d_%H%M%S").mkv'

#PROMPT_COMMAND='echo -ne "\033]0; ::xterm:: \007"'

PATH="$PATH:$HOME/bin:$HOME/.local/bin"
PAGER="less"
EDITOR="vim"

export HISTIGNORE="clear:history:cls"
export HISTCONTROL="ignoreboth"

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
       . /etc/bash_completion
  fi
fi

# enable vi-mode:
set -o vi


# folder aliases:
alias h='cd ~'
alias vd='cd ~/Videos'
alias ve='cd ~/Videos/EigeneVideos'
alias bi='cd ~/Bilder'
alias bf='cd ~/Bilder/fotos'
alias bs='cd ~/Bilder/screenshots'
alias bw='cd ~/Bilder/wallpapers'
alias dok='cd ~/Dokumente'
alias ddm='cd ~/Dokumente/musik/Depeche\ Mode'
alias dmm='cd ~/Dokumente/musik/MothersMilk'
alias de='cd ~/Dokumente/musik/eigene_transkriptionen'
alias dov='cd ~/Dokumente/vorlagen'
alias dco='cd ~/Dokumente/comp'
alias sr='cd ~/src'
alias sgg='cd ~/src/git'
alias sgc='cd ~/src/git/configs'
alias sgi='cd ~/src/git/i3wm-configs'
alias sp='cd ~/src/python'
alias St='cd ~/Studio'
alias Sr='cd ~/Studio/riffs'
alias m='cd ~/Musik'
alias dn='cd ~/Downloads'

