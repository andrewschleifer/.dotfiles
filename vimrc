
" behavior
set cursorline
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
set shortmess=xtI
set statusline=%!StatusLine()
set switchbuf=useopen
set tags=.tags;/
set viminfo=
set visualbell
set whichwrap=b,s,h,l,<,>,[,]
set wildmode=longest,list

" pathogen!
execute pathogen#infect()
call pathogen#helptags()

" appearance
set guifont=Source\ Code\ Pro:h14
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
highlight ColorColumn ctermbg=238 guibg=grey30

" for stupid fingers
noremap <SPACE> :

" goodbye ex mode
map Q <Nop>

" make Y consistent with C and D
nnoremap Y y$

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

" ctrl-p
"let g:ctrlp_map = '<c-p>'

" fix git cursor position
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" helper things

function StatusLine()
    let line  = '%4p%% '                          "percent through file
    let line .= 'u%04.4B '                        "character
    let line .= '[%{strlen(&fenc)?&fenc:"none"}'  "file encoding
    let line .= '%{(&bomb?"+BOM":"")}]'           "byte-order-mark
    let line .= '[%{&ff}]'                        "file format
    let line .= '%y'                              "file type
    let line .= '  '                              "divider
    let line .= '%F'                              "file name
    return line
endfunction

