function! RubyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
    return line_text . repeat('.', fillcharcount) . ' '
endfunction

setlocal foldtext=RubyFoldText()

set expandtab
set shiftwidth=2
