
" configuration
set expandtab
set hidden
set hlsearch
set list
set listchars=tab:→\ ,eol:¬
set nocompatible
set nostartofline
set nowrap
set number
set numberwidth=5
set runtimepath^=${HOME}/.dot/vim
set scrolloff=9
set shiftwidth=4
set shortmess=xtI
set tags=tags;/
set viminfo=
set visualbell
set whichwrap=b,s,h,l,<,>,[,]
set wildmode=longest,list

" pathogen!
execute pathogen#infect()

" appearance
set background=dark
set guifont=SourceCodePro-Regular:h15
set switchbuf=useopen
set t_Co=256
let &colorcolumn=join(range(80,999),",")
let did_install_syntax_menu=1
let g:zenburn_force_dark_Background=1
colorscheme zenburn
syntax on

" overrides
hi Comment ctermfg=black guifg=black
hi LineNr ctermfg=black
hi NonText ctermfg=black
hi SpecialKey ctermfg=black
hi ColorColumn ctermbg=238 guibg=#434443

" statusline
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

