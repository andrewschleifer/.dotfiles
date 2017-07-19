" pathogen!

set runtimepath^=${HOME}/.dot/vim
execute pathogen#infect()
call pathogen#helptags()

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
set scrolloff=9
set shortmess=I
set statusline=%!StatusLine()
set switchbuf=useopen
set tags=.tags;/
set viminfo=
set visualbell
set whichwrap=b,s,h,l,<,>,[,]
set wildmode=list:longest

" appearance

set guifont=Source\ Code\ Pro:h14
set t_Co=256
colorscheme monochrome
syntax on

" commands

noremap <SPACE> :
nnoremap <silent> <cr> :nohlsearch<cr>
autocmd CmdwinEnter * :unmap <cr>
autocmd CmdwinLeave * :nnoremap <cr> :nohlsearch<cr>

" filetypes

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0]) " fix git cursor position
autocmd FileType fsharp set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab " fix fsharp indent

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

function Open()
    let selection = system('find . -type f | sed "s/^\.\///" | choose')
    if empty(selection) | echo "Canceled" | return | end
    exec ":e " . selection
endfunction
nnoremap <C-t> :call Open()<cr>

