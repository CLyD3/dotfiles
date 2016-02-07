# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# append to the history file, don't overwrite it
shopt -s histappend

#2^12 lines of history in memory
HISTSIZE=$((1 << 12))

#2^24 lines of history in file
HISTFILESIZE=$((1 << 24))

# ignore duplicated commands and whitespace in history
HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# source alias definitions.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
