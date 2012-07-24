"#----------------------------------------------------------# 
"#                                                          #
"# Vim基本設定                                              # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"mapkeyprefix
map <Space> <Plug>(mykey)
map , <Plug>(mykeylite)

"# vi互換のoff
set nocompatible

"# 強制終了の無効化
noremap ZZ <Nop>
noremap ZQ <Nop>

"# シンタックスハイライト
syntax on

"# difine foldmethod
set foldmethod=marker
set foldtext=FoldCCtext()

"# 保存なしで他のファイルを開ける
set hidden

"# Window幅で折り返す
set wrap

"# scroll時の最小行数値
set scrolljump=15

"# tabを表示 
set listchars=eol:$,tab:>\ 

"# 補完キーをCtrl+jに変更
inoremap <C-j> <C-n>

"# backspaceキーの動作
noremap  ^? <C-h>
noremap! ^? <C-h>

"# 高速ターミナル接続
set ttyfast

"# Plug-in有効設定
filetype plugin indent on
filetype plugin on

"{{{2
"# vimファイル読み込み
command! -nargs=0 SA :call VimLRun()
command! -nargs=0 SU :call VimrcReload()
command! -nargs=0 VimrcEdit edit $HOME/.vim/vimrc.d
command! -nargs=0 VE VimrcEdit 

if has('vim_starting')

    function! VimLRun()
        source %
        edit!
    endfunction

    function! VimrcReload()
        source $HOME/.vimrc
        edit!
        echo 'reloaded!'
    endfunction
    
endif

"# vimrcの編集
nmap <Plug>(mykey)v :VimrcEdit<CR>
"}}}2

"# command modeへの切り替え
noremap ; :

vnoremap <Plug>(mykey)s :s///<LEFT><LEFT>
nnoremap <Plug>(mykey)s :%s///<LEFT><LEFT>

"# <ESC>のマッピング
noremap <silent> <C-@> <ESC>
noremap! <silent> <C-@> <ESC>
cnoremap <silent> <C-@> <C-c>
noremap <silent> <C-l> <ESC>
noremap! <silent> <C-l> <ESC>
cnoremap <silent> <C-l> <C-c>

"{{{2
"# ステータスライン(vim_powerlineがoffの場合に表示)
set statusline=%F%m%r%h%w\ 
            \[FORMAT=%{'['.(&fenc!=''?&fenc:'?').'::'.&ff.']'}]\ 
            \[TYPE=%Y]\ 
            \[ASCII=\%03.3b]\ 
            \[HEX=\%02.2B]\ 
            \[POS=%04l,%04v][%p%%]\ 
            \[LEN=%L]

"# ステータスラインの色
hi StatusLine ctermfg=Black ctermbg=DarkGreen cterm=none
autocmd InsertEnter * :hi StatusLine ctermfg=White ctermbg=Blue
autocmd InsertLeave * :hi StatusLine ctermfg=Black ctermbg=DarkGreen

"# ESCの遅延防止
if has('unix') && !has('gui_running')
    inoremap <silent> <ESC> <ESC>
    inoremap <silent> <C-[> <ESC>
endif

"}}}2

"# ヘルプファイル
helptags $HOME/.vim/doc
"# 日本語のHelpFileを開く
set helplang=ja
nmap <C-h> :<C-u>help<Space>

"{{{2
"# backup,swapfileの設定
"### mkdir $HOME/.vim-backup && chmod 766 $HOME/.vim-backup
let g:backupfile_save_dir="$HOME/.vim-backup"
if filewritable(expand(g:backupfile_save_dir))
    set backup
    set swapfile
    set backupdir=$HOME/.vim-backup
    set backupext=.back
else
    echo '!!! no backup mode !!!'
    echo '### mkdir $HOME/.vim-backup && chmod 766 $HOME/.vim-backup'
    set nobackup
    set noswapfile
endif
"}}}2

"# modeを表示する
set showmode
"# タイトルを表示
set title
"# 常にステータス行を表示
set laststatus=2

"# バッファを開いた時に、カレントディレクトリを自動で移動
au BufEnter * execute ":lcd " . expand("%:p:h")

"# kaoriyadicwin off
let plugin_dicwin_disable=1

"# 行番号を表示しない
set nonumber

"# 括弧入力時に対応する括弧を表示
set showmatch
"# コマンドをステータス行に表示
set showcmd

"# ルーラーを表示
set ruler

"# カーソルラインのハイライト
set cursorline

"# Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

"# バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

"# 2バイト文字でもカーソル位置がずれないようにする
set ambiwidth=double

"# コマンドライン補完するときに強化されたものを使う
set wildmenu

"# コマンドラインの履歴の保存数
set history=16

"# Explore
nnoremap <Plug>(mykey)e :edit ./<CR>
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# Line表示の設定                                           # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"# LineNumberのトグル
nnoremap <silent> <Plug>(mykeylite)n :<C-u>call ToggleNumber()<CR>

function! ToggleNumber()
    if &number == '1'
        echo "disable line number"
    else
        echo "enable line number "
    endif
    setlocal number!
endfunction
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# マウスモードの設定                                       # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"# マウスモードの有効
"set mouse=a
set mouse=

"# terminalmutiprexa内でもマウスモード設定を反映 
set ttymouse=xterm2
"# マウスモードのトグル
nnoremap <silent> <Plug>(mykeylite)m :<C-u>call ToggleMouseMode()<CR>

function! ToggleMouseMode()
    if &mouse == 'a'
        set mouse=
        echo "MouseMode disabled"
    else
        set mouse=a
        echo "MouseMode enabled"
    endif
endfunction
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# vim7以降:tabの設定                                       # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
nnoremap <Leader>t <C-t>

"# create new tab
nnoremap <Plug>(mykey)t :tabf .<CR>

"# move preview/next tab
nnoremap TN gT
nnoremap TP gt
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# 検索設定                                                 # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"# 検索に大文字を含んでいたら大小区別
set ignorecase
set smartcase

"# 検索時にヒット部位をハイライト
set hlsearch

"# 検索ハイライト消去
nnoremap <ESC><ESC> :nohl<CR>
nnoremap <C-l><C-l> :nohl<CR>
nnoremap <C-c><C-c> :nohl<CR>

"# 検索時にインクリメンタルサーチを行う
set incsearch

"# migemoがインストールされていればmigemoを有効にする
if has('migemo')
    set migemo
endif
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# Emacs風味の設定                                          #
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"# カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>

"# Emacs 風カーソル移動のため<Nop>に設定
map! <C-n> <Nop>
map! <C-p> <Nop>
map! <C-b> <Nop>
map! <C-f> <Nop>
"# Emacs 風カーソル移動
map! <C-n> <DOWN>
map! <C-p> <UP>
map! <C-b> <LEFT>
map! <C-f> <RIGHT>

"# killing
inoremap <C-k> <Nop>
inoremap <C-k> <ESC>2<LEFT>D:!start<CR>

"# Emacs風 行頭行末移動
inoremap <C-a> <ESC>^<Insert>
inoremap <C-e> <ESC>$<Insert>
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# インデント関連の設定                                     # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"# インデント
set autoindent
set smartindent
set smarttab
"# if(){}などのインデント
set cindent

"# タブを空白に置き換える
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

"# {}をインデントして入力
inoremap {<CR> {<CR>}<LEFT><CR><UP><TAB>
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# エンコーディングの設定                                   # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"Encoding 
set enc=utf-8 
set fenc=utf-8 
set fencs=utf-8,iso-2022-jp,cp932,euc-jp,sjis
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# 言語別アシスタンス設定                                   # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"辞書ファイルを使用する設定に変更
set complete+=k

"ファイルタイプ別辞書ファイル
autocmd FileType c,cpp,perl set cindent
autocmd FileType ruby :set dictionary=~/.vim/plugin/ruby.vim
autocmd FileType perl :set dictionary+=~/.vim/dict/perl_function.dict
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"CF用コメントハイライト有効
:let html_wrong_comments=1
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# Perlコーディング補助設定                                 # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"# コンパイラをperlに設定
autocmd FileType perl :compiler perl

"perltidy 
autocmd Filetype perl nmap <F2>  <ESC>:%! perltidy<CR>
autocmd Filetype perl vmap <F2>  :! perltidy<CR>

"# :w + !perl command
autocmd FileType perl nnoremap <F4> :w !perl<CR>
"# !perl command
autocmd FileType perl nnoremap <F5> :!perl %<CR>


"# perl モジュールの補完設定
autocmd FileType perl setlocal iskeyword+=a-z,A-Z,48-57,_,:
"}}}1


"#----------------------------------------------------------#
"#                                                          #
"# ファイルタイプバインド設定                               # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml
autocmd BufNewFile,BufRead *.tt,*.cfm set filetype=html
autocmd BufNewFile,BufRead *.t set filetype=perl
autocmd BufNewFile,BufRead *.psgi set filetype=perl
"}}}1


"#----------------------------------------------------------#
"#                                                          #
"# コメントアウト用mapの設定                                # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"lhs comments
map ,# :s/^/#/<CR>
map ,/ :s/^/\/\//<CR>
map ,> :s/^/> /<CR>
map ," :s/^/\"/<CR>
map ,% :s/^/%/<CR>
map ,! :s/^/!/<CR>
map ,; :s/^/;/<CR>
map ,- :s/^/--/<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>

"wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> 
"}}}1


"#----------------------------------------------------------#
"#                                                          #
"# Window関連の設定                                         # 
"#                                                          #
"#----------------------------------------------------------#

"{{{1
"# Window横分割
nnoremap <Plug>(mykeylite)w :<ESC>:new<CR>
"# Window縦分割
nnoremap <Plug>(mykeylite)v :<ESC>:vnew<CR>

"# カレントWindow縦最大化
nnoremap <C-w><C-w> <C-w>_
nnoremap <C-w>w <C-w>_

"# Window大きさ均等化
nnoremap <C-\> <C-w>=

"# 縦最大化しつつWindowを移動
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_

"# Window移動
nnoremap <C-w><C-n> <C-w>j
nnoremap <C-w><C-p> <C-w>k
nnoremap <C-w><C-b> <C-w>h
nnoremap <C-w><C-f> <C-w>l
nnoremap <C-w>n <C-w>j
nnoremap <C-w>p <C-w>k
nnoremap <C-w>b <C-w>h
nnoremap <C-w>f <C-w>l
"}}}1

"#----------------------------------------------------------#
"#                                                          #
"# AutoBufferの設定                                         #
"#                                                          #
"#----------------------------------------------------------#
"
"{{{1
iab YDT <C-R>=strftime("%Y-%m-%d %T")<CR>
iab PSIMPLE <ESC>:r ~/.vim/tmpl/perl_simple.pl<CR>
iab PMODULE <ESC>:r ~/.vim/tmpl/perl_module.pl<CR>
iab PSUB    <ESC>:r ~/.vim/tmpl/perl_sub.pl<CR>
iab PHREF   $hash_name->{namae}
iab PFOREACH    foreach my $element (@nanigasi){
iab PFOR        for ( my $i=1; $i <= 100; $i++ ){
iab PRINT       print $i, "\n";
iab HSIMPLE <ESC>:r ~/.vim/tmpl/xhtml_simple.html<CR>
iab XSIMPLE <ESC>:r ~/.vim/tmpl/xml_simple.xml<CR>
iab LSIMPLE <ESC>:r ~/.vim/tmpl/lisp_simple.lisp<CR>
iab UA_IE Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)
iab UA_FX Mozilla/5.0 (X11; U; Linux i686; ja; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4
iab UA_CH Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19
iab MIME_POST application/x-www-form-urlencoded
iab MIME_JSON application/json
iab authe authentication
iab autho authorization
iab passw password
iab javasc javascript
iab concate concatenate
iab Pdumper use Data::Dumper; warn Dumper 
iab Prparam warn "$_ = ",$self->r->param($_) for ($self->r->param);
"}}}1






"#----------------------------------------------------------#
"#                                                          #
"#  yannktmp.vim                                            #
"#                                                          #
"#----------------------------------------------------------#

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>











"__END__
