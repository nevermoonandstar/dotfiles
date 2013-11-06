### 256 Color Mode
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

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
alias -g ..='cd ..'
alias -g ..1='cd ..'
alias -g ...='cd ../..'
alias -g ..2='cd ../..'
alias -g ....='cd ../../..'
alias -g ..3='cd ../../..'
alias -g .....='cd ../../../..'
alias -g ..4='cd ../../../..'
alias -g ......='cd ../../../../..'
alias -g ..5='cd ../../../../..'

#ls
alias -g ls='ls -lh --color' # Human sizes and color in list form
alias -g lsa='ls -lha --color'
alias -g lx='ls -XB'         # Sort by extension
alias -g lxa='lsa -XB'
alias -g lk='ls -Sr'         # Sort by size, biggest last
alias -g lka='lsa -Sr'
alias -g lt='ls -tr'         # Sort by date, recent last
alias -g lta='lsa -tr'
alias -g lc='ls -tcr'        # Sort by modified time, recent last
alias -g lca='lsa -tcr'
alias -g lu='ls -tur'        # Sort by access time, recent last
# opted not to create a 'lua' because of lua being a programming language.

#tmux
alias -g tmux="tmux -2" # 256 color mode by default
#Lazy!
alias -g c='cd'       # 1/2 the keys!
alias -g e='emacs'    # Talk about lazy! [e]macs!
alias -g vi='vim'     # vim always.
alias -g v='vim'      # Dial v for Vim!
alias -g s='source'   # Or s for a new bash config.
alias -g py='python3' # Python!
alias -g py2='python' # Or 2.7.x, if you _have_ to.

#Vimlikes
alias -g :q='exit'

### Fancy Text Functions
BOLD=%{$(tput bold)%}
RED=%{$(tput setaf 196)%}
GREEN=%{$(tput setaf 46)%}
YELLOW=%{$(tput setaf 226)%}
BLUE=%{$(tput setaf 18)%}
PURPLE=%{$(tput setaf 165)%}
CYAN=%{$(tput setaf 51)%}
WHITE=%{$(tput setaf 255)%}
RESET=%{$(tput sgr 0)%}

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
