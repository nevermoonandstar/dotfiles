### 256 Color Mode
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

### Python Startup File
export PYTHONSTARTUP=/home/hoppe/.pythonrc.py

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

### C* compile function
ccc ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.c)   gcc $1 -o $2 ;;
            *.cpp) g++ $1 -o $2 ;;
            *) echo "'$1' can't be compiled via ccc()" ;;
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

### List my IP addresses
myips ()
{
    ifconfig | grep '.' | grep 'inet addr:' | sed 's/^ *//g' | cut -d ' ' -f 2 | sed 's/addr://g' | paste -sd ' ' | sed 's/ / | /g'
}

### Dump stats
stats ()
{
    date
    acpi
}

### Fix pip in case of Assertion errors
fixpip ()
{
    easy_install pip && pip install -U distribute
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

#dict
alias -g dict='dict -d wn' # Search just WordNet by default

#grep
alias -g cgrep='grep --color=always' # [c]olor [grep]

#gcc/g++
alias -g gpp='g++' # I don't need a shift key!

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
# ltree: Show directory structure in a tree format
# source: http://www.commandlinefu.com/commands/view/710/graphical-tree-of-sub-directories
alias -g ltree="\ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"

#tmux
alias -g tmux="tmux -2" # 256 color mode by default

#Lazy!
alias -g c='cd'                   # 1/2 the keys!
alias -g e='emacs -nw'            # Talk about lazy! [e]macs!
alias -g vi='vim'                 # vim always.
alias -g v='vim'                  # Dial v for Vim!
alias -g s='source'               # Or s for a new bash config.
alias -g py='python3'             # Python!
alias -g py2='python'             # Or 2.7.x, if you _have_ to.
alias -g ipy='ipython'            # IPython
alias -g mysql='mysql -u root -p' # Quickly jump to mysql console

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
# {gr}      {red}        {gr}{normal}        {yl}
# user@host ~/path/to/dir $ \                version:control
# > {gr}
PS1='${BOLD}${GREEN}$(pyhoc "%l")${RED}$(pyhoc "%d")${BOLD}${GREEN}%#${RESET} '
RPROMPT='${YELLOW}${BOLD}$(vcprompt -f "%s:%b%m%u%a ")${RESET}'
PS2='${GREEN}>${RESET} '

rvm use default 1> /dev/null 2> /dev/null # Initialize Ruby via RVM silently
