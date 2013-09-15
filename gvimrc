"#  ____                                            
"# /\  _`\            __                            
"# \ \ \L\_\  __  __ /\_\    ___ ___   _ __   ___   
"#  \ \ \L_L /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\ 
"#   \ \ \/, \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/ 
"#    \ \____/\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"#     \/___/  \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"#                    for vim7.4                    

"[ ####------ GVim Settings --------------------#### ]{{{

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
            autocmd FocusLost * set transparency=50
        endif
    augroup END
endfunction

function! MyGUISettingLazy()
    call SetupColorScheme()
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

"}}}
"[ ####------ MacVim Settings ------------------#### ]{{{

function! MyGUIMacVimSetting()

    colorscheme chlordane
    augroup color_set
        autocmd!
    augroup END

    set transparency=25
    set imdisable 
    set antialias
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    set nobackup

endfunction

"}}}
"#__END__
