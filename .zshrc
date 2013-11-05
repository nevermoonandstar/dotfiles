### 256 Color Mode
export TERM=xterm-256color

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

### Convert all files in directory to Unix EOL's
# Requires dos2unix package
eol_dir ()
{ # --quiet and --Follow symlinks to convert targets
    find . -type f -print0 | xargs -0 dos2unix -q -F
    find . -type f -print0 | xargs -0 mac2unix -q -F
}

### Dump stats
stats ()
{
    date
    acpi
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Aliases

#../.../..../.....
#..[1-5]
alias ..='cd ..'
alias ..1='cd ..'
alias ...='cd ../..'
alias ..2='cd ../..'
alias ....='cd ../../..'
alias ..3='cd ../../..'
alias .....='cd ../../../..'
alias ..4='cd ../../../..'
alias ......='cd ../../../../..'
alias ..5='cd ../../../../..'

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

#Lazy!
alias c='cd'       # 1/2 the keys!
alias e='emacs'    # Talk about lazy! [e]macs!
alias vi='vim'     # vim always.
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

### Needed for vcprompt (~/bin/vcprompt)
setopt prompt_subst

### The Prompts
#  {green}     {red}           {yellow}
# [user@host] [~/path/to/dir] [vc:branch] {bold}
# $ \  {green}
# >    {green}
PS1='${BOLD}${GREEN}[%n@%m] ${RED}[%~] ${YELLOW}$(vcprompt -f "[%s:%b%m%u%a]")${RESET}${GREEN}
%#${RESET} '
PS2='${GREEN}>${RESET} '
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
