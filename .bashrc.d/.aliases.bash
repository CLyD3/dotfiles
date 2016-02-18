alias ..='cd ..'
alias g='git'
alias top='htop'
alias ls='ls --color=auto -F'

# display file metadata
alias metadata='find -exec file {} \;'

###############
### FINDING ###
###############

# by name
alias fname='find -name'

# by path
alias fpath='find -path'

alias sbrc='source ~/.bashrc'


###random
# exact match
alias wtfis='apropos -e'


##########################
### SYSTEM-INFORMATION ###
##########################

# display current date
alias now='date +"%T %d-%m-%Y"'

# show mounted deviced in nice columns
alias mounted='mount | column -t'

# show memory allocations of a process
pmapof(){ pmap $(pgrep $1); }

# list open files of a process
lsofof(){ lsof -p $(pgrep $1); }

# tulpen <3
alias tulpena='netstat -tulpena'

# find broken symlinks
alias brokensl='find . -type l -! -exec test -e {} \; -print'

# open svg with feh (requires imagemagick)
alias fehvg='feh --magick-timeout 1'

##############
### PACMAN ###
##############

# list all installed packages not in base or base-devel ordered by size
alias expacnbnbd='expac -H M "%011m\t%-20n\t%10d" $( comm -23 <(pacman -Qqen|sort) <(pacman -Qqg base base-devel|sort) ) | sort -n'

# list latest installed packages
alias expaclatest="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -20"

############
### MISC ###
############

# timeout 8 seconds
# interactive
# prompt before override
alias mv=' timeout 8 mv -iv'

# timeout 3 seconds
# prompt once before removing more than three files, or when removing recursively
# verbose
# prevents multi file system operations
alias del=' timeout 3 rm -Iv --one-file-system'

# verbose
alias cp='cp -v'

# parents get created if they dont exist
# verbose
alias mkdir='mkdir -p -v'


#coloring
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

##################
### NETWORKING ###
##################

# return by default
alias wget='wget -c'

# checks if 8.8.8.8 is reachable
alias checknet='ping 8.8.8.8'

# reverse dns
alias revdns='dig +noall +answer -x'

capture_http(){ ngrep -q -d $1 -W byline port 80; }

###########
### FUN ###
###########

alias starwars='telnet towel.blinkenlights.nl'
alias randomkitten='wget -O - http://placekitten.com/$[500 + RANDOM % 500] | feh -'


###########################
### Just comment things ###
###########################

# list all files owned by a package
# pacman -Qlq package | grep -v '/$' | xargs du -h | sort -h

# remove orpans and their configs
# pacman -Rns $(pacman -Qtdq)

# check for journalctl errors
# journalctl -p 3 -xb -q


# *typing long command* CTRL+U *DO ALL THE STUFF* CTRL+Y Return to business
 
# stopwatch: time read 

# man hier # information about the filesystem

# ESC + *  # apply auto completion to cl

# ram fun : sudo dd if=/dev/mem | cat | strings



