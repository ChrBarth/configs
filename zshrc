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
export TERM="xterm-256color"
setopt auto_cd  

PATH="$PATH:$HOME/src/python/tools:$HOME/.local/bin"

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
alias xlog='journalctl -u session-${XDG_SESSION_ID}.scope -r'
alias cpma='q3start.sh +set fs_game cpma +exec c_cpma.cfg'
alias ctf='cpma +exec c_ctf.cfg'
alias ictf='cpma +exec c_ictf.cfg'
alias tdm='cpma +exec c_tdm.cfg'
alias 1v1='cpma +exec c_1v1.cfg'
alias ffa='cpma +exec c_ffa.cfg'
alias iffa='cpma +exec c_iffa.cfg'
alias q3df='q3start.sh +set fs_game defrag'
alias qw='~/Spiele/nquake/ezquake-linux-x86_64'
alias qtv='~/Spiele/nquake/ezquake-linux-x86_64 +qwurl'
alias odadm='odasrv -config ~/.odamex/odasrv_deathmatch.cfg'
alias odacoop='odasrv -config ~/.odamex/odasrv_coop.cfg -skill 4'
alias h='cd ~'
alias sgg='cd ~/src/git'
alias sgc='cd ~/src/git/configs'
alias sgi='cd ~/src/git/i3wm-configs'
alias sgh='cd ~/src/git/cheatsheets'
alias sp='cd ~/src/python'
alias pp='cd ~/src/git/pypod/ && ./pypod_gui.py'
#alias fn='find ~/Dokumente/Notizen -type f | fzy | xargs -o -r vim'
alias fn='fdfind -t f . ~/Dokumente/Notizen | fzy | xargs -o -r vim'
bindkey -s '^n' "fn\n"
bindkey -s '^z' "vim ~/.zshrc\n"

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
    
bindkey -s '^f' "fh\n"
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

# private stuff goes here:
source ~/.zshrc_private

# nice prompt:
POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"
POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="047"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir vcs)
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
