# Frontend to controlling prompt
prompt() {

    # If no arguments, print the prompt strings as they are
    if ! (($#)) ; then
        declare -p PS1 PS2 PS3 PS4
        return
    fi

    # What's done next depends on the first argument to the function
    case $1 in

        # Turn complex, colored PS1 and debugging PS4 prompts on
        on)
            # Set up pre-prompt command
            PROMPT_COMMAND='declare -i PROMPT_RETURN=$? ; history -a'
            # Set up prompt, including optional PROMPT_PREFIX and PROMPT_SUFFIX
            # variables
            PS1='[\u@\h:\w]'
            PS1=$PS1'$(prompt job)'
            PS1=$PS1'$(prompt git)'
            PS1=$PS1'$(prompt ret)'
            PS1='$PROMPT_PREFIX'$PS1
            PS1=$PS1'$PROMPT_SUFFIX'
            PS1=$PS1'\n\$'

            # If Bash 4.0 is available, trim very long paths in prompt
            if ((BASH_VERSINFO[0] >= 4)) ; then
                PROMPT_DIRTRIM=4
            fi

            # Prepare reset code
            local reset
            reset=$( {
                tput me || tput sgr0
            } 2>/dev/null )

            # Decide prompt color formatting based on color availability
            local format
            format=$( {
                tput AF 4 || tput setaf 4
                tput md || tput bold
            } 2>/dev/null )

            # String it all together
            PS1='\['"$format"'\]'"$PS1"'\['"$reset"'\] '
            PS2='> '
            PS3='? '
            PS4='+<$?> ${BASH_SOURCE:-$BASH}:$FUNCNAME:$LINENO:'
            ;;

        # Revert to simple inexpensive prompts
        off)
            unset -v PROMPT_COMMAND PROMPT_DIRTRIM PROMPT_RETURN
            PS1='\$ '
            PS2='> '
            PS3='? '
            PS4='+ '
            ;;

        git)
            # Bail if we have no git(1)
            if ! hash git 2>/dev/null ; then
                return 1
            fi

            # Attempt to determine git branch, bail if we can't
            local branch
            branch=$( {
                git symbolic-ref --quiet HEAD \
                || git rev-parse --short HEAD
            } 2>/dev/null )
            if [[ ! -n $branch ]] ; then
                return 1
            fi
            branch=${branch##*/}

            # Safely read status with -z --porcelain
            local line
            local -i ready modified untracked
            while IFS= read -d '' -r line ; do
                if [[ $line == [MADRCT]* ]] ; then
                    ready=1
                fi
                if [[ $line == ?[MADRCT]* ]] ; then
                    modified=1
                fi
                if [[ $line == '??'* ]] ; then
                    untracked=1
                fi
            done < <(git status -z --porcelain 2>/dev/null)

            # Build state array from status output flags
            local -a state
            if ((ready)) ; then
                state[${#state[@]}]='+'
            fi
            if ((modified)) ; then
                state[${#state[@]}]='!'
            fi
            if ((untracked)) ; then
                state[${#state[@]}]='?'
            fi

            # Add another indicator if we have stashed changes
            if git rev-parse --verify refs/stash >/dev/null 2>&1 ; then
                state[${#state[@]}]='^'
            fi

            # Print the status in brackets with a git: prefix
            (IFS= ; printf '(git:%s%s)' "${branch:-unknown}" "${state[*]}")
            ;;

        # Show return status of previous command in angle brackets, if not zero
        ret)
            if ((PROMPT_RETURN > 0)) ; then
                printf '<%d>' "$PROMPT_RETURN"
            fi
            ;;

        # Show the count of background jobs in curly brackets, if not zero
        job)
            local -i jobc
            while read -r _ ; do
                ((jobc++))
            done < <(jobs -p)
            if ((jobc > 0)) ; then
                printf '{%u}' "$jobc"
            fi
            ;;

        # Print error
        *)
            printf '%s: Unknown command %s\n' "$FUNCNAME" "$1" >&2
            return 2
            ;;

    esac
}

# Complete words
complete -W 'on off git ret job' prompt

# Start with full-fledged prompt
prompt on