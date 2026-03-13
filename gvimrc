"#  ____
"# /\  _`\            __
"# \ \ \L\_\  __  __ /\_\    ___ ___   _ __   ___
"#  \ \ \L_L /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"#   \ \ \/, \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
"#    \ \____/\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"#     \/___/  \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"#                    for vim7.4 / MacVim

"[ ####------- Globals -------------------------#### ]{{{
set ambiwidth=double
let g:save_window_file = expand('$HOME/.vimwinpos')
let g:window_restored = 0
let g:window_restore_in_progress = 0
"}}}
"[ ####------- Window Restore / Save -----------#### ]{{{
function! s:restore_window() abort
    if !has('gui_running')
        let g:window_restored = 1
        return
    endif

    if !filereadable(g:save_window_file)
        let g:window_restored = 1
        return
    endif

    let g:window_restore_in_progress = 1

    let l:lines = readfile(g:save_window_file)

    let l:columns = ''
    let l:rows    = ''
    let l:posx    = ''
    let l:posy    = ''

    for l:line in l:lines
        if l:line =~# '^set columns='
            let l:columns = matchstr(l:line, '\d\+')
        elseif l:line =~# '^set lines='
            let l:rows = matchstr(l:line, '\d\+')
        elseif l:line =~# '^winpos '
            let l:m = matchlist(l:line, '^winpos\s\+\(\d\+\)\s\+\(\d\+\)$')
            if len(l:m) >= 3
                let l:posx = l:m[1]
                let l:posy = l:m[2]
            endif
        endif
    endfor

    if l:posx !=# '' && l:posy !=# ''
        execute 'winpos ' . l:posx . ' ' . l:posy
    endif

    if l:columns !=# '' && str2nr(l:columns) >= 80
        execute 'set columns=' . l:columns
    endif

    if l:rows !=# '' && str2nr(l:rows) >= 20
        execute 'set lines=' . l:rows
    endif

    if l:columns !=# '' && str2nr(l:columns) >= 80
        let g:NERDTreeWinSize = max([20, str2nr(l:columns) / 5])
    endif

    let g:window_restore_in_progress = 0
    let g:window_restored = 1
endfunction

function! s:save_window() abort
    if !has('gui_running')
        return
    endif

    if !get(g:, 'window_restored', 0)
        return
    endif

    if get(g:, 'window_restore_in_progress', 0)
        return
    endif

    let l:columns = &columns
    let l:rows    = &lines
    let l:posx    = getwinposx()
    let l:posy    = getwinposy()

    if l:columns < 80 || l:rows < 20
        return
    endif

    if l:posx < 0 || l:posy < 0
        return
    endif

    let g:NERDTreeWinSize = max([20, l:columns / 5])

    call writefile([
                \ 'set columns=' . l:columns,
                \ 'set lines=' . l:rows,
                \ 'winpos ' . l:posx . ' ' . l:posy,
                \ ], g:save_window_file)
endfunction

function! s:setup_window_supervise() abort
    augroup SaveWindow
        autocmd!
        " 安定性優先: 終了時だけ保存
        autocmd VimLeavePre * call <SID>save_window()
        autocmd OptionSet guifont call <SID>save_window()
    augroup END
endfunction
"}}}
"[ ####------- GUI Common Settings -------------#### ]{{{
function! MyGUISetting() abort
    if has('vim_starting')
        set iminsert=0
    endif

    set number
    set nowrap

    if has('clipboard')
        set clipboard+=unnamed
    endif

    set guioptions-=t
    set guioptions-=r
    set guioptions-=l
    set guioptions-=b

    set fuoptions=maxvert,maxhorz

    augroup FocusTransparency
        autocmd!
        if has('mac')
            autocmd FocusGained * set transparency=25
            autocmd FocusLost   * set transparency=0
        endif
    augroup END
endfunction
"}}}
"[ ####------- MacVim Settings -----------------#### ]{{{
function! MyGUIMacVimSetting() abort
    let g:my_colorscheme = 'iceberg'

    try
        execute 'colorscheme ' . g:my_colorscheme
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
    endtry

    if has('mac')
        set transparency=25
    endif

    set imdisable
    set antialias
    set nobackup
    set guifont=Source\ Code\ Pro\ for\ Powerline:h16
endfunction
"}}}
"[ ####------- Lazy GUI Setup ------------------#### ]{{{
function! MyGUISettingLazy() abort
    if has('multi_byte_ime')
        highlight Cursor   guifg=NONE guibg=Green
        highlight CursorIM guifg=NONE guibg=Purple
    endif

    if has('gui_macvim')
        call MyGUIMacVimSetting()
    endif

    call <SID>setup_window_supervise()

    " 安定性優先で少し遅らせて復元
    call timer_start(75, { -> <SID>restore_window() })
endfunction
"}}}
"[ ####------- Startup Hooks -------------------#### ]{{{
if has('gui_running')
    call MyGUISetting()
endif

augroup MyGVimStartup
    autocmd!
    autocmd GUIEnter * call MyGUISettingLazy()
    autocmd VimEnter * if exists(':AirlineRefresh') | silent! AirlineRefresh | endif
    autocmd ColorScheme * if exists(':AirlineRefresh') | silent! AirlineRefresh | endif
augroup END
"}}}
"[ ####------- Read Local Settings -------------#### ]{{{
let g:user_local_gvimrc = expand('$HOME/.gvimrc.local')
if filereadable(g:user_local_gvimrc)
    execute 'source ' . fnameescape(g:user_local_gvimrc)
endif

if expand($PWD) !=# expand($HOME)
    let g:local_gvimrc = $PWD . '/.gvimrc.local'
    if filereadable(expand(g:local_gvimrc))
        execute 'source ' . fnameescape(expand(g:local_gvimrc))
    endif
endif
"}}}

"#__END__
