#cd shorthands
alias ..='cd ..'
alias ....='cd ../..'

#ls shorthands
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'

#cd & ls combined
cls(){ cd "$1"; ls;}
cla(){ cd "$1"; la;}
cll(){ cd "$1"; ll;}

alias now='date +"%T %d-%m-%Y"'

alias mount='mount | column -t'

alias meminfo='free -m -l -t'

alias lsofpin='lsof -P -i -n'

alias tulpena='netstat -tulpena'

#Use htop if available
if [ -x /usr/bin/htop ]; then
	alias top='htop'
fi


#autocolor
if [ -x /usr/bin/dircolors ]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#start bc with mathlib
alias bc='bc -l'

#git
alias gls='git status'
alias gcm='git commit -m'