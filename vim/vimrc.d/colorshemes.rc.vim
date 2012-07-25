"#---------------------------------------------#
"#                                             #
"#           カラースキーマの設定              # 
"#                                             #
"#---------------------------------------------#

"{{{1
"# xterm-256color
set t_Co=256

"# カラースキーマ
syntax enable

""set background=light

if has('gui_running')
    nmap <silent> <Leader>b :<C-u> call ChangeBackground()<CR>
    colorscheme solarized
    set background=dark
else
    colorscheme default
    set background=dark
endif

let g:dark=1
function! ChangeBackground()
    if g:dark == '1'
        set background=light
        let g:dark=0
        colorscheme solarized
        echo 'change backgrount=light'
    else
        set background=dark
        let g:dark=1
        colorscheme solarized
        echo 'change backgrount=dark'
    endif
endfunction

let g:solarized_termcolors=256

"# ポップアップのカラースキーム変更
highlight Pmenu ctermfg=Black
highlight PmenuSel ctermbg=DarkMagenta
highlight PmenuSel ctermfg=White

highlight Folded gui=bold term=standout ctermbg=DarkYellow ctermfg=LightGray guibg=Grey30 guifg=Grey80
highlight FoldColumn gui=bold term=standout ctermbg=DarkYellow ctermfg=LightGray guibg=Grey guifg=DarkBlue

"# 検索結果のカラースキーム変更
highlight Search ctermbg=DarkGray

"}}}1
