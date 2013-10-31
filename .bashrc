# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

### If not running interactively, don't do anything
[ -z "$PS1" ] && return

### check the window size after each command and, if necessary,
### update the values of LINES and COLUMNS.
shopt -s checkwinsize

### set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

### Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
### If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

### enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

### if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Aliases

#../.../..../.....
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#ls
alias ls='ls -lh --color' # Human sizes and color in list form
alias lsa='ls -lha --color'
alias lx='ls -XB'         # Sort by extension
alias lxa='lsa -XB'
alias lk='ls -Sr'         # Sort by size, biggest last
alias lka='lsa -Sr'
alias lt='ls -tr'         # Sort by date, recent last
alias lta='lsa -tr'
alias lc='ls -tcr'        # Sort by modified time, recent last
alias lca='lsa -tcr'
alias lu='ls -tur'        # Sort by access time, recent last
# opted not to create a 'lua' because of lua being a programming language.

#Custom commands
alias stats='date; acpi'
alias e='emacs' # Talk about lazy!
alias v='vim'   # Dial v for Vim!

### Fancy Text Functions

BOLD=$(tput bold)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
RESET=$(tput sgr 0)

### The Prompts
#  {green}     {red}           {yellow}
# [user@host] [~/path/to/dir] [vc:branch]
# $ \  {green}
# >    {green}
PS1='\[$BOLD\]\[$GREEN\][\u@\h] \[$RED\][\w] \[$YELLOW\]$(vcprompt -f '[%s:%b%m%u%a]')\n\[$RESET\]\[$GREEN\]\$\[$RESET\] '
PS2='\[$GREEN\]>\[$RESET\] '

### rvm path (throws a fit if it's elsewhere in the file)
[[ -s "/home/hoppe/.rvm/scripts/rvm" ]] && source "/home/hoppe/.rvm/scripts/rvm"
