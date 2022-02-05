" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
" language en_GB              " sets the language of the messages / ui (vim)

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number relativenumber       "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" if has('persistent_undo')
   " if has('win32')
"       silent !mkdir \%HOMEPATH\%\.vim\backups " > /dev/null 2>&1
 "   el
  "     silent !mkdir ~/.vim/backups " > /dev/null 2>&1
   " endif
   " set undodir=~/.vim/backups
   " set undofile
" endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=3
set softtabstop=3
" set tabstop=3
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list
set listchars=tab:>-,trail:.

set wrap       "wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

" set wildmode=list:list
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=3         "Start scrolling when we're 3 lines away from margins
set sidescrolloff=15
set sidescroll=1
verbose set scroll=5

" ================ Status Line ========================
set laststatus=2        "show the status line always
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set ruler               "Display ruler at the bottom of window

" ================ Custom Settings ========================
let g:solarized_italic = 0
set background=dark
colorscheme solarized
set guioptions-=T       "Do not display toolbar in GVIM - use commands instead :)
set hlsearch            "Display search term in text to be more visible
set autowrite           "save files before make/compile
let g:netrw_liststyle=3 "change listing to tree in netrw
let g:netrw_preview   = 1
let g:netrw_winsize   = 30
set encoding=utf-8
set fileencoding=utf-8
set ignorecase smartcase "Smart ignore case
let g:c_syntax_for_h=1   " *.h files are C style

let g:NERDSpaceDelims=1  "puts spaces into comments
au GUIEnter * simalt ~x   "maximize the wimndow after start

set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}  "change the title of the winwod

set tags=./tags;/         "search path for the TAGs file. This will loop up  the tree until one is found
set diffopt=vertical
set guifont=Consolas:h10:b

set mouse=""              "disable the mouse support altogether
set splitbelow
set splitright

" ================ Custom Mapping ========================
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

" ================ Autoloads =============================
"

" ================ Syntastic  ====================

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
