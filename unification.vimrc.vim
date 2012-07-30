"==========================
" VIMRC for Vim7.3
"==========================

"[ ####----------- Vim Basic Settings ------------#### ] {{{1


"### Vim基本設定 "{{{2


"# mapkeyprefix
map <Space> <Plug>(mykey)
map , <Plug>(mykeylite)

"# vi互換のoff
set nocompatible

"# 強制終了の無効化
noremap ZZ <Nop>
noremap ZQ <Nop>

"# シンタックスハイライト
syntax on


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


"# ヘルプファイル
helptags $HOME/.vim/doc
"# 日本語のHelpFileを開く
set helplang=ja
nmap <C-h> :<C-u>help<Space>


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


"}}}2
"### VimL "{{{2

command! -nargs=0 SA :call VimLRun()
command! -nargs=0 SU :call VimrcReload()
command! -nargs=0 VimrcEdit edit $MYVIMRC
command! -nargs=0 VE VimrcEdit 

if has('vim_starting')

    function! VimLRun()
        source %
        edit!
    endfunction

    function! VimrcReload()
        source $MYVIMRC
        edit!
        echo 'reloaded!'
    endfunction
    
endif

"# vimrcの編集
nmap <Plug>(mykey)v :VimrcEdit<CR>

"}}}i1
"### NeoBundle.vimプラグイン管理{{{2


filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle'))
endif

"#------------------------------------#
"#                                    #
"#     NeoBundleで管理するPlug-in     #
"#                                    #
"#------------------------------------#

"#---------------------------#
"# Vim utility extended      #
"#---------------------------#

"# neobundle 本体
NeoBundle 'Shougo/neobundle.vim'

"# Unite.vim
NeoBundle 'Shougo/unite.vim'

"# Unite.vim
NeoBundle 'Shougo/unite-ssh'

"# vimfiler
NeoBundle 'Shougo/vimfiler'

"# vimproc
NeoBundle 'Shougo/vimproc'

"# vimshell
NeoBundle 'Shougo/vimshell'

"#---------------------------#
"# programing suport plug-in #
"#---------------------------#

"# neocomplcache
NeoBundle 'Shougo/neocomplcache'

"# cocoa.vim
NeoBundle 'cocoa.vim'

"# javacomplete.vim
NeoBundle 'javacomplete'

"# javascript
NeoBundle 'Javascript-OmniCompletion-with-YUI-and-j'

"# zencoding
NeoBundle 'mattn/zencoding-vim'

"# scratch.vim
NeoBundle 'scratch.vim'

"# snipmate
NeoBundle 'msanders/snipmate.vim'

"# open-browser.vim
NeoBundle 'tyru/open-browser.vim'

"# twibill.vim
NeoBundle 'basyura/twibill.vim'

"# tweetvim
NeoBundle 'basyura/TweetVim'

"# nerdcommenter
NeoBundle 'scrooloose/nerdcommenter.git'

"# errormarker.vim
NeoBundle 'errormarker.vim'

"# vimpager
NeoBundle 'vimpager'

"# Align
NeoBundle 'Align'

"# surround.vim
NeoBundle 'surround.vim'

"# visualstar.vim
NeoBundle 'thinca/vim-visualstar'

"# vim-easymotion
NeoBundle 'Lokaltog/vim-easymotion'

"# vim-abolish
NeoBundle 'tpope/vim-abolish'

"# foldCC
NeoBundle 'LeafCage/foldCC'

"#-----------------------#
"# vim-tools             #
"#-----------------------#

"# vinarise
NeoBundle 'Shougo/vinarise'

"# vdbi-vim
NeoBundle 'mattn/vdbi-vim'

"# vim-ref
NeoBundle 'thinca/vim-ref'

"# MultipleSearch
NeoBundle 'MultipleSearch'

"# quickrun
NeoBundle 'thinca/vim-quickrun'

"# memolist.vim
NeoBundle 'glidenote/memolist.vim'

"# sudo.vim
NeoBundle 'sudo.vim'

"# webapi-vim
NeoBundle 'mattn/webapi-vim'

"# git.vim
NeoBundle 'motemen/git-vim'

"# gist.vim
NeoBundle 'mattn/gist-vim'

"# localrc.vim
NeoBundle 'thinca/vim-localrc'

"# calender.vim
NeoBundle 'mattn/calendar-vim'

"# w3m.vim
NeoBundle 'yuratomo/w3m.vim'

"# Chalice.vim
NeoBundle 'koron/chalice'

"# yamktmp.vim
NeoBundle 'yanktmp.vim'

"#-------------------#
"# 256color plug-in  #
"#-------------------#

"# vim-powerline (256color statusline only xterm-256color)
NeoBundle 'Lokaltog/vim-powerline.git'

"# vim-guicolorscheme(enable 256colorscheme)
NeoBundle 'thinca/vim-guicolorscheme'

"# colorscheme/solarized
NeoBundle 'altercation/vim-colors-solarized'

filetype plugin on
filetype indent on


"}}}2
"### エンコーディングの設定 "{{{2


"Encoding 
set enc=utf-8 
set fenc=utf-8 
set fencs=utf-8,iso-2022-jp,cp932,euc-jp,sjis

if isdirectory($HOME . '/.vim')
    let s:CFGHOME=$HOME.'/.vim'
elseif isdirectory($HOME . '/vimfiles')
    let s:CFGHOME=$HOME.'/vimfiles'
elseif isdirectory($VIM . '/vimfiles')
    let s:CFGHOME=$VIM.'/vimfiles'
endif
      
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif

if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    if has('mac')
      let &fileencodings = s:enc_jis .','. s:enc_euc
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    else
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    endif
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif


"utf-8優先にする
if &encoding == 'utf-8'
  if filereadable(s:CFGHOME . '/utf-8')
    let &fileencodings = substitute(&fileencodings, 'utf-8', '_utf-8', 'g')
    let &fileencodings = substitute(&fileencodings, 'cp932', 'utf-8', 'g')
    let &fileencodings = substitute(&fileencodings, '_utf-8', 'cp932', 'g')
  endif
endif

unlet s:CFGHOME
let vimrc_set_encoding = 1

" 改行コードの自動認識
"set fileformats=dos,unix,mac

if exists("loaded_ReCheckFENC")
  finish
endif
let loaded_ReCheckFENC = 1

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
      if has('win16') || has('win32') || has('win64') || has('win32unix') || has('win95')
        let &fileencoding='cp932'
      endif
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

"}}}2
"### LineNumber表示の設定 "{{{2

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

"}}}2
"### mouse modeの設定 "{{{2

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

"}}}2
"### backup,swapfileの設定 "{{{2

"# mkdir $HOME/.vim-backup && chmod 766 $HOME/.vim-backup
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
"### Tab機能の設定 "{{{2

nnoremap <Leader>t <C-t>

"# create new tab
nnoremap <Plug>(mykeylite)t :tabf .<CR>

"# move preview/next tab
nnoremap TN gT
nnoremap TP gt

"}}}2
"### 検索設定 "{{{2

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

"}}}2
"### Emacs風keybindの設定 "{{{2

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

"}}}2
"### インデント関連の設定 "{{{2

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

"}}}2
"### 言語別アシスタンス設定 "{{{2
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
"}}}2
"### Perlコーディング補助設定 "{{{2


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


"}}}2
"### ファイルタイプ判定 "{{{2
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml
autocmd BufNewFile,BufRead *.tt,*.cfm set filetype=html
autocmd BufNewFile,BufRead *.t set filetype=perl
autocmd BufNewFile,BufRead *.psgi set filetype=perl
"}}}2
"### コメントアウト用mapの設定 "{{{2
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
"}}}2
"### Window関連の設定 "{{{2


"# Window横分割
nnoremap <Plug>(mykeylite)w :<ESC>:split<CR>
"# Window縦分割
nnoremap <Plug>(mykeylite)v :<ESC>:vsplit<CR>

"# カレントWindow縦最大化
nnoremap <C-w><C-w> <C-w>_
nnoremap <C-w>w <C-w>_

"# Window横最大化
nnoremap <C-\> <C-w>|

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


"}}}2
"### AutoBufferの設定 "{{{2


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


"}}}2
"### colorschemeの設定 "{{{2


"# xterm-256color
set t_Co=256

"# カラースキーマ
syntax enable

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

function! MyColor()
    "# ポップアップのカラースキーム変更
    highlight Pmenu ctermfg=Black
    highlight PmenuSel ctermbg=DarkMagenta
    highlight PmenuSel ctermfg=White

    highlight Folded gui=bold term=standout ctermbg=DarkYellow ctermfg=LightGray guibg=Grey30 guifg=Grey80
    highlight FoldColumn gui=bold term=standout ctermbg=DarkYellow ctermfg=LightGray guibg=Grey guifg=DarkBlue

    "# 検索結果のカラースキーム変更
    highlight Search ctermbg=DarkGray
endfunction

call MyColor()


"}}}2
"### foldingの設定 {{{2


"# difine foldmethod
set foldmethod=marker
set foldtext=FoldCCtext()

nmap <Plug>(mykey)o zo
nmap <Plug>(mykey)c zc
nmap <Space><Space> za 


"}}}2
"### StatusLine (vim_powerlineがoffの場合に表示) "{{{2


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


" }}}1
"[ ####----------- Vim Plugin Settings -----------#### ] {{{1


"### Unite.vim {{{2


"# File and Buffer
" 分割しないでuniteのbufferを表示する
nnoremap <Plug>(mykey)u  :<C-u>Unite -no-split<Plug>my(mykey)

" バッファ一覧
nnoremap <silent> <Plug>(mykey)b  :<C-u>Unite -no-split buffer<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Plug>(mykey)m  :<C-u>Unite -no-split file_mru<CR>
" バッファーと最近使用したファイルの一覧 
nnoremap <silent> <Plug>(mykey)u  :<C-u>Unite -no-split buffer file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> <Plug>(mykey)d  :<C-u>UniteWithBufferDir -no-split file<CR>
" ファイル一覧
nnoremap <silent> <Plug>(mykey)f  :<C-u>Unite -no-split -buffer-name=files file<CR>

"# neobundle+unite
nnoremap <silent> <Plug>(mykey)N  :<C-u>Unite -no-split neobundle<CR>
nnoremap <silent> <Plug>(mykey)nn  :<C-u>Unite -no-split neobundle<CR>
nnoremap <silent> <Plug>(mykey)ns  :<C-u>Unite -no-split neobundle/search<CR>

"# ref+unite
nnoremap <silent> <Plug>(mykey)Rp :<C-u> Unite ref/perldoc<CR>
nnoremap <silent> <Plug>(mykey)Rm :<C-u> Unite ref/man<CR>

"# tweetvim+unite
nnoremap <silent> <Plug>(mykey)t :<C-u> Unite tweetvim<CR>


"}}}2
"### vimshell {{{2


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


"}}}2
"### vimfiler {{{2


nnoremap <Plug>(mykey)f :VimFilerCurrent<CR>

"# vimfilerをデフォルトのexplorerと置き換えるか
let g:vimfiler_as_default_explorer=1


"}}}2
"### memolist.vim {{{2


let g:memolist_memo_suffix="txt"
let g:memolist_memo_date="%Y-%m-%d %H:%M"
"let g:memolist_memo_date = "epoch"
"let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags=1
let g:memolist_prompt_categories=1
let g:memolist_qfixgrep=1
let g:memolist_vimfiler=1
"let g:memolist_template_dir_path='$HOME/.vim/memo/'
let g:memolist_path = "$HOME/.vim/memo/"

"# key mapping
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>


"}}}2
"### yannktmp.vim "{{{2


map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>


"}}}2
"### Align.vim {{{2


let g:Align_xstrlen=3
let g:DrChipTopLvlMenu=''


"}}}2
"### neocomplcache {{{2


"# Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"# Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
"# Use smartcase.
let g:neocomplcache_enable_smart_case = 1
"# Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
"# Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
"# Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


"# Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

"# Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif

"# NeoCompleCacheToggle
"nmap <Plug>(mykeylite)t :NeoComplCacheToggle<CR>


"}}}2
"### errormarker.vim {{{2


let g:errormarker_errortext='!!'
let g:errormarker_errorgroup='Error'
let g:errormarker_warningtext='??'
let g:errormarker_warninggroup='Warning'


"}}}2
"### Ref.vim {{{2


let g:ref_open="vsplit"

" ref-manpage
command! -nargs=?  Manpage call ref#open('man', '<args>')

" ref-perldoc
command! -nargs=?  Perldoc call ref#open('perldoc', '<args>')


"}}}2
"### Vim-Powerline {{{2


let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'compatible'
"let g:Powerline_symbols = 'unicode'


"}}}2
"### EasyMotion {{{2


noremap <C-f> <Nop>
let g:EasyMotion_leader_key = "<C-f>"


"}}}2
"### W3m.vim {{{2


command! -nargs=1 Alc :call w3m#Open(g:w3m#OPEN_NORMAL, 'alc', '<args>')
command! -nargs=1 AlcSplit :call w3m#Open(g:w3m#OPEN_SPLIT, 'alc', '<args>')
    


"}}}2


" }}}1
"[ ####-------------- GVim Settings --------------#### ] {{{1


"### gvimの設定 {{{2


autocmd GUIEnter * call MyGUISetting()


if has("gui_running") && has('vim_starting')


    "# インサートモード以外でIMEをオフ
    set iminsert


    function MyGUISetting ()
        "カラースキーマの設定
        colorscheme solarized
        set background=dark
        call MyColor()

        if has('multi_byte_ime')
            highlight Cursor guifg=NONE guibg=Green
            highlight CursorIM guifg=NONE guibg=Purple
        endif

        "# 列番号表示をDefault
        set number

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

        set fuoptions=maxvert,maxhorz

        let g:save_window_file = expand('$HOME/.vimwinpos')

        if filereadable(expand('$HOME/.vimwinpos'))
            source $HOME/.vimwinpos
        endif

        augroup SaveWindow
            autocmd!
            autocmd VimLeavePre * call s:save_window()
            autocmd BufLeave * call s:save_window()
            function! s:save_window()
                let options = [
                            \ 'set columns=' . &columns,
                            \ 'set lines=' . &lines,
                            \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
                            \ ]
                call writefile(options, g:save_window_file)
            endfunction
        augroup END
    endfunction

endif


if has('gui_running')
    "# GUISettingのLoad
    call MyGUISetting()
endif

"}}}2


" }}}1

"__END__