# Created by newuser for 4.3.17

autoload -U compinit
compinit
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep

#色付け
autoload -Uz colors
colors

##  Envoronment variable
#
# LANG
#
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP.UTF-8
##export LANG=ja_JP.eucJP

## プロンプトの設定
#
# set prompt
#
PROMPT="$USER %% "
PROMPT2="$USER %% "

case ${UID} in
0)
    RPROMPT="%B%{[33m%}%/#%{[m%}%b "
    RPROMPT2="%B%{[33m%}%_#%{[m%}%b "
    SPROMPT="%B%{[33m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        RPROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    RPROMPT="%{[33m%}%/%%%{[m%} "
    RPROMPT2="%{[33m%}%_%%%{[m%} "
    SPROMPT="%{[33m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        RPROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

##ターミナルのタイトル設定
#
# set the title of this terminal
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

## コマンド履歴機能
#
# set .zsh_history
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## emacs likeなキーバインド
#
# set keybind like emacs
#
bindkey -e

##　履歴検索機能のショートカット設定
#
# set shortcut
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

## 先方予測機能を有効に設定
#
#
#
#autoload predict-on
#predict-on

## エイリアス
#
#
#
alias where="command -v"
alias j="jobs -l"

alias ls="ls --color=auto"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias dir="dir --color=auto"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias grep="grep --color=auto"

alias emacs="emacs24 -nw"

case ${UID} in
0)
    alias checkports='pkg_version -v -l \<'
    alias updateports='cd /usr/ports && make update fetchindex && checkports'
    alias updateindex='cd /usr/ports && make index && portsdb -u'
    alias portsclean portsclean -CD
    ;;
esac

## multiosオプション
#
#
#
setopt multios

#!/usr/local/bin/zsh

# load math functions
zmodload -i zsh/mathfunc

## colorの設定
#
#
#

## Programming ##
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
