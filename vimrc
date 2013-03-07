
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
set nocompatible
set runtimepath^=${HOME}/.dot/vim
set autoread
set tags=tags;/

" backups
set nowritebackup                      " do not keep a backup while working
set nobackup                           " do not keep a backup after close
set noswapfile                         " do not keep .swp files
set viminfo=""                         " do not keep a .viminfo file

" formatting
set nostartofline
set nowrap
set autoindent
set backspace=indent,eol,start
set expandtab
set matchpairs=(:),{:},[:]
set shiftwidth=4
set smarttab
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]

if has("autocmd")
    filetype plugin on
    filetype indent on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" interface
set guifont=SourceCodePro-Regular:h15
set hidden
set list listchars=tab:→\ ,eol:¬
set number
set shortmess=xtI             " skip prompts from messages
set showmatch
set visualbell

" search
set hlsearch
set incsearch

"commands
set noshowcmd
set cmdheight=1

"completion
set wildmenu
set wildmode=longest:full

"scrolling
set scrolloff=9
set sidescroll=1
set sidescrolloff=9

" colors
set background=dark
let g:zenburn_force_dark_Background=1
colorscheme zenburn
if has("syntax")
    syntax on
    hi Comment ctermfg=black guifg=black
    hi LineNr ctermfg=black ctermbg=darkgrey
    hi NonText ctermfg=black
    hi SpecialKey ctermfg=0
endif

" statusline
set noruler
set laststatus=2

set statusline=\                                 "space
set statusline+=%<%f                             "filename
set statusline+=\                                "space
set statusline+=%r                               "read-only flag
set statusline+=%m                               "modified flag
set statusline+=%=                               "separator
set statusline+=%y                               "filetype
set statusline+=[%{&ff}]                         "file format
set statusline+=[%{strlen(&fenc)?&fenc:'none'}]  "file encoding
set statusline+=%9(%l,%v%)                       "the ruler
set statusline+=%5p%%                            "percent through file
set statusline+=\                                "space

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keymappings
let mapleader=","

" some readline keybindings
map <C-a> 0
imap <C-a> <C-o>0
map <C-e> $
imap <C-e> <C-o>$

" for stupid fingers
noremap ; :

" leader+search to turn off highlighting
nnoremap <leader>/ :nohls<CR>

" fix movement when wrap is turned on
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
nnoremap <Down> gj
inoremap <Down> <C-o>gj
vnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Up> gk
inoremap <Up> <C-o>gk

nnoremap <cr> :nohlsearch<cr>
autocmd CmdwinEnter * :unmap <cr>
autocmd CmdwinLeave * :nnoremap <cr> :nohlsearch<cr>

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

