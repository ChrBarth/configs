# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chrissi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# so 'cd ..<TAB>' autocompletes 'to cd ../':
zstyle ':completion:*' special-dirs true

# disable Ctrl-S / Ctrl-Q:
setopt noflowcontrol

#export TERM="rxvt-unicode"
#export TERM="xterm-256color"
setopt auto_cd  

PATH="$PATH:$HOME/src/python/tools:$HOME/.local/bin"

fpath=($HOME/.zsh $fpath)

# suffix aliases - nice :)
alias -s txt="vim"
alias -s md="vim"
alias -s php="vim"
alias -s css="vim"
alias -s html="vim"
alias -s pdf="evince"

# boring aliases:
alias reload='source ~/.zshrc'
alias ..='cd ..'
alias ls='ls --color=auto --group-directories-first'
alias l='ls --color=auto'
alias l.='ls -ld .*'
alias ll='ls -lhG --color=auto'
alias lsn='ls --color=none'
alias grep='grep --color=auto'
alias du='du -h'
alias df='df -h'
alias i3c='v ~/.config/i3/config'
alias vrc='v ~/.vimrc'
alias zrc='v ~/.zshrc'
alias tmc='v ~/.tmux.conf'
alias rrc='v ~/.config/ranger_base.conf'
alias vfs='v ~/.config/folder_shortcuts.txt'
alias xr='v ~/.Xresources'
alias vst='v ~/src/git/st/config.h'
alias q3cfg='v ~/.q3a/baseq3/c.cfg'
alias poweroff='sudo systemctl poweroff'
alias v='vim'
alias update='sudo apt --yes update && sudo apt --yes upgrade && pkill -SIGRTMIN+3 -F /tmp/i3blocks.pid'
alias ssh_on='sudo systemctl start ssh.service'
alias ssh_off='sudo systemctl stop ssh.service'
alias apache_on='sudo systemctl start apache2'
alias apache_off='sudo systemctl stop apache2'
alias xpaste='xclip -out -selection clipboard'
alias xcopy='xclip -in -selection clipboard'
alias xm='xrdb -merge ~/.Xresources'
alias xlog='journalctl -f -u session-${XDG_SESSION_ID}.scope'
alias cpma='q3start.sh +set fs_game cpma +exec c_cpma.cfg'
alias ctf='cpma +exec c_ctf.cfg'
alias ictf='cpma +exec c_ictf.cfg'
alias tdm='cpma +exec c_tdm.cfg'
alias 1v1='cpma +exec c_1v1.cfg'
alias ffa='cpma +exec c_ffa.cfg'
alias iffa='cpma +exec c_iffa.cfg'
alias q3df='q3start.sh +set fs_game defrag'
alias qw='~/Spiele/nquake/ezQuake-x86_64.AppImage'
alias qtv='~/Spiele/nquake/ezquake-linux-x86_64 +qwurl'
alias odadm='odasrv -config ~/.odamex/odasrv_deathmatch.cfg'
alias odacoop='odasrv -config ~/.odamex/odasrv_coop.cfg -skill 4'
alias h='cd ~'
alias sgg='cd ~/src/git'
alias sgc='cd ~/src/git/configs'
alias sgi='cd ~/src/git/i3wm-configs'
alias sgh='cd ~/src/git/cheatsheets'
alias sp='cd ~/src/python'
alias sc='cd ~/src/c'
alias pp='cd ~/src/git/pypod/ && ./pypod_gui.py'
#alias fn='find ~/Dokumente/Notizen -type f | fzy | xargs -o -r vim'
alias fn='fdfind -t f . ~/Dokumente/Notizen | fzy | xargs -o -r vim'
alias fr='find ~/Studio/riffs -type f -name \*.mp3 -print0 | fzf --read0 --print0 --height=50% | xargs -o -t -r -0 mpv'
bindkey -s '^fn' "fn\n"
bindkey -s '^vz' "vim ~/.zshrc\n"
bindkey -s '^vi' "vim ~/.config/i3/config\n"
bindkey -s '^vv' "vim ~/.vimrc\n"
bindkey -s '^fr' "fr\n"
bindkey -s '^fh' "fh\n"

# ripgrep/fzf searching:
function rf {
    rg $1 $(fzf)
}
# build a little dev-environment with tmux, a python-interpreter and a shell
function pydev {
    tmux split-window -h \; split-window "python3" && tmux select-pane -t 0 && tmux resize-pane -x 120 && vim $@
}

# do the same thing but not for python
function devsplit {
    tmux split-window -h && tmux select-pane -t 0 && tmux resize-pane -x 120 && vim $@
}

function nodev {
    tmux split-window -h \; split-window "node" && tmux select-pane -t 0 && vim $@
}

function i3blocks_restart {
    pkill -SIGRTMIN+$1 -F /tmp/i3blocks.pid
}

function fh() {
    CMD=$(cat $HISTFILE | fzy)
    eval "$CMD"
}

function dlna() {
    if [[ "$1" = "start" ]]
    then
        echo "starting minidlnad..."
        minidlnad -f ~/.config/minidlna.conf -r -P ~/temp/minidlna_pid
    elif [[ "$1" = "stop" ]]
    then
        echo "stopping minidlnad..."
        killall minidlnad
    else
        echo "use start/stop to start/stop minidlnad"
        ps ax | grep minidlnad
    fi
    }
    
HISTORY_IGNORE="(fh|h|i3c|vrc|poweroff|vrc|zrc)"

alias doom2='prboom-plus -iwad /media/sdb1/Spiele/wads/DOOM2.WAD'
alias doom='prboom-plus -iwad /media/sdb1/Spiele/wads/DOOM.WAD'
alias sunlust='doom2 -file /media/sdb1/Spiele/wads/sunlust.wad'
#function doom2 {
#    gzdoom $@ -iwad DOOM2.WAD
#}

function ripsong {
    if [ $# -ne 2 ]
    then
        echo "usage: ripsong [trackno] [outfile]"
    else
        icedax -t $1 -D /dev/cdrom - | lame --abr 256 - $2
    fi
}

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=40;01;33:*.tgz=40;01;33:*.arc=40;01;33:*.arj=40;01;33:*.taz=40;01;33:*.lha=40;01;33:*.lz4=40;01;33:*.lzh=40;01;33:*.lzma=40;01;33:*.tlz=40;01;33:*.txz=40;01;33:*.tzo=40;01;33:*.t7z=40;01;33:*.zip=40;01;33:*.z=40;01;33:*.dz=40;01;33:*.gz=40;01;33:*.lrz=40;01;33:*.lz=40;01;33:*.lzo=40;01;33:*.xz=40;01;33:*.zst=40;01;33:*.tzst=40;01;33:*.bz2=40;01;33:*.bz=40;01;33:*.tbz=40;01;33:*.tbz2=40;01;33:*.tz=40;01;33:*.deb=40;01;33:*.rpm=40;01;33:*.jar=40;01;33:*.war=40;01;33:*.ear=40;01;33:*.sar=40;01;33:*.rar=40;01;33:*.alz=40;01;33:*.ace=40;01;33:*.zoo=40;01;33:*.cpio=40;01;33:*.7z=40;01;33:*.rz=40;01;33:*.cab=40;01;33:*.wim=40;01;33:*.swm=40;01;33:*.dwm=40;01;33:*.esd=40;01;33:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
# private stuff goes here:
source ~/.zshrc_private

# zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions:
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# nice prompt:
POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"
POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="047"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir vcs)
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
