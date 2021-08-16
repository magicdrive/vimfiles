"#  ____
"# /\  _`\            __
"# \ \ \L\_\  __  __ /\_\    ___ ___   _ __   ___
"#  \ \ \L_L /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"#   \ \ \/, \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
"#    \ \____/\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"#     \/___/  \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"#                    for vim7.4

"[ ####------- GVim Settings -------------------#### ]{{{

set ambiwidth=double

"# windowの大きさ監視
function! WindowSupervise()
    let g:save_window_file = '$HOME/.vimwinpos'

    if filereadable( expand(g:save_window_file) )
        execute 'source ' . g:save_window_file
    endif

    augroup SaveWindow
        autocmd!
        autocmd BufRead * call s:save_window()
        autocmd VimResized * call s:save_window()
        function! s:save_window()
            let g:NERDTreeWinSize=(&columns / 5)
            let options = [
                        \ 'set columns=' . &columns,
                        \ 'set lines=' . &lines,
                        \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
                        \ ]
            call writefile(options, expand(g:save_window_file) )
        endfunction
    augroup END
endfunction

"# gvimの設定関数
function! MyGUISetting ()
    if has('vim_starting')
        "# インサートモード以外でIMEをオフ
        set iminsert
    endif

    "# LineNumber
    set number
    set nowrap

    "# yankとclipboardを同期する
    set clipboard+=unnamed

    "# menu項目
    set guioptions-=t
    set guioptions-=r
    set guioptions-=l
    set guioptions-=b

    "# fullscreen option
    set fuoptions=maxvert,maxhorz

    augroup focus_transparency
        autocmd!
        if has('mac')
            autocmd FocusGained * set transparency=25
            autocmd FocusLost * set transparency=0
        endif
    augroup END
endfunction

function! MyGUISettingLazy()
    if has('multi_byte_ime')

        highlight Cursor
                    \ guifg=NONE
                    \ guibg=Green
        highlight CursorIM
                    \ guifg=NONE
                    \ guibg=Purple
    endif
    call WindowSupervise()
    if has('gui_macvim')
        call MyGUIMacVimSetting()
    endif
endfunction

if has('gui_running')
    call MyGUISetting ()
endif
autocmd GUIEnter * call MyGUISettingLazy()
autocmd BufEnter * :AirlineRefresh

"}}}
"[ ####------- MacVim Settings -----------------#### ]{{{
function! MyGUIMacVimSetting()

    let g:my_colorscheme= has('gui_running') ?  'iceberg' : 'iceberg'
    try
        exec "colorscheme" . " " . g:my_colorscheme
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
    endtry

    if has("mac")
        set transparency=25
    endif
    set imdisable
    set antialias
    set nobackup
    set guifont=Source\ Code\ Pro\ for\ Powerline:h16

endfunction
"}}}
"[ ####------- Read Local Settings -------------#### ] {{{1
let g:user_local_gvimrc = $HOME . '/.gvimrc.local'
if filereadable(expand(g:user_local_gvimrc))
    execute 'source ' . g:user_local_gvimrc
endif
if expand($PWD) !=# expand($HOME)
    let g:local_gvimrc = $PWD . '/.gvimrc.local'
    if filereadable(expand(g:local_gvimrc))
        execute 'source ' . g:local_gvimrc
    endif
endif
" }}}1
"#__END__
