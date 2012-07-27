"カラースキーマの設定
colorscheme solarized

"# インサートモード以外でIMEをオフ
set iminsert

"# 列番号表示をDefault
set number

if has('multi_byte_ime')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
endif


"# yankとclipboardを同期する
set clipboard+=unnamed

set guioptions-=t

"MacVim用
if has('gui_macvim')
    "set transparency=5
    set imdisable 
    set antialias
    set guifont=Ricty:h16
    set nobackup
endif

if has("gui_running")
    set fuoptions=maxvert,maxhorz
endif

let g:save_window_file = expand('$HOME/.vimwinpos')

if filereadable(g:save_window_file)
    source g:save_window_file
endif

augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
        let options = [
                    \ 'set columns=' . &columns,
                    \ 'set lines=' . &lines,
                    \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
                    \ ]
        call writefile(options, g:save_window_file)
    endfunction
augroup END

