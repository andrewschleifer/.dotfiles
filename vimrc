
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set runtimepath^=${HOME}/.dot/vim
set tags=tags;/
set viminfo=
set nostartofline
set nowrap
set expandtab
set shiftwidth=4
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]
set hlsearch
set wildmode=longest,list
set scrolloff=9
set hidden
set list
set listchars=tab:→\ ,eol:¬
set number
set numberwidth=5
set shortmess=xtI
set visualbell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=SourceCodePro-Regular:h15
set t_Co=256
set background=dark
let g:zenburn_force_dark_Background=1
colorscheme zenburn
if has("syntax")
    syntax on
    hi Comment ctermfg=black guifg=black
    hi LineNr ctermfg=black
    hi NonText ctermfg=black
    hi SpecialKey ctermfg=black
endif

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

" some readline keybindings
map <C-a> 0
imap <C-a> <C-o>0
map <C-e> $
imap <C-e> <C-o>$

" for stupid fingers
noremap ; :

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

" enter to stop search highlight
nnoremap <cr> :nohlsearch<cr>
autocmd CmdwinEnter * :unmap <cr>
autocmd CmdwinLeave * :nnoremap <cr> :nohlsearch<cr>

" fix git cursor position
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

