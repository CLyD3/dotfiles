# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac




#2^12 lines of history in memory
HISTSIZE=$((1 << 12))

#2^24 lines of history in file
HISTFILESIZE=$((1 << 24))

# ignore duplicated commands and whitespace in history
HISTCONTROL=ignoreboth

#ignore ls withouth arguments and build in commands
HISTIGNORE="&:ls:[bf]g:exit"

# append to the history file, don't overwrite it
shopt -s histappend

#combine multiline commands
shopt -s cmdhist

#check window size and recalculate rows/columns
shopt -s checkwinsize

#include dotfiles in glob
shopt -s dotglob


#color for man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


# Load any supplementary scripts
if [[ -d $HOME/.bashrc.d ]] ; then
    for bashrc in "$HOME"/.bashrc.d/*.bash ; do
      echo "loading "$bashrc
        if [[ -e $bashrc ]] ; then
            source "$bashrc"
        fi
    done
    unset -v bashrc
fi
