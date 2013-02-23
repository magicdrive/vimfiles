"==========================
" VIMRC for Vim7.3
"==========================

"[ ####------- Vim Basic Settings --------------#### ] {{{1


"### Vim Option "{{{2


"# mapkeyprefix
map  <Space> <Plug>(mykey)
map  , <Plug>(mykeylite)

"# vi互換のoff
set nocompatible

"# 強制終了の無効化
noremap ZZ <Nop>
noremap ZQ <Nop>

command! -nargs=0 ZZ :x
command! -nargs=0 ZQ :q

"# syntax highlight
syntax on

"# beep and visualbell off
set visualbell t_vb=

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
noremap  <C-?> <C-h>
noremap! <C-?> <C-h>

"# 高速ターミナル接続
set ttyfast

"# yank
nnoremap Y y$

"# Plug-in有効設定
filetype plugin indent on
filetype plugin on

"# command-line modeへの切り替え
noremap ; :
noremap " : 

noremap <Plug>(mykey); :!
noremap <Plug>(mykey)r :r!

"# substitution
vnoremap <Plug>(mykeylite)s :s///<LEFT><LEFT>
nnoremap <Plug>(mykeylite)s :<C-u>%s///<LEFT><LEFT>

"# <ESC>のマッピング
noremap  <silent> <C-@> <ESC>
noremap! <silent> <C-@> <ESC>
cnoremap <silent> <C-@> <C-c>
noremap  <silent> <Nul> <ESC>
noremap! <silent> <Nul> <ESC>
cnoremap <silent> <Nul> <C-c>

"# recording off
nnoremap q <Nop>

"# ヘルプファイル
helptags $HOME/.vim/doc

"# 日本語のHelpFileを開く
set helplang=ja

"# helpを素早く引く
nnoremap <C-h> :<C-u>help<Space>

"# modeを表示する
set showmode

"# タイトルを表示
set title

"# 常にステータス行を表示
set laststatus=2

"# バッファを開いた時に、カレントディレクトリを自動で移動
au BufEnter * execute ":lcd " . expand("%:p:h")

"# line number
set number

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
set wildmode=longest,full

"# コマンドラインの履歴の保存数
set history=256


"# Explore
"nnoremap <Plug>(mykey)e :Explore ./<CR>

"# tagjump stack preview
nnoremap <Leader>t <C-t>

"# buffer next/preview
nnoremap <silent> <C-b> <C-b>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>


"}}}2
"### VimScript "{{{2


command! -nargs=0 SL :source %
command! -nargs=0 SU :source $MYVIMRC
 
command! -nargs=0 VimrcEdit :edit $HOME/.vimrc
command! -nargs=0 VE :VimrcEdit 
command! -nargs=0 E :edit!

"# extract visual selected string
function! s:get_visual_selected()
    let tmp = @@
    silent normal gvy
    let selected = @@
    let @@ = tmp
    return selected
endfunction

"# vimrcの編集
nnoremap <Plug>(mykey). :VimrcEdit<CR>


"}}}i1
"### encoding & fileencodingの設定 "{{{2


"Encoding 
set enc=utf-8 
set fenc=utf-8 
set fencs=utf-8,euc-jp,sjis

let s:enc_jp = ["eucjp","euc","euc-jp" ]
let s:shift_jis = ["sjis","shift_jis","shiftjis" ]
let s:utf8 = ["utf8","utf-8" ]
function! s:completion_encode(ArgLead, CmdLine, CusorPos)
    let l:cmd = split(a:CmdLine)
    let l:len_cmd = len(l:cmd)
    if l:len_cmd <= 2
        let l:filter_cmd = printf('v:val =~ "^%s"', a:ArgLead)
        return filter(
                    \ ["utf8", "sjis", "eucjp"], 
                    \ l:filter_cmd
                    \ )
    endif
endfunction
function! s:edit_encode(code)
    if match(g:enc_jp, a:code)
        edit ++enc=euc-jp
    elseif match(g:shift_jis, a:code)
        edit ++enc=shift_jis
    elseif match(g:utf8)
        edit ++enc=utf-8
    endif
endfunction

command! -nargs=1  
            \ -complete=customlist,s:completion_encode 
            \ Encode :call s:edit_encode('<args>')

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

augroup LineNumber
    function! ToggleNumber()
        if &number ==# '1'
            echo "disable line number"
        else
            echo "enable line number "
        endif
        setlocal number!
    endfunction
augroup END


"}}}2
"### mouse modeの設定 "{{{2


augroup MouseSetting
    if has('mouse')
        "# マウスモードの有効
        "set mouse=a
        set mouse=

        "# terminalmutiprexa内でもマウスモード設定を反映 
        set ttymouse=xterm2
        "# toggle mouse mode
        nnoremap <silent> <Plug>(mykeylite)m :<C-u>call ToggleMouseMode()<CR>

        function! ToggleMouseMode()
            if &mouse ==# 'a'
                set mouse=
                echo "MouseMode disabled"
            else
                set mouse=a
                echo "MouseMode enabled"
            endif
        endfunction
    endif
augroup END


"}}}2
"### backup,swapfileの設定 "{{{2


"# mkdir $HOME/.vim-backup && chmod 766 $HOME/.vim-backup
let g:backupfile_save_dir="$HOME/.vim-backup"
if filewritable(expand(g:backupfile_save_dir))
    set backup
    set swapfile
    execute 'set backupdir=' . g:backupfile_save_dir
    set backupext=.back
else
    echohl Error | echo '!!! no backup mode !!!' | echohl None
    echo '### mkdir $HOME/.vim-backup && chmod 766 $HOME/.vim-backup'
    set nobackup
    set noswapfile
endif


"}}}2
"### Tab機能の設定 "{{{2


"# create new tab
nnoremap <Plug>(mykey)t :tabnew<CR>
nnoremap <Plug>(mykey)Tc :tabnew<CR>

"# close current tab
nnoremap <Plug>(mykey)Tk :tabclose<CR>

"# tab next/preview
nnoremap <silent> <C-f> gt
nnoremap <silent> <C-b> gT


"}}}2
"### search設定 "{{{2


"# 検索に大文字を含んでいたら大小区別
set ignorecase
set smartcase

"# 検索時にヒット部位をハイライト
set hlsearch

"# 検索ハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <Nul><Nul> :nohlsearch<CR>
nnoremap <C-c><C-c> :nohlsearch<CR>

"# 検索時にインクリメンタルサーチを行う
set incsearch

"# migemoがインストールされていればmigemoを有効にする
if has('migemo')
    set migemo
endif


"}}}2
"### Emacs like keybindの設定 "{{{2


"# カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>

"# Emacs 風カーソル移動
noremap! <C-n> <DOWN>
noremap! <C-p> <UP>
noremap! <C-b> <LEFT>
noremap! <C-f> <RIGHT>

"# killing
inoremap <expr> <C-k> col('.')==col('$')?"":"\<C-o>D"

"# Emacs風 行頭行末移動
inoremap <C-a> <Home>
inoremap <C-e> <End>


"}}}2
"### Indentの設定 "{{{2


"# current buffer indent
nnoremap <C-\> gg=G
vnoremap <C-\> =

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
"### FileType判定 "{{{2


autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml
autocmd BufNewFile,BufRead *.tt,*.cfm set filetype=html
autocmd BufNewFile,BufRead *.t set filetype=perl
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead */nginx/conf/* set filetype=nginx


"}}}2
"### comment用mapの設定 "{{{2


"lhs comments
noremap <Plug>(mykeylite)# :s/^/#/<CR>
noremap <Plug>(mykeylite)/ :s/^/\/\//<CR>
noremap <Plug>(mykeylite)> :s/^/> /<CR>
noremap <Plug>(mykeylite)" :s/^/\"/<CR>
noremap <Plug>(mykeylite)% :s/^/%/<CR>
noremap <Plug>(mykeylite)! :s/^/!/<CR>
noremap <Plug>(mykeylite); :s/^/;/<CR>
noremap <Plug>(mykeylite)- :s/^/--/<CR>
"noremap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>

"wrapping comments
noremap <Plug>(mykeylite)* :s/^\(.*\)$/\/\* \1 \*\//<CR>
noremap <Plug>(mykeylite)( :s/^\(.*\)$/\(\* \1 \*\)/<CR>
noremap <Plug>(mykeylite)< :s/^\(.*\)$/<!-- \1 -->/<CR>
"noremap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> 


"}}}2
"### Window関連の設定 "{{{2


"# Window横分割
nnoremap <silent> <Plug>(mykey)w :<ESC>:split<CR>
"# Window縦分割
nnoremap <silent> <Plug>(mykey)v :<ESC>:vsplit<CR>

"# カレントWindow縦最大化
nnoremap <C-w><C-w> <C-w>_
nnoremap <C-w>w <C-w>_

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



"# tmpl perl
iab PSIMPLE <ESC>:r ~/.vim/misc/tmpl/perl_simple.pl<CR>
iab PMODULE <ESC>:r ~/.vim/misc/tmpl/perl_module.pl<CR>
iab PSUB    <ESC>:r ~/.vim/misc/tmpl/perl_sub.pl<CR>
iab PHREF   $hash_name->{namae}
iab PFOREACH    foreach my $element (@nanigasi){
iab PFOR        for ( my $i=1; $i <= 100; $i++ ){
iab PRINT       print $i, "\n";
iab Pdumper use Data::Dumper; warn Dumper 
iab Prparam warn "$_ = ",$self->r->param($_) for ($self->r->param);

"# tmpl other
iab HSIMPLE <ESC>:r ~/.vim/misc/tmpl/xhtml_simple.html<CR>
iab XSIMPLE <ESC>:r ~/.vim/misc/tmpl/xml_simple.xml<CR>
iab LSIMPLE <ESC>:r ~/.vim/misc/tmpl/lisp_simple.lisp<CR>
iab YDT <C-R>=strftime("%Y-%m-%d %T")<CR>

"# user agent (web browser)
iab UA_IE Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)
iab UA_FX Mozilla/5.0 (X11; U; Linux i686; ja; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4
iab UA_CH Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19

"# user agent (ios devise)
iab UA_IPHONE Mozilla/5.0 (iPhone; U; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Mobile/9A334 Safari/7534.48.3
iab UA_IPHONE2 Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Mobile/9A405 Safari/7534.48.3
iab UA_IPOD Mozilla/5.0 (iPod; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A405 Safari/7534.48.3
iab UA_IPAD Mozilla/5.0 (iPad; CPU OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A405 Safari/7534.48.3

iab MIME_POST application/x-www-form-urlencoded
iab MIME_JSON application/json
iab MIME_JS text/javascript
iab authe authentication
iab autho authorization
iab passw password
iab javasc javascript
iab concate concatenate


"}}}2
"### Foldingの設定 {{{2


"# difine foldmethod
set foldmethod=marker
set foldtext=FoldCCtext()

"nnoremap <Plug>(mykey)zo zo
"nnoremap <Plug>(mykey)zc zc
nnoremap <Space><Space> za<Space>


"}}}2
"### Macvim用の設定 {{{2


if has('macvim')

    " kaoriyadicwin off
    let plugin_dicwin_disable=1

    if exists('+macmeta')
        " enable meta key
        set macmeta
    endif

endif


"}}}2


" }}}1
"[ ####------- Vim Plugins Settings ------------#### ] {{{1


"### NeoBundle.vim{{{2


filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/automatic/neobundle.vim/
endif
call neobundle#rc( expand('~/.vim/bundle/automatic') )

"#------------------------------------#
"#                                    #
"#     neobundleで管理するPlug-in     #
"#                                    #
"#------------------------------------#

"#---------------------------#
"# Vim utility extended      #
"#---------------------------#

"# neobundle
NeoBundle 'Shougo/neobundle.vim'

"# vimfiler
NeoBundle 'Shougo/vimfiler'

"# vimproc
NeoBundle 'Shougo/vimproc'

"# vimshell
NeoBundle 'Shougo/vimshell'

"#----------------------------------#
"# unite.vim & unite source plug-in #
"#----------------------------------#

"# Unite.vim
NeoBundle 'Shougo/unite.vim'

"# unite-ssh
NeoBundle 'Shougo/unite-ssh'

"# unite-ack
NeoBundle 't9md/vim-unite-ack'

"# unite-help
NeoBundle 'tsukkee/unite-help'

"# unite-qflist
NeoBundle 'sgur/unite-qf'

"# unite-outline
NeoBundle 'h1mesuke/unite-outline'

"#---------------------------#
"# programing suport plug-in #
"#---------------------------#

"# watchdogs
NeoBundle 'magicdrive/vim-watchdogs'

"# vim-hier
NeoBundle "jceb/vim-hier"

"# neco-look
NeoBundle "ujihisa/neco-look"

"# neocomplcache
NeoBundle 'Shougo/neocomplcache'

"# neosnippet
NeoBundle 'Shougo/neosnippet'

"# smartinput
NeoBundle 'kana/vim-smartinput'

"# vim-niceblock
NeoBundle 'kana/vim-niceblock'

"# cocoa.vim
NeoBundle 'cocoa.vim'

"# neocomplcache-clang
NeoBundle 'Shougo/neocomplcache-clang'

"# neocomplcache-clang_complete
NeoBundle 'Shougo/neocomplcache-clang_complete'

"# javacomplete.vim
NeoBundle 'javacomplete'

"# javascript
NeoBundle 'Javascript-OmniCompletion-with-YUI-and-j'

"# javacomplete.vim
NeoBundle 'groovy.vim'

"# vim-maven-plugin
NeoBundle 'mikelue/vim-maven-plugin'

"# scala-vim
NeoBundle 'derekwyatt/vim-scala'

"# vim-perl-use-insertaion
NeoBundle 'vim-perl-use-insertion',
            \ {
                \ 'type' : 'nosync', 
                \ 'base' : $HOME . '/.vim/bundle/manual/vim-perl_use_insertion',
            \ }

"# jelera/vim-javascript-syntax
NeoBundle 'jelera/vim-javascript-syntax'



NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'myhere/vim-nodejs-complete'


"# nginx.vim
NeoBundle 'nginx.vim'

"# zencoding
NeoBundle 'mattn/zencoding-vim'

"# scratch.vim
NeoBundle 'scratch.vim'

"# TagHighlight
NeoBundle 'TagHighlight'

"# taglist
NeoBundle 'taglist.vim'

"# nerdcommenter
NeoBundle 'scrooloose/nerdcommenter'

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
NeoBundle 'magicdrive/foldCC'

"#-----------------------#
"# vim-tools             #
"#-----------------------#

"# vinarise
NeoBundle 'Shougo/vinarise'

"# vdbi-vim
NeoBundle 'mattn/vdbi-vim'

"# emacscommandline
NeoBundle 'houtsnip/vim-emacscommandline'

"# vim-ref
"NeoBundle 'thinca/vim-ref'
NeoBundle 'magicdrive/vim-ref'

"# altercmd
NeoBundle 'tyru/vim-altercmd'

"# MultipleSearch
NeoBundle 'MultipleSearch'

"# quickrun
NeoBundle 'thinca/vim-quickrun'

"# shabadou.vim
NeoBundle 'osyo-manga/shabadou.vim'

"# memolist.vim
NeoBundle 'glidenote/memolist.vim'

"# sudo.vim
NeoBundle 'sudo.vim'

"# webapi-vim
NeoBundle 'mattn/webapi-vim'

"# git.vim
"#NeoBundle 'motemen/git-vim'

"# gist.vim
NeoBundle 'mattn/gist-vim'

"# vim-fugitive
NeoBundle 'tpope/vim-fugitive'

"# gitv
NeoBundle 'gregsexton/gitv'

"# localrc.vim
NeoBundle 'thinca/vim-localrc'

"# calender.vim
NeoBundle 'mattn/calendar-vim'

"# w3m.vim
if executable('w3m')
    NeoBundle 'yuratomo/w3m.vim'
endif

"# Chalice.vim
NeoBundle 'koron/chalice'

"# yamktmp.vim
NeoBundle 'yanktmp.vim'

"# open-browser.vim
NeoBundle 'tyru/open-browser.vim'

"# twibill.vim
NeoBundle 'basyura/twibill.vim'

"# tweetvim
NeoBundle 'basyura/TweetVim'

"# itunes-vim
NeoBundle 'ryutorion/vim-itunes'

"#-------------------#
"# 256color plug-in  #
"#-------------------#

"# vim-powerline (256color statusline only xterm-256color)
NeoBundle 'Lokaltog/vim-powerline.git'

"# vim-guicolorscheme(enable 256colorscheme)
NeoBundle 'thinca/vim-guicolorscheme'

"# colorscheme-solarized
NeoBundle 'altercation/vim-colors-solarized'

"# colorscheme-sand
NeoBundle 'sand'

"# colorscheme-zenburn
NeoBundle 'Zenburn'

filetype plugin on
filetype indent on


"}}}2
"### Unite.vim {{{2

nnoremap <Plug>(mykey)u :<C-u>Unite<Space>

"# filehistory limit
let g:unite_source_file_mru_limit=10000


"#---------------------------#
"# buffers+unite             #
"#---------------------------#

" buffer
nnoremap <silent> <Plug>(mykey)b  :<C-u>Unite -no-split -start-insert buffer<CR>
" filehistory
nnoremap <silent> <Plug>(mykey)h  :<C-u>Unite -no-split -start-insert file_mru<CR>
" filehistory and buffer
nnoremap <silent> <Plug>(mykey)f  :<C-u>Unite -no-split -start-insert buffer file_mru<CR>
" Directry
nnoremap <silent> <Plug>(mykey)d  :<C-u>UniteWithBufferDir -no-split file<CR>
" files
nnoremap <silent> <Plug>(mykey)i  :<C-u>Unite -no-split -buffer-name=files file<CR>

"#---------------------------#
"# neobundle+unite           #
"#---------------------------#

" neobundle-menu
nnoremap <silent> <Plug>(mykey)N  :<C-u>Unite -no-split neobundle<CR>
nnoremap <silent> <Plug>(mykey)nn :<C-u>Unite -no-split neobundle<CR>
" neobundle search
nnoremap <silent> <Plug>(mykey)ns :<C-u>Unite neobundle/search<CR>
" neobundle update
nnoremap <silent> <Plug>(mykey)nu :<C-u>Unite -vertical neobundle/update<CR>
" neobundle install
nnoremap <silent> <Plug>(mykey)ni :<C-u>Unite -vertical neobundle/install:<CR>

"#---------------------------#
"# ref+unite                 #
"#---------------------------#

" perldoc
nnoremap <silent> <Plug>(mykey)Rp :<C-u>Unite ref/perldoc<CR>
" manpage
nnoremap <silent> <Plug>(mykey)Rm :<C-u>Unite ref/man<CR>

"#---------------------------#
"# tweetvim+unite            #
"#---------------------------#

" tweetvim menu
nnoremap <silent> <Plug>(mykeylite)tw  :<C-u>Unite tweetvim<CR>

"#---------------------------#
"# unitesource:unite-help    #
"#---------------------------#

" Execute help.
nnoremap <silent> g<C-h>  :<C-u>Unite -start-insert help<CR>

"#---------------------------#
"# unitesource:unite-grep    #
"#---------------------------#

" Execute grep.
nnoremap <silent> <Plug>(mykey)g  :<C-u>Unite -vertical grep<CR>

"#---------------------------#
"# unitesource:it_track      #
"#---------------------------#

"# itunes track
if has('mac')
    nnoremap <silent> <Plug>(mykeylite)ti  :<C-u>Unite -vertical it_track<CR>
endif

"}}}2
"### vimshell {{{2

let g:vimshell_prompt='[' . $USER . '@vimshell] $ '
let g:vimshell_user_prompt='getcwd()'
let g:vimshell_vimshrc_path = expand("$HOME/.vim/misc/vimshellrc")

"# shell buffer clear
autocmd FileType vimshell nnoremap <silent><buffer> <C-l> <Insert>clear<CR>

"# VimShellを新規Windowで立ち上げる
command! Shell call Shell()


nnoremap <silent> <Plug>(mykey)S :<C-u> call Shell()<CR>
function! Shell()
    echo 'vimshell start'
    VimShell
    "  setlocal number
endfunction

nnoremap <silent> <Plug>(mykey)s :<C-u> call ShellSplit()<CR>
function! ShellSplit()
    vsplit
    call Shell()
endfunction


"}}}2
"### vimfiler {{{2


nnoremap <Plug>(mykey)e :VimFilerCurrent<CR>

"autocmd FileType vimfiler nunmap <buffer> <Space>
autocmd FileType vimfiler nnoremap <buffer> m <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler nnoremap <buffer> M <Plug>(vimfiler_toggle_mark_current_line_up)

"# vimfilerをデフォルトのexplorerと置き換えるか
let g:vimfiler_as_default_explorer=1


"}}}2
"### MemoList.vim {{{2


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
"nnoremap <Plug>(mykeylite)t :NeoComplCacheToggle<CR>


"}}}2
"### Vim-Powerline {{{2


let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'compatible'
"let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols_override = {
    \ 'BRANCH': [0x2213],
    \ 'LINE': 'L',
    \ }
"#let g:Powerline_dividers_override = ['>>=>>', '> >', '<<=<<', '< <']

"####"# ESCの遅延防止
"####if has('unix') && !has('gui_running')
"####    inoremap <silent> <ESC> <ESC>
"####    inoremap <silent> <C-[> <ESC>
"####endif

if exists(':PowerlineClearCache') && exists(':PowerlineReloadColorscheme') 
   PowerlineClearCache | PowerlineReloadColorscheme
endif


"}}}2
"### Solarized {{{2


let g:solarized_termcolors=256
let g:solarized_bold=0
let g:solarized_underline=1
let g:solarized_italic=0


"}}}2
"### EasyMotion {{{2


let g:EasyMotion_leader_key = "q"

"let g:EasyMotion_keys = 'fjdkslaureiwoqpvncmwqertyuiop'


"}}}2
"### W3m.vim {{{2

if !has('gui_running') && executable('w3m')

    "# alc
    let g:w3m_alc='alc'
    command! -nargs=1 Alc :call w3m#Open(g:w3m#OPEN_NORMAL, g:w3m_alc, '<args>')
    command! -nargs=1 AlcSplit :call w3m#Open(g:w3m#OPEN_SPLIT, g:w3m_alc, '<args>')


    "# dict
    let g:w3m_dict='yahoodict'
    command! -nargs=1 Dict :call w3m#Open(g:w3m#OPEN_NORMAL, g:w3m_dict, '<args>')
    command! -nargs=1 DictSprit :call w3m#Open(g:w3m#OPEN_SPLIT, g:w3m_dict, '<args>')

    "# dict
    let g:w3m_wiki='wikipedia'
    command! -nargs=1 Wikipedia :call w3m#Open(g:w3m#OPEN_NORMAL, g:w3m_wiki, '<args>')
    command! -nargs=1 WikipediaSprit :call w3m#Open(g:w3m#OPEN_SPLIT, g:w3m_wiki, '<args>')

    function AlterW3m()
        AlterCommand dict Dict
        AlterCommand alc Alc
        AlterCommand wikip[edia] Wikipedia
    endfunction

    autocmd VimEnter * call AlterW3m()

endif

"}}}2
"### Ref.vim {{{2


let g:ref_open="vsplit"

" ref-manpage
command! -nargs=?  Manpage call ref#open('man', '<args>')

" ref-perldoc
command! -nargs=?  Perldoc call ref#open('perldoc', '<args>')
command! -nargs=?  Perlfunc call OpenPerlfunc('<args>')

let g:ref_perldoc_auto_append_f=1

function! OpenPerlfunc(func_str)
    execute "Ref perldoc -f " . a:func_str
endfunction

function AlterRef()
    AlterCommand  perldoc Perldoc
    AlterCommand  perlf[unc] Perlfunc
    AlterCommand  man[page] Manpage
endfunction

autocmd VimEnter * call AlterRef()


"}}}2
"### MultipulSearch.vim {{{2


"# 検索の置き換え
nnoremap ? :Search<Space>
vnoremap ? :Search<Space>


"# 検索ハイライト消去
nnoremap <silent> mm :<C-u>call SearchHighlightOff()<CR> 

function! SearchHighlightOff ()
    if exists(":SearchReset")
        SearchReset
    endif
endfunction

"}}}2
"### TweetVim {{{2


autocmd FileType tweetvim
            \ highlight tweetvim_separator
            \ ctermfg=Black

nnoremap <silent> <Plug>(mykeylite)ts  :<C-u>TweetVimSay<CR>

let g:tweetvim_tweet_per_page=100
let g:tweetvim_open_buffer_cmd='split'

function AlterTweet()
    AlterCommand  tws TweetVimSay
endfunction


"}}}2
"### iTunes{{{2


augroup iTunes 
    if has('mac') 
        nnoremap <Plug>(mykey)0 :ITunes<Space>
        command! -nargs=1 
                    \ -complete=customlist,CompletionITunes 
                    \ ITunes :call ITunes('<args>')

        function ITunes(action)
            if a:action ==# 'list' 
                Unite -vertical it_track
            else 
                execute 'call itunes#' . a:action . '()'
            endif
        endfunction

        function! CompletionITunes(ArgLead, CmdLine, CusorPos)
            let l:cmd = split(a:CmdLine)
            let l:len_cmd = len(l:cmd)
            if l:len_cmd <= 2
                let l:filter_cmd = printf('v:val =~ "^%s"', a:ArgLead)
                return filter(
                            \ ['play', 'stop', 'next', 'prev', 'repeat', 'loop', 'list'], 
                            \ l:filter_cmd
                            \ )
            endif
        endfunction

        function AlterITunes()
            AlterCommand  iTunes ITunes 
            AlterCommand  itunes ITunes 
        endfunction

        autocmd VimEnter * call AlterITunes()
    endif
augroup END 


"}}}2
"### QuickRun {{{2


nnoremap <silent> <Plug>(mykeylite)r <Plug>(quickrun)
vnoremap <silent> <Plug>(mykeylite)r <Plug>(quickrun)

for [key, com] in items({
            \   '<Leader>x' : '>message',
            \   '<Leader>p' : '-runner shell',
            \   '<Leader>w' : '>buffer',
            \   '<Leader>q' : '>>buffer',
            \ })
    execute 'vnoremap <silent>' . key . ':QuickRun' com '-mode v<CR>'
    execute 'vnoremap <silent>' . key . ':QuickRun' . com . '-mode v<CR>'
endfor


"}}}2
"### Watchdogs {{{2


let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enables = {
    \	"perl"   : 1,
    \	"scala"  : 1,
    \	"ruby"   : 1,
    \   "clang"  : 1,
    \   "jshint" : 1,
    \ }

let g:quickrun_config = {
            \   "watchdogs_checker/_" : {
            \       "hook/close_quickfix/enable_exit" : 1,
            \		"runner/vimproc/updatetime" : 30,
            \   }, 
            \ }
call watchdogs#setup(g:quickrun_config)


"}}}2


" }}}1
"[ ####------- Programming Support Settings ----#### ] {{{1


"### Perl programming support "{{{2


augroup PerlFTPlugin
    "# コンパイラをperlに設定
    autocmd FileType perl :compiler perl

    "perltidy 
    autocmd FileType perl nnoremap <buffer> <C-\> <ESC>:%! perltidy<CR>
    autocmd FileType perl vnoremap <buffer> <C-\> :! perltidy<CR>

    "# :w + !perl command
    autocmd FileType perl nnoremap <buffer> <F4> :w !perl<CR>
    "# !perl 
    autocmd FileType perl nnoremap <buffer> <Plug>(mykeylite), :w !perl -c<CR>

    "# perl moduleの補完設定
    autocmd FileType perl,ref-perldoc setlocal iskeyword+=a-z,A-Z,48-57,_,:,$,@,%

    "# perldoc:  module source code open
    command! -nargs=1  Perlread :call OpenPerlModuleCode('<args>')
    function! OpenPerlModuleCode(module) range
        let l:module_name=''

        if  a:module ==# '<visual>'
            let l:module_name=s:get_visual_selected()
        else
            let l:module_name=a:module ==# '<cword>' 
                        \ ? expand('<cword>') 
                        \ : a:module
        endif

        let l:module_path = 
                    \ system('perl -MClass::Inspector -e ' 
                    \ . '"print Class::Inspector->resolved_filename(q{' . l:module_name . '})"') 

        if l:module_path !=# ''
            execute 'edit ' . l:module_path
        else
            echohl Error | echo 'No modulefile found.' | echohl None
        endif

    endfunction

    "# perldoc
    if exists('*ref#open') 
        "# required vim-ref !!!!
        autocmd FileType perl 
                    \ nnoremap <buffer> K :<C-u>call ref#open('perldoc', '<cword>')<CR>
        autocmd FileType perl 
                    \ vnoremap <buffer> K :<C-u>call ref#open('perldoc', '')<CR>
    endif

    "# read module source 
    autocmd FileType perl,ref-perldoc
                \ nnoremap <buffer> <C-l> :<C-u>call OpenPerlModuleCode( '<cword>' )<CR>
    autocmd FileType perl,ref-perldoc
                \ vnoremap <buffer> <C-l> :<C-u>call OpenPerlModuleCode( '<visual>' )<CR>


    function AlterFileTypePerl()
        AlterCommand  perlre[ad] Perlread
    endfunction

    autocmd VimEnter * call AlterFileTypePerl()



    "# watchdogs
	let g:watchdogs_check_CursorHold_enables = {
	\	"cpp"     : 1,
	\	"perl" : 1
	\}
	" runner/vimproc/updatetime に設定する
	let g:quickrun_config = {
	\	"watchdogs_checker/_" : {
	\		"runner/vimproc/updatetime" : 2,
	\	},
	\}
	
	" watchdogs.vim の設定を追加
	call watchdogs#setup(g:quickrun_config)
augroup END


"}}}2
"### Ruby programming support "{{{2


augroup RubyFTPlugin
    "# コンパイラをrubyに設定
    autocmd FileType ruby :compiler ruby

    "# :w + !ruby command
    autocmd FileType ruby nnoremap <buffer> <F4> :w :!ruby<CR>
    "# !ruby command
    autocmd FileType ruby nnoremap <buffer> <F5> :!ruby %<CR>

    function AlterFileTypeRuby()
        AlterCommand  rubydoc RubyDoc
    endfunction

    autocmd VimEnter * call AlterFileTypeRuby()
augroup END


"}}}2
"### Java Programming support{{{2


augroup JavaFTPlugin

    "# highlight
    let java_highlight_all=1
    let java_highlight_functions="style"

    "# complete add
    autocmd FileType java setlocal complete+=.,w,b,u,t,i
    "# load ant.sh
    autocmd FileType java setlocal makeprg=$HOME/.vim/misc/bin/vim_ant.sh
    "# errorformat
  "  autocmd BufRead *.java 
  "              \ setlocal errorformat=
  "                  \ \ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m, \%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

augroup END


"}}}2
"### JavaScript programming support {{{2


augroup JavaScriptFTPlugin
    
    autocmd FileType javascript nnoremap <C-\> <Esc>:%! $HOME/.vim/misc/bin/js_swell.pl<CR>
    autocmd FileType javascript vnoremap <C-\> <Esc>:! $HOME/.vim/misc/bin/js_swell.pl<CR>
    autocmd FileType javascript setlocal omnifunc+=nodejscomplete#CompleteJS
    if !exists('g:neocomplcache_omni_functions')
        let g:neocomplcache_omni_functions = {}
    endif
    let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
    let g:node_usejscomplete = 1

augroup END


"}}}2
"### FileType(Language)別アシスタンス設定 "{{{2




"辞書ファイルを使用する設定に変更
set complete+=k

"ファイルタイプ別辞書ファイル
autocmd FileType c,cpp,perl setlocal cindent
autocmd FileType ruby :setlocal dictionary=~/.vim/plugin/ruby.vim
autocmd FileType perl :setlocal dictionary+=~/.vim/dict/perl_function.dict
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"CF用コメントハイライト有効
let html_wrong_comments=1


"}}}2
"### Template FileSetting{{{2

autocmd BufNewFile *.pl :r $HOME/.vim/misc/tmp/perl.template.pl | 1 | delete
autocmd BufNewFile *.pm :r $HOME/.vim/misc/tmp/perl_module.template.pm | 1 | delete
autocmd BufNewFile *.html :r $HOME/.vim/misc/tmp/html5.template.html | 1 | delete
autocmd BufNewFile *.psgi :r $HOME/.vim/misc/tmp/app.psgi | 1 | delete

" }}}2


" }}}1
"[ ####------- GVim Visualize Settings ---------#### ] {{{1


"### colorschemeの設定 "{{{2


"# xterm-256color
set t_Co=256

"# Colorscheme
syntax enable

let g:default_color_mode=has('unix') ? 'A' : 'B'

"# GUI
let g:gui_colorscheme_a='distinguished'
let g:gui_background_a='light'
let g:gui_colorscheme_b='zenburn'
let g:gui_background_b='light'

"# CUI
"let g:cui_colorscheme_dark= has('unix') ?  'darkdefault' : 'default'
let g:cui_colorscheme_a='distinguished'
let g:cui_background_a='light'
let g:cui_colorscheme_b='jellybeans'
let g:cui_background_b='light'

let g:current_color_mode=g:default_color_mode

" setup color by background
function! SetupColorScheme ()

    if g:default_color_mode ==# 'A'
        execute 'colorscheme ' . 
                    \ (has('gui_running') ?
                    \ g:gui_colorscheme_a : g:cui_colorscheme_a)
    else
        execute 'colorscheme ' . 
                    \ (has('gui_running') ?
                    \ g:gui_colorscheme_b : g:cui_colorscheme_b)
    endif

    if has('gui_running')
        execute 'set background=' . 
                    \ ( (g:default_color_mode ==# 'A') ?
                    \ g:gui_background_a : g:gui_background_b)
    else
        execute 'set background=' . 
                    \ ( (g:default_color_mode ==# 'A') ?
                    \ g:cui_background_a : g:cui_background_b)
    endif

    call MyColor()
endfunction


"# change colorscheme & background
function! ChangeBackground()

    if g:current_color_mode ==# 'A'
        execute 'colorscheme ' .
                    \ (has('gui_running') ?
                    \ g:gui_colorscheme_b : g:cui_colorscheme_b)
        let g:current_color_mode='B'
        echo 'change backgrount=light'
    else
        execute 'colorscheme ' .
                    \ (has('gui_running') ?
                    \ g:gui_colorscheme_a : g:cui_colorscheme_a)
        let g:current_color_mode='A'
        echo 'change backgrount=dark'
    endif

    if has('gui_running')
        execute 'set background=' . 
                    \ ( g:current_color_mode ==# 'A' ?
                    \ g:gui_background_a : g:gui_background_b)
    else
        execute 'set background=' . 
                    \ ( (g:current_color_mode ==# 'A') ?
                    \ g:cui_background_a : g:cui_background_b)
    endif

    syntax on
    call MyColor()
endfunction


function! MyColor()

    "# ポップアップメニューの色変更
    highlight Pmenu 
                \ ctermbg=DarkGray
                \ ctermfg=White

    highlight PmenuSel
                \ ctermbg=White
                \ ctermfg=Black 

"    "# Foldingの色変更
"    highlight Folded
"                \ gui=bold
"                \ term=standout
"                \ ctermbg=DarkYellow
"                \ ctermfg=LightGray
"                \ guibg=Grey30
"                \ guifg=Grey80
"
"    highlight FoldColumn
"                \ gui=bold
"                \ term=standout
"                \ ctermbg=DarkYellow
"                \ ctermfg=LightGray
"                \ guibg=Grey
"                \ guifg=DarkBlue

    "# 検索結果のカラースキーム変更
    highlight Search ctermbg=DarkGray
endfunction

"# initialize colorcheme
call SetupColorScheme()

"# switching colrschme & background
nnoremap <silent> <Leader>b :<C-u> call ChangeBackground()<CR>


"}}}2
"### gui_MacVim用の設定 {{{2


function MyGUIMacVimSetting()

    set transparency=10
    set imdisable 
    set antialias
    set guifont=Ricty:h18
    set nobackup

endfunction


"}}}2
"### gvimの設定 {{{2


"# windowの大きさ監視
function WindowSupervise()

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
function MyGUISetting ()

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

    "# fullscreen option
    set fuoptions=maxvert,maxhorz

endfunction

function MyGUISettingLazy()

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

"}}}2


" }}}1
"[ ####------- Read Local Settings -------------#### ] {{{1
let g:local_vimrc = '$HOME/.vimrc.local'
if filereadable(expand(g:local_vimrc))
      execute 'source ' . g:local_vimrc
endif
" }}}1

"__END__

