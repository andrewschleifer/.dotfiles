" fzf

set runtimepath+=/usr/local/opt/fzf
nnoremap <C-o> :FZF!<cr>

" behavior things

set cursorline
set foldcolumn=1
set foldtext=
set helpheight=999
set hidden
set hlsearch
set list
set listchars=tab:›\ ,eol:¬
set nocompatible
set nostartofline
set nowrap
set number
set numberwidth=5
set scrolloff=9
set shortmess=I
set splitbelow
set splitright
set statusline=%!StatusLine()
set switchbuf=useopen
set tags=./.tags;
set viminfo=
set virtualedit=all
set visualbell
set whichwrap=b,s,h,l,<,>,[,]
set wildmode=list:longest
set wildignorecase

" appearance things

colorscheme monochrome
let g:ale_sign_column_always = 1
if !has('nvim')
	set guifont=Menlo\ Regular:h14
endif

" command things

noremap <SPACE> :
map Q <Nop> " goodbye ex mode
nnoremap Y y$ " make Y consistent with C and D
nnoremap <F1> za
vnoremap <F1> zf
nnoremap <Leader>o :ls<CR>:b<Space>

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

" file things

let s:dir = has('win32') ? '$APPDATA/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
if isdirectory(expand(s:dir))
  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap/,' . &directory
  endif
  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup/,' . &backupdir
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo/,' . &undodir
  endif
endif

if exists('+undofile')
  set undofile
endif

" other things

let g:otl_initial_foldlevel = 10

let g:vimwiki_folding = 'expr'
let g:vimwiki_list = [{
	\ 'ext': '.txt',
	\ 'path': '.',
	\ 'syntax': 'markdown',
	\ }]
