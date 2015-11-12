scriptencoding utf-8
set encoding=utf-8
set nocompatible
filetype plugin on
filetype indent on
syntax on
" let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set t_Co=16

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1

set mouse=a
set guifont=Inconsolata\ Bold\ 18
set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right scrollbar
set guioptions-=l " remove left scrollbar
set guioptions-=b " remove bottom scrollbar
set guioptions-=R " remove right scrollbar during split mode
set guioptions-=L " remove left scrollbar during split mode
set guioptions-=B " remove bottom scrollbar during split mode
set guioptions+=agi " [a]utoselect, [g]rey menu items, V[i]m icon
set title titlestring=Calculus
au FocusGained * redraw! " redraw screen on focus

set splitright " split opens on right by default
set splitbelow " vsplit opens below by default
set scrolloff=4 " scroll up and down when less than x away from edge
set textwidth=0
set formatoptions-=t
set wrap
set wrapmargin=0 " no wrapping!

" normal text background = none
" hi Normal ctermbg=NONE <--Testing off

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

function WordCount()
    let s:old_status = v:statusmsg
    exe "silent normal g\<c-g>"
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
    return s:word_count
endfunction

set fileformats=unix,dos,mac

let g:netrw_liststyle=3 " :e begins in tree view

set shortmess=atI " [a]ll short messages, [t]runcate on load, no [I]ntro screen

let g:matchparen_insert_timeout=5 " Shorter time out of paren match find.
set laststatus=2 " status line of last window is [0] never [2] always on
set statusline+=%F\ %r%m "[F]ull file path, [%r]ead-only and [%m]odified flags
set statusline+=%=[\ %{&ff}\ ]\ [\ L:%l/%L\ C:%c\ F:%p/100\ ]
" [%=]right justify, %{&f[ile]f[ormat]} [%l]ine out of [%L]ines, [%c]olumn
" numbers, and [%p]ercent of file the cursor is at.
set textwidth=79 " nothing by itself, but allows colorcolumn to work to
set nosmartindent " no smart autoindenting
set autoindent " autoindenting
set expandtab " tabs to spaces
set shiftwidth=4 " spaces to autoindent
set softtabstop=4 " spaces per tab
set tabstop=8 " ln of spaces of a hard tab
set shiftround " round soft tabs to half units of softtabstop
set nocindent " no c based indenting
set copyindent " copy and paste indents with text
set preserveindent " preserve indents
set showmatch " highlight matches while searching
set incsearch " highlight matches while typing for searches
set showcmd " show last command

" List invisible characters
set list listchars=tab:i\»,trail:\· " but only tabs and trailing spaces

set ignorecase " ignore case while searching

set nobackup " no .swp files, please

set cmdheight=1 " command line is strictly 1 tall
set number " show line numbers
set noerrorbells " no error bells
set visualbell t_vb= " and no frowny faces either
set wildmenu " instead of tab being autocomplete, it shows all matching items
set wildmode=list:longest " do not truncate wildmenu
set ttyfast " fast terminal? yep. What is this, 1960?
set noswapfile " No swp files. so annoying

" print with :hardcopy[!] or :ha[!]
set printfont=Ubuntu_Mono:h12:cANSI " print font
set printoptions+=left:32pt  " 1/2 in left margin
set printoptions+=right:32pt " 1/2 in right margin
set printoptions+=number:y   " print line numbers
set printoptions+=portrait:n " print landscape, when toggling with printer pref
set printoptions+=syntax:n   " do not print syntax coloration

" ruby mode: 2 space indents
" set this stuff in ~/.vim/ftplugin/ruby.vim as well.
autocmd Filetype ruby setlocal sts=2 ts=2 sw=2 expandtab

let mapleader=" " " <Leader> = <Space>

inoremap <S-Tab> <C-V><Tab>
    " Shift-Tab: Hard Tab
map <F2> :set background=light <cr>
    " F2: use light background
map <F3> :set background=dark <cr>
    " F3: use dark background
map <F4> :set colorcolumn=+1 <cr>
    " F4: turn on visible last column
map <F5> :set colorcolumn="" <cr>
    " F5: turn off visible last column
map <F12> :redraw! <cr>
    " F12: redraw screen
map <Leader>r :redraw! <cr>

