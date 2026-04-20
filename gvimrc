"#  ____
"# /\  _`\            __
"# \ \ \L\_\  __  __ /\_\    ___ ___   _ __   ___
"#  \ \ \L_L /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"#   \ \ \/, \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
"#    \ \____/\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"#     \/___/  \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"#       for vim9.2 nvim0.12 / MacVim / Neovide

"[ ####------- Globals -------------------------#### ]{{{
set ambiwidth=double

" fold を marker ベースで使うなら有効化
" set foldmethod=marker
" set foldlevelstart=20

let g:save_window_file = expand('$HOME/.vimwinpos')
let g:window_restored = 0
let g:window_restore_in_progress = 0
"}}}
"[ ####------- Window Restore / Save -----------#### ]{{{
function! s:read_window_state() abort
    let l:state = {
                \ 'columns': '',
                \ 'rows': '',
                \ 'posx': '',
                \ 'posy': '',
                \ }

    if !filereadable(g:save_window_file)
        return l:state
    endif

    for l:line in readfile(g:save_window_file)
        if l:line =~# '^set columns='
            let l:state.columns = matchstr(l:line, '\d\+')
        elseif l:line =~# '^set lines='
            let l:state.rows = matchstr(l:line, '\d\+')
        elseif l:line =~# '^winpos '
            let l:m = matchlist(l:line, '^winpos\s\+\(\d\+\)\s\+\(\d\+\)$')
            if len(l:m) >= 3
                let l:state.posx = l:m[1]
                let l:state.posy = l:m[2]
            endif
        endif
    endfor

    return l:state
endfunction

function! s:restore_window_position() abort
    if !has('gui_running')
        return
    endif

    let l:state = <SID>read_window_state()

    if l:state.posx !=# '' && l:state.posy !=# ''
        if str2nr(l:state.posx) >= 0 && str2nr(l:state.posy) >= 0
            execute 'winpos ' . l:state.posx . ' ' . l:state.posy
        endif
    endif
endfunction

function! s:restore_window_size() abort
    if !has('gui_running')
        let g:window_restored = 1
        return
    endif

    if !filereadable(g:save_window_file)
        let g:window_restored = 1
        return
    endif

    let g:window_restore_in_progress = 1

    let l:state = <SID>read_window_state()

    if l:state.columns !=# '' && str2nr(l:state.columns) >= 80
        execute 'set columns=' . l:state.columns
    endif

    if l:state.rows !=# '' && str2nr(l:state.rows) >= 20
        execute 'set lines=' . l:state.rows
    endif

    if l:state.columns !=# '' && str2nr(l:state.columns) >= 80
        let g:NERDTreeWinSize = max([20, str2nr(l:state.columns) / 5])
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

    " 起動途中や異常値は保存しない
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
        " 安定性優先: 終了時のみ保存
        autocmd VimLeavePre * call <SID>save_window()
    augroup END
endfunction
"}}}
"[ ####------- GUI Common Settings -------------#### ]{{{
function! MyGUISetting() abort
    if has('vim_starting')
        " インサートモード以外では IME off 寄り
        set iminsert=0
    endif

    set number
    set nowrap

    " yank と clipboard を同期
    if has('clipboard')
        set clipboard+=unnamed
    endif

    " menu / scrollbar
    set guioptions-=t
    set guioptions-=r
    set guioptions-=l
    set guioptions-=b

    " fullscreen option
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
"    set guifont=SourceCodePro\ Nerd\ Font\ Mono:h16
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

    " 位置はすぐ戻す
    call <SID>restore_window_position()

    " サイズは少し待って戻す
    call timer_start(75, { -> <SID>restore_window_size() })
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
