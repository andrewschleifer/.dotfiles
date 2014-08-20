
" behavior
set cursorline
set expandtab
set helpheight=999
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
set statusline=%!StatusLine()
set switchbuf=useopen
set tags=tags;/
set viminfo=
set visualbell
set whichwrap=b,s,h,l,<,>,[,]
set wildmode=longest,list

" pathogen!
execute pathogen#infect()
call pathogen#helptags()

" appearance
set t_Co=256
let &colorcolumn=join(range(80,999),",")
let g:zenburn_force_dark_Background=1
colorscheme zenburn
syntax on

" colors
highlight Comment ctermfg=242
highlight CursorLine ctermbg=239
highlight LineNr ctermfg=234 ctermbg=238
highlight NonText ctermfg=232
highlight SpecialKey ctermfg=232
highlight ColorColumn ctermbg=238

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

" fix movement when wrap is on
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
nnoremap <silent> <cr> :nohlsearch<cr>
autocmd CmdwinEnter * :unmap <cr>
autocmd CmdwinLeave * :nnoremap <cr> :nohlsearch<cr>

" fix git cursor position
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" helper things

function StatusLine()
    let line  = '%4p%% '                          "percent through file
    let line .= '[%{strlen(&fenc)?&fenc:"none"}'  "file encoding
    let line .= '%{(&bomb?"+BOM":"")}]'           "byte-order-mark
    let line .= '[%{&ff}]'                        "file format
    let line .= '%y'                              "file type
    let line .= '  '                              "divider
    let line .= '%F'                              "file name
    return line
endfunction

