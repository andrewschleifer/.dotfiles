nnoremap <Leader><CR> :VimwikiSplitLink<CR>
imap <C-l> <c-o>:call NotebookInsertLink()<CR>
function! NotebookInsertLink()
  :exe 'norm i' . '[[' . system('nb next') . ']] '
  :exe 'norm l'
endfunction

