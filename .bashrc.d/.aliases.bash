###NAVIGATION
alias ..='cd ..'
alias ...='.. && ..' 
alias ....='... && ..'
alias .....='.... && ..'

###LS
alias ls='ls --color=auto'

# show all files
alias la='ls -a'

# use long-list format
alias ll='ls -l'

###GREP

# Show line numbers
alias grp='grep -n'

###random
# exact match
alias apre='apropos -e'
alias g='git'
# start bc with mathlib
alias bc='bc -l'
# Use htop if available
if [ -x /usr/bin/htop ]; then
alias top='htop'
fi
alias sbrc='source ~/.bashrc'


###SYSTEM-INFORMATION$

# display current date
alias now='date +"%T %d-%m-%Y"'
# show mounted deviced in nice columns
alias mount='mount | column -t'
alias meminfo='free -m -l -t'
alias lsofpin='lsof -P -i -n'
alias tulpena='netstat -tulpena'
# find broken symlinks
alias brokensl='find . -type l -! -exec test -e {} \; -print'
# open svg with feh (requires imagemagick)
alias fehvg='feh --magick-timeout 1'

###PACMAN
# list all installed packages not in base or base-devel ordered by size
alias expacnbnbd='expac -H M "%011m\t%-20n\t%10d" $( comm -23 <(pacman -Qqen|sort) <(pacman -Qqg base base-devel|sort) ) | sort -n'

# list latest installed packages
alias expaclatest="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -20"

###MISC BASICS
# timeout 8 seconds
# interactive
# prompt before override
alias mv=' timeout 8 mv -iv'

# timeout 3 seconds
# prompt once before removing more than three files, or when removing recursively
# verbose
# prevents multi file system operations
alias rm=' timeout 3 rm -Iv --one-file-system'

# verbose
alias cp='cp -v'

# parents get created if they dont exist
# verbose
alias mkdir='mkdir -p -v'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


###NETWORKING
# checks if 8.8.8.8 is reachable
alias checknet='ping 8.8.8.8'
#prints the current local ip address (lan over wifi if both are connected)
alias ipad='anyip'
# ip of the ethernet adapter
alias iplan='myip enp9s0'
# ip of the wifi adapter
alias ipwifi='myip wlp11s0'
# subnet of ipad (assuming /24)
alias subnet='ipad | cut -d "." -f1-3'
# pingscan the subnet (assuming /24)
alias nmapsn='echo $(subnet).* | xargs nmap -sn'
alias nmapva='nmap -v -A'

alias revdns='dig +noall +answer -x'

myip(){ ip=$(ip -o -4 addr list $1 | awk '{print $4}' | cut -d/ -f1); echo $ip; }

anyip(){ ipl=$(myip enp9s0); ipw=$(myip wlp11s0); \
    if [[ -z "${ipl// }" ]]; then \
        if [[ -z "${ipw// }" ]]; then \
            exit 0; \
        fi; \
        echo $ipw; \
    fi;
    echo $ipl; \
    }

capture_http(){ ngrep -q -d $1 -W byline port 80; }



###cd & ls combined
cls(){ cd "$1"; ls;}
cla(){ cd "$1"; la;}
cll(){ cd "$1"; ll;}
#not aliasworthy but here to keep
# list all files owned by a package
# pacman -Qlq package | grep -v '/$' | xargs du -h | sort -h
# remove orpans and their configs
# pacman -Rns $(pacman -Qtdq)
#
# check for journalctl errors
# journalctl -p 3 -xb -q

