" pathogen!

source ${HOME}/.dot/vim/pathogen/autoload/pathogen.vim
execute pathogen#infect("${HOME}/.dot/vim/{}")

" behavior things

set cursorline
set foldcolumn=1
set foldtext=
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

" appearance things

colorscheme monochrome

" command things

noremap <SPACE> :
nnoremap <silent> <cr> :nohlsearch<cr>
map Q <Nop> " goodbye ex mode
nnoremap Y y$ " make Y consistent with C and D
nnoremap <F1> za
vnoremap <F1> zf

autocmd CmdwinEnter * :unmap <cr>
autocmd CmdwinLeave * :nnoremap <cr> :nohlsearch<cr>

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
    let selection = system('find . -type f | sed "s/^\.\///" | grep -v "^\.git" | choose')
    if empty(selection) | echo "Canceled" | return | end
    exec ":e " . selection
endfunction
nnoremap <C-t> :call Open()<cr>

" file things

let s:dir = has('win32') ? '$APPDATA/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
if isdirectory(expand(s:dir))
  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap//,' . &directory
  endif
  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo//,' . &undodir
  endif
endif

if exists('+undofile')
  set undofile
endif

