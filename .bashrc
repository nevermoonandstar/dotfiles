# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

### 256 Color Mode
export TERM=xterm-256color

### If not running interactively, don't do anything
[ -z "$PS1" ] && return

### check the window size after each command and, if necessary,
### update the values of LINES and COLUMNS.
shopt -s checkwinsize

### set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

### Extract function
extract ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xjf $1    ;;
            *.tar.gz)  tar xzf $1    ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar e $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xf $1     ;;
            *.tbz2)    tar xjf $1    ;;
            *.tgz)     tar xzf $1    ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

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

#Lazy!
alias e='emacs'    # Talk about lazy! [e]macs!
alias v='vim'      # Dial v for Vim!
alias s='source'   # Or s for a new bash config.
alias py='python3' # Python!
alias py2='python' # Or 2.7.x, if you _have_ to.

#Vimlikes
alias :q='exit'

### Fancy Text Functions

BOLD=$(tput bold)
RED=$(tput setaf 196)
GREEN=$(tput setaf 46)
YELLOW=$(tput setaf 226)
BLUE=$(tput setaf 18)
PURPLE=$(tput setaf 165)
CYAN=$(tput setaf 51)
WHITE=$(tput setaf 255)
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
