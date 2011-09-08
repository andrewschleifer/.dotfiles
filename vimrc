
" general
set nocompatible
set runtimepath^=${HOME}/.dot/vim
filetype plugin indent on

" colors
set background=dark
colorscheme zenburn
let g:zenburn_force_dark_Background=1
syntax on
hi Comment ctermfg=black guifg=black

" interface
set backspace=indent,eol,start
set guifont=Menlo:h16
set guioptions-=T                      " do not display the toolbar
set laststatus=2
set list listchars=tab:→\ 
set matchpairs=(:),{:},[:],<:>
set nowrap
set number
set ruler
set scrolloff=9
set shortmess=xtI                      " skip prompts from messages
set showcmd
set showmatch
set showmode
set visualbell
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu
set wildmode=longest:full

" statusline
set statusline=\                                 " "
set statusline+=%<%f                             "filename
set statusline+=\                                " "
set statusline+=%r                               "read-only flag
set statusline+=%m                               "modified flag
set statusline+=%=                               "separator
set statusline+=%y                               "filetype
set statusline+=[%{&ff}]                         "file format
set statusline+=[%{strlen(&fenc)?&fenc:'none'}]  "file encoding
set statusline+=%9(%l,%v%)                       "the ruler
set statusline+=%5p%%                            "percent through file
set statusline+=\                                " "

" backups
set nowritebackup                      " do not keep a backup while working
set nobackup                           " do not keep a backup after close
set viminfo=""                         " do not keep a .viminfo file
set noswapfile                         " do not keep .swp files

" formatting
set autoindent
set expandtab
set nostartofline
set shiftwidth=4
set smarttab
set tabstop=4

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
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NU

" set filetypes
au BufNewFile,BufRead *.nu,*.nujson,Nukefile setf nu
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

