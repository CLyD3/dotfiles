alias ..='cd ..'
alias ....='cd ../..'

if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


#git
alias gls='git status'
alias gcm='git commit -m'