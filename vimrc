
" configuration
set cursorline
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
set switchbuf=useopen
set t_Co=256
let &colorcolumn=join(range(80,999),",")
let did_install_syntax_menu=1
let g:zenburn_force_dark_Background=1
colorscheme zenburn
syntax on

" overrides
highlight Comment ctermfg=242
highlight CursorLine ctermbg=239
highlight LineNr ctermfg=234 ctermbg=238
highlight NonText ctermfg=232
highlight SpecialKey ctermfg=232
highlight ColorColumn ctermbg=238

" statusline
set statusline=
set statusline+=%4p%%\                           "percent through file
set statusline+=[%{strlen(&fenc)?&fenc:'none'}   "file encoding
set statusline+=%{(&bomb?'+BOM':'')}]            "byte-order-mark
set statusline+=[%{&ff}]                         "file format
set statusline+=%y                               "file type
set statusline+=\ \                              "divider
set statusline+=%F\                              "file name

" file navigation
let g:ctrlp_user_command = 'find %s -type f | grep -v \.git/'
map <Leader>] :bnext<cr>
map <Leader>[ :bprevious<cr>
map <Leader>t :CtrlP<cr>

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

