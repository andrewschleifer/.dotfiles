
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
set nocompatible
set runtimepath^=${HOME}/.dot/vim
set autoread

runtime macros/matchit.vim

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
set matchpairs=(:),{:},[:],<:>
set shiftwidth=4
set smarttab
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]

if has("autocmd")
    filetype plugin on
    filetype indent on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" interface
set guifont=Menlo:h16
set guioptions-=T             " do not display the toolbar
set hidden
set list listchars=tab:→\ ,eol:¬
set number
set shortmess=xtI             " skip prompts from messages
set showmatch
set visualbell

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
    hi LineNr ctermfg=black
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

" reflow paragraphs
nnoremap <C-q> gqap
vnoremap <C-q> gq

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MARKDOWN

"set filetypes
au BufRead,BufNewFile *.{md,mkdn,markdown} set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NU

" set filetypes
au BufNewFile,BufRead *.nu,*.nujson,Nukefile filetype=nu
au BufNewFile,BufRead *.nu,*.nujson,Nukefile set makeprg=nuke


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PYTHON

" full Python syntax highlighting
let python_highlight_all=1

" make bad whitespace stand out
highlight BadWhitespace ctermbg=red guibg=red

" make scripts executable (if they aren't already) when saved
au BufWritePost *.py if !executable("'%:p'")|exe "sil !chmod a+x '%'"|en

" remove any extra whitespace from the ends of lines when saving a file
au BufWritePre *.py normal m`:%s/\s\+$//e`

" always use UNIX (\n) line endings.
au BufRead,BufNewFile *.py set fileformat=unix

" make leading tabs show as bad
au BufRead,BufNewFile *.py match BadWhitespace /^\t\+/

" make trailing whitespace show as bad
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

" keep indentation at integer multiple of shiftwidth
au BufRead,BufNewFile *.py set shiftround
