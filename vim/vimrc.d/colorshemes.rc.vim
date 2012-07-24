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
colorscheme solarized
colorscheme default

if has('gui_running')
    set background=dark
else
    set background=dark
endif

nmap <silent> <Leader>b :<C-u> call ChangeBackground()<CR>

function! ChangeBackground()
    if &background == 'dark'
        set background=light
        echo 'change backgrount=light'
    else
        set background=dark
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
