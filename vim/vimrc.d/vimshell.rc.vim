"# VimShellを新規Windowで立ち上げる
command! Shell call Shell()

nmap <silent> <Space>s :<C-u> call Shell()<CR>
function! Shell()
    echo 'vimshell start'
    VimShell
    setlocal number
endfunction

nmap <silent> <Space>S :<C-u> call ShellSplit()<CR>
function! ShellSplit()
    split
    call Shell()
endfunction

