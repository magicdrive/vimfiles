let g:projecthome = '/your/project/path'
let g:default_tag = &tags

execute 'set tags+=' . g:projecthome . 'tags'

command! ProjectHome : call ProjectCd() 
function! ProjectCd()
    execute 'cd ' . g:projecthome
endfunction

command! Ctags : call CtagsUpdata()
function! CtagsUpdata()
    let s:pwd = $PWD
    call system( 'cd ' . g:projecthome . ' && ctags -R' )
    call system( 'cd ' . s:pwd  ) | execute 'cd ' . s:pwd 
    execute 'set tags=' . g:default_tag
    execute 'set tags+=' . g:projecthome . 'tags'
endfunction

