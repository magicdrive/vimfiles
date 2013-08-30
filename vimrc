"#          __                            
"#  __  __ /\_\    ___ ___   _ __   ___   
"# /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\ 
"# \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/ 
"#  \ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"#   \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"#                for vim7.4

"[ ####------- NeoBundle Settings --------------#### ] {{{1

filetype off

let g:neobundle_default_git_protocol = 'git'

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/automatic/neobundle.vim/
endif

call neobundle#rc( expand('~/.vim/bundle/automatic') )

"#---------------------------#
"# regular use               #
"#---------------------------#
"# neobundle
NeoBundle 'Shougo/neobundle.vim'
"# neocomplcache
NeoBundleLazy 'Shougo/neocomplcache', {
            \ 'autoload' : { 'insert' : 1, } 
            \ }
"# neosnippet
NeoBundleLazy 'Shougo/neosnippet', {
            \ 'autoload' : { 'insert' : 1, } 
            \ }
"# vim-singleton
if has('clientserver')
    NeoBundle 'thinca/vim-singleton'
endif
"# vimproc
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'mac'     : 'make -f make_mac.mak',
            \     'unix'    : 'make -f make_unix.mak',
            \    },
            \ }
"# vimshell
NeoBundleLazy 'Shougo/vimshell', {
            \   'autoload' : { 'commands' : [ 'VimShell', "VimShellPop", "VimShellInteractive" ] }
            \ }
"# vimfiler
NeoBundleLazy 'Shougo/vimfiler', {
            \   'autoload' : { 
            \       'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerCurrent" ],
            \       'explorer' : 1 ,
            \   }
            \ }
"# NERDTree
NeoBundleLazy 'scrooloose/nerdtree', {
            \   'autoload' : { 'commands' : [ "NERDTree", "NERDTreeToggle", "NERDTreeCWD" ] }
            \ }
"# quickrun
NeoBundle 'thinca/vim-quickrun'
"# vim-watchdogs
NeoBundle 'osyo-manga/vim-watchdogs'
"# vim-hier
NeoBundle 'jceb/vim-hier'
"# shabadou.vim
NeoBundle 'osyo-manga/shabadou.vim'
"# quickfixstatus
NeoBundle 'dannyob/quickfixstatus'
"# vim-dispatch
NeoBundle 'tpope/vim-dispatch'
"# nerdcommneter
NeoBundleLazy 'scrooloose/nerdcommenter', {
            \   'autoload' : { 'commands' : ["NERDCommenterToggle"] }
            \ }
"# vim-endwise
NeoBundleLazy 'taichouchou2/vim-endwise', {
            \ 'autoload' : { 'insert' : 1, } 
            \ }
"# thumbnail.vim
NeoBundleLazy 'itchyny/thumbnail.vim', {
            \   'autoload' : { 'commands' : ['Thumbnail']}
            \ }
"# project.vim
NeoBundleLazy 'project.tar.gz', {
            \   'autoload' : { 'commands' : ['Project']}
            \ }
"# smartinput
NeoBundleLazy 'kana/vim-smartinput', {
            \ 'autoload' : { 'insert' : 1, } 
            \ }
"# neco-look
NeoBundleLazy "ujihisa/neco-look", {
            \ 'autoload' : { 'insert' : 1, } 
            \ }
"# niceblock
NeoBundleLazy 'kana/vim-niceblock', {
            \ 'autoload' : { 'insert' : 1, } 
            \ }
"# altercmd
NeoBundle 'tyru/vim-altercmd'
"# surround.vim
NeoBundle 'surround.vim'
"# vimsualstar
NeoBundle 'thinca/vim-visualstar'
"# easymotion
NeoBundle 'Lokaltog/vim-easymotion'
"# foldCC
NeoBundle 'magicdrive/foldCC'
"# vdbi-vim
NeoBundleLazy 'mattn/vdbi-vim', {
            \ 'autoload' : { 'commands' : ['VDBI','VDBIExec', 'VDBIReset', 'VDBIDatasources'] }
            \ }
"# vim-powerline / ariline
"NeoBundle 'magicdrive/vim-powerline'
NeoBundle 'bling/vim-airline'
"# memolist
NeoBundleLazy 'glidenote/memolist.vim', {
            \ 'autoload' : { 'commands' : ['MemoNew','MemoList', 'MemoGrep'] }
            \ }
"# sudo.vim
NeoBundle 'sudo.vim'
"# vim-rooter
NeoBundle 'airblade/vim-rooter'
"# vim-multiple-cursors
NeoBundle 'terryma/vim-multiple-cursors'
"# vim-ref
NeoBundleLazy 'thinca/vim-ref', {
            \ 'autoload' : {
            \       'filetypes' : ['perl', 'python', 'ruby', 'sh', 'bash', 'zsh', 'vim'],
            \       'commands' : ['Ref'],
            \       'function' : ['ref#open']
            \    },
            \ }
"# gmail
NeoBundleLazy 'yuratomo/gmail.vim', {
            \ 'autoload' : { 'commands' : ['Gmail'] }
            \ }

NeoBundle 'troydm/easybuffer.vim'

set runtimepath+=~/.vim/bundle/manual/vim-golang

"#----------------------------------#
"# unite.vim & unite source plug-in #
"#----------------------------------#
"# unite.vim
NeoBundleLazy 'Shougo/unite.vim', {
            \ 'autoload' : { 'commands' : ['Unite'] }
            \ }
"# unite-rails
NeoBundleLazy 'basyura/unite-rails', {
            \ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] }
            \ }
"# unite-outline
NeoBundle 'h1mesuke/unite-outline'

"#---------------------------#
"# programing suport plug-in #
"#---------------------------#
"# taglist
NeoBundleLazy 'taglist.vim', {
            \  'autoload' : { 'commands' : [ 'Tlist' ]}
            \ }
"# TagHighlight
NeoBundleLazy 'TagHighlight',{
            \ 'autoload' : { 'commands' : ['UpdateTagFile', 'UpdateTagFileDebug', 'UpdateTagFileOnly'] }
            \ }
"# scratch.vim
NeoBundleLazy 'scratch.vim', {
            \ 'autoload' : { 'commands' : ['Scratch'] }
            \ }
"# emacs-commandline
NeoBundle 'houtsnip/vim-emacscommandline'
"# MultipleSearch
NeoBundleLazy 'MultipleSearch', {
            \ 'autoload' : { 'commands' : ['Search', 'SearchBuffers'] }
            \ }
"# align.vim
NeoBundleLazy 'Align', {
            \ 'autoload' : { 'commands' : ['Align', 'AlignCtrl', 'AlignMapsClean', 'AlignPop', 'AlignPush', 'AlignReplaceQuotedSpaces'] }
            \ }

"#-----------------------#
"# llvm                  #
"#-----------------------#
"# cocoa.vim
NeoBundleLazy 'cocoa.vim', {
            \ 'autoload' : {'filetypes': ['objective-c']}
            \ }
"# neocomplcache-clang
NeoBundleLazy 'Shougo/neocomplcache-clang', {
            \ 'autoload' : {'filetypes': ['objective-c','cpp','c']}
            \ }
"# neocomplcache-clang_complete
NeoBundleLazy 'Shougo/neocomplcache-clang_complete', {
            \ 'autoload' : {'filetypes': ['objective-c','cpp','c']}
            \ }

"#-----------------------#
"# haskell               #
"#-----------------------#
"# ghcmod.vim
NeoBundleLazy 'eagletmt/ghcmod-vim', {
            \ "autoload" : {"filetypes": ['haskell']}
            \ }

"#-----------------------#
"# erlang                #
"#-----------------------#
"# vimerl
NeoBundleLazy 'jimenezrick/vimerl', {
            \ "autoload" : {"filetypes": ['erlang']}
            \ }

"#-----------------------#
"# ocaml                 #
"#-----------------------#
"# ocamlspot
NeoBundleLazy 'cohama/the-ocamlspot.vim', {
            \ "autoload" : {"filetypes": ['ocaml']}
            \ }

"#-----------------------#
"# elixir                #
"#-----------------------#
"# vim-elixir
NeoBundle 'elixir-lang/vim-elixir'

"#-----------------------#
"# jvm                   #
"#-----------------------#
"# javacomplete
NeoBundleLazy 'javacomplete', {
            \ "autoload" : {"filetypes": ['java']}
            \ }
"# groovy.vim
NeoBundleLazy 'groovy.vim', {
            \ "autoload" : {"filetypes": ['groovy']}
            \ }
"# maven-plugin
NeoBundleLazy 'mikelue/vim-maven-plugin', {
            \ 'autoload' : {'filetypes': ['java','groovy']}
            \ }
"# vim-scala
NeoBundle 'magicdrive/vim-scala'
"# play2vim
NeoBundle 'gre/play2vim'
"# clojure
NeoBundle 'thinca/vim-ft-clojure'

"#-----------------------#
"# perl                  #
"#-----------------------#
"# perl-mauke
NeoBundleLazy 'perl-mauke.vim',  {
            \ 'autoload' : {'filetypes': ['perl']}
            \ }
"# vim-cpanfile
NeoBundleLazy 'moznion/vim-cpanfile',  {
            \ 'autoload' : {'filetypes': ['perl']}
            \ }
"# vim-perl_use_insertion
autocmd FileType perl 
            \ :setlocal runtimepath+=~/.vim/bundle/manual/vim-perl_use_insertion

"#-----------------------#
"# javascript            #
"#-----------------------#
"# javascript-syntax
NeoBundle 'jelera/vim-javascript-syntax'
"# jscomplete
NeoBundleLazy 'teramako/jscomplete-vim', {
            \ 'autoload' : {'filetypes': ['javascript']}
            \ }
"# vim-nodejs-complete
NeoBundleLazy 'myhere/vim-nodejs-complete', {
            \ 'autoload' : {'filetypes': ['javascript']}
            \ }
"# yui complete
NeoBundleLazy 'Javascript-OmniCompletion-with-YUI-and-j', {
            \ 'autoload' : {'filetypes': ['javascript']}
            \ }
"# vim-coffee-script
NeoBundle 'kchmck/vim-coffee-script'
"# vim-typescript
NeoBundle 'leafgarland/typescript-vim'

"#-----------------------#
"# python                #
"#-----------------------#
"# jedi
NeoBundleLazy 'davidhalter/jedi', {
            \ 'autoload' : {'filetypes': ['python']}
            \ }
"# virtualenv
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
            \ 'autoload' : {'filetypes': ['python']}
            \ }
"# pydiction
NeoBundleLazy 'rkulla/pydiction', {
            \ 'autoload' : {'filetypes': ['python']}
            \ }

"#-----------------------#
"# ruby                  #
"#-----------------------#
"# vim-ruby
NeoBundle 'vim-ruby/vim-ruby', {
            \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml', 'slim'] }
            \ }
"# unite-ruby-require
NeoBundleLazy 'rhysd/unite-ruby-require.vim', {
            \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml', 'slim'] }
            \ }
"# neco-ruby-keyword-args
NeoBundleLazy 'rhysd/neco-ruby-keyword-args', {
            \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml', 'slim'] }
            \ }
"# textobj-ruby
NeoBundleLazy 'rhysd/vim-textobj-ruby', {
            \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml', 'slim'] }
            \ }
"# vim-rspec
NeoBundleLazy 'skwp/vim-rspec', {
            \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml', 'slim'] }
            \ }
"# rspec-syntax
NeoBundle 'Keithbsmiley/rspec.vim'
"# matchit
NeoBundleLazy 'ruby-matchit', {
            \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml', 'slim'] }
            \ }
"# vim-rails
NeoBundle 'tpope/vim-rails'
"# vim-ref-ri
NeoBundle 'taka84u9/vim-ref-ri'

"#-----------------------#
"# html-coding           #
"#-----------------------#
"# vim-less
NeoBundleLazy 'groenewege/vim-less', {
            \ 'autoload' : {'filetypes': ['less']}
            \ }
"# emmet.vim
NeoBundleLazy 'mattn/emmet-vim', {
            \ 'autoload' : {'filetypes': ['eruby','html','tt','haml']}
            \ }
"# instantmarkdown
NeoBundleLazy 'chreekat/vim-instant-markdown', {
            \ 'autoload' : { 'commands' : ['InstantMarkdown'] }
            \ }
"# nginx.vim
NeoBundle 'nginx.vim'
"# httpstatus
NeoBundleLazy 'mattn/httpstatus-vim', {
            \ 'autoload' : { 'commands' : ['HttpStatus'] }
            \ }
"# tmux.vim
NeoBundle 'zaiste/tmux.vim'
"# monit
NeoBundle 'magicdrive/vim-monit'
"# html5.vim
NeoBundle 'taichouchou2/html5.vim'
"# css3vim
NeoBundle 'hail2u/vim-css3-syntax'
"# sass
if executable('sass')
    NeoBundle 'AtsushiM/sass-compile.vim'
endif
"# slim
NeoBundle 'slim-template/vim-slim'

"#-----------------------#
"# git-tool              #
"#-----------------------#
"# gist.vim
NeoBundleLazy 'mattn/gist-vim', {
            \ 'autoload' : { 'commands' : ['Gist'] }
            \ }
"# fugitive
NeoBundleLazy 'tpope/vim-fugitive', {
            \   'autoload' : { 'commands' : [ 'Git', "Gitv"] }
            \ }
"# gitv
NeoBundleLazy 'gregsexton/gitv', {
            \   'autoload' : { 'commands' : [ 'Git', "Gitv"] }
            \ }

"#-----------------------#
"# util-tool             #
"#-----------------------#
"# lcoalrc
NeoBundle 'thinca/vim-localrc'
"# calendar.vim
NeoBundle 'mattn/calendar-vim', {
            \ 'autoload' : {'commands' : ['Calendar', 'CalendarH', 'CalendarT'] }
            \ }
"# yanktmp
NeoBundle 'yanktmp.vim'
"# w3m.vim
if executable('w3m')
    NeoBundle 'yuratomo/w3m.vim'
endif

"#-----------------------#
"# external service      #
"#-----------------------#
"# chalice.vim
NeoBundleLazy 'koron/chalice', {
            \ 'autoload' : {'commands' : 'Chalice' }
            \ }
if has('mac')
    "# open-browser
    NeoBundle 'tyru/open-browser.vim'
    "# vim-itunes
    NeoBundle "ryutorion/vim-itunes"
endif
"# webapi
NeoBundle 'mattn/webapi-vim'
"# twibill
NeoBundle 'basyura/twibill.vim'
"# TweetVim
NeoBundle 'basyura/TweetVim'

"#-------------------#
"# Colorschemes      #
"#-------------------#
"# vim-guicolorscheme
NeoBundleLazy 'thinca/vim-guicolorscheme', {
            \ 'autoload' : { 'command' : ['GuiColorScheme'] }
            \ }
"# CSApprox
NeoBundleLazy 'vim-scripts/CSApprox', {
            \ 'autoload' : { 'command' : ['CSApprox', 'CSApproxSnapshot'] }
            \ }
"# solarized
NeoBundle 'altercation/vim-colors-solarized'
"# jellybeans
NeoBundle 'nanotech/jellybeans.vim'
"# wombat
NeoBundle 'vim-scripts/Wombat'
"# molokai
NeoBundle 'tomasr/molokai'
"# Zenburn
NeoBundle 'Zenburn'
"# twilight
NeoBundle 'vim-scripts/twilight'
"# pyte
NeoBundle 'vim-scripts/pyte'
"# chlordane
NeoBundle 'vim-scripts/chlordane.vim'
"# landscape
NeoBundle 'itchyny/landscape.vim'
"# matrix.vim
NeoBundleLazy 'vim-scripts/matrix.vim--Yang', {
            \ 'autoload' : { 'command' : ['Matrix'] }
            \ }

filetype plugin on
filetype indent on

NeoBundleCheck

"}}}2
"[ ####------- Vim Basic Settings --------------#### ] {{{1

"### Vim Options "{{{2

"# mapkeyprefix
map  <Space> <Plug>(mykey)
map  , <Plug>(mykeylite)

"# vi互換のoff
set nocompatible
"#set regexpengine=1

"# timeout
set to
set tm=500
set ttm=100

"# 上下移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"# 強制終了の無効化
noremap ZZ <Nop>
noremap ZQ <Nop>
command! -nargs=0 Q :q!
command! -nargs=0 QQ :qa!
command! -nargs=0 A :a!

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
inoremap <C-h> <BS>
inoremap <C-d> <DEL>

" insert mode cursor
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>

"# 高速ターミナル接続
set ttyfast

"# yank
nnoremap Y y$

"# filetype
nnoremap <Plug>(mykey)/ :<C-u>set filetype=

"# Plug-in有効設定
filetype indent on
filetype plugin on

"# command-line modeへの切り替え
noremap ; :
noremap ' ;
nnoremap <Plug>(mykey); :<C-u>!
nnoremap <Plug>(mykey)' :<C-u>r!
vnoremap <Plug>(mykey); :!
vnoremap <Plug>(mykeylite)' :r!

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

"# カレントディレクトリ移動
let g:dir_jump=0
command! -nargs=0 Lcd :execute ":lcd " . expand("%:p:h")
if g:dir_jump !=# 0
    autocmd BufEnter * :execute ":lcd " . expand("%:p:h")
endif

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
.
"# 2バイト文字でもカーソル位置がずれないようにする
set ambiwidth=double

"# コマンドライン補完するときに強化されたものを使う
set wildmenu
set wildmode=longest,full

"# コマンドラインの履歴の保存数
set history=256

"# tagjump stack preview
nnoremap <Leader>t <C-t>

"# buffer next/preview
nnoremap <silent> <Up> :bNext<CR>
nnoremap <silent> <Down> :bprevious<CR>

"# "TODO"のgrep
noremap <Plug>(mykeylite). :noautocmd vimgrep /TODO/j 
            \ **/*.pl
            \ **/*.pm
            \ **/*.tt
            \ **/*.rb
            \ **/*.css
            \ **/*.haml
            \ **/*.less
            \ **/*.js
            \ **/*.coffee
            \ **/*.java
            \ **/*.groovy
            \ **/*.scala
            \ **/*.py
            \ **/*.py3
            \ **/*.mako
            \ **/*.tmpl
            \ **/*.h
            \ **/*.cpp
            \ **/*.c
            \ **/*.m
            \ **/*.ml
            \ **/*.sh
            \ **/*.zsh
            \ **/*.bash
            \ **/*.php
            \ **/*.vim
            \ <CR>:cw<CR>

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
"### encoding & fileencoding "{{{2

"Encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,euc-jp,sjis

let s:enc_jp = ["eucjp","euc","euc-jp" ]
let s:shift_jis = ["sjis","shift_jis","shiftjis" ]
let s:utf8 = ["utf8","utf-8" ]

"# encode completion
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

"# encode
function! s:edit_encode(code)
    if match(s:shift_jis, a:code)
        edit ++enc=shift_jis
    elseif match(s:enc_jp, a:code)
        edit ++enc=euc-jp
    elseif match(s:utf8)
        edit ++enc=utf-8
    endif
endfunction

command! -nargs=1
            \ -complete=customlist,s:completion_encode
            \ Encode :call s:edit_encode('<args>')


if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif

let vimrc_set_encoding = 1

" 改行コードの自動認識
set fileformats=unix,mac,dos

"}}}2
"### LineNumber "{{{2

"# LineNumberのトグル
nnoremap <silent> <Plug>(mykeylite)n :<C-u>call ToggleNumber()<CR>

augroup LineNumber
    function! ToggleNumber()
        if &number ==# '1'
            echohl DiffChange | echo "disable line number" | echohl None
        else
            echohl DiffChange | echo "enable line number" | echohl None
        endif
        setlocal number!
    endfunction
augroup END

"}}}2
"### mouse mode "{{{2

if has('mouse')
    "# マウスモードの有効
    set mouse=
    "# terminalmutiprexa内でもマウスモード設定を反映 
    set ttymouse=xterm2
    "# toggle mouse mode
    nnoremap <silent> <Plug>(mykeylite)m :<C-u>call ToggleMouseMode()<CR>
    command! -nargs=0 MouseToggle :call ToggleMouseMode()

    function! ToggleMouseMode()
        if &mouse ==# 'a'
            set mouse=
            echohl DiffChange | echo "MouseMode disabled" | echohl None
        else
            set mouse=a
            echohl DiffChange | echo "MouseMode enabled" | echohl None
        endif
    endfunction
endif

"}}}2
"### backup,swapfile "{{{2

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
"### Tab "{{{2

"# create new tab
nnoremap <Plug>(mykey)t :tabnew<CR>
nnoremap <Plug>(mykey)Tc :tabnew<CR>

"# close current tab
nnoremap <Plug>(mykey)Tk :tabclose<CR>

"# tab next/preview
nnoremap <silent> <C-f> gt
nnoremap <silent> <C-b> gT

"}}}2
"### search "{{{2

"# 検索に大文字を含んでいたら大小区別
set ignorecase
set smartcase

"# 検索時にヒット部位をハイライト
set hlsearch

"# 検索ハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR>

"# 検索時にインクリメンタルサーチを行う
set incsearch

"}}}2
"### Emacs like keybind "{{{2

"# カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>

"# Emacs 風カーソル移動
noremap! <C-n> <DOWN>
noremap! <C-p> <UP>
noremap! <C-b> <LEFT>
noremap! <C-f> <RIGHT>
noremap! <C-g> <ESC>

"# killing
inoremap <expr> <C-k> col('.')==col('$')?"":"\<C-o>D"

"# Emacs風 行頭行末移動
inoremap <C-a> <Home>
inoremap <C-e> <End>

"}}}2
"### Indent "{{{2

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
"### FileType "{{{2

augroup detect_filetype
    autocmd!
    autocmd BufNewFile,BufRead *.as set filetype=actionscript
    autocmd BufNewFile,BufRead *.mxml set filetype=mxml
    autocmd BufNewFile,BufRead *.tt,*.cfm set filetype=html
    autocmd BufNewFile,BufRead *.t,*.psgi set filetype=perl
    autocmd BufNewFile,BufRead cpanfile set filetype=perl.cpanfile
    autocmd BufNewFile,BufRead */nginx/conf/*.conf* set filetype=nginx
    autocmd BufNewFile,BufRead */apache/conf/* set filetype=apache
    autocmd BufNewFile,BufRead */patches/* set filetype=diff
    autocmd BufNewFile,BufRead *tmux*conf* set filetype=tmux
    autocmd BufNewFile,BufRead *.scala set filetype=scala
    autocmd BufNewFile,BufRead *.sbt set filetype=scala
    autocmd BufNewFile,BufRead *.gradle set filetype=groovy
    autocmd BufNewFile,BufRead *.m set filetype=objective-c
    autocmd BufNewFile,BufRead *.gosh set filetype=scheme
    autocmd BufNewFile,BufRead Gemfile set filetype=ruby
    autocmd BufNewFile,BufRead gemspec set filetype=ruby
    autocmd BufNewFile,BufRead *.ru set filetype=ruby
    autocmd BufNewFile,BufRead .vrapperrc set filetype=vim
    autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
augroup END

"}}}2
"### Window "{{{2

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
"### AutoBuffer "{{{2

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
"### Folding {{{2

"# difine foldmethod
set foldmethod=marker
set foldtext=FoldCCtext()

nnoremap <Space><Space> za<Space>

"}}}2
"### for MacVim {{{2

if has('macvim')
    " kaoriyadicwin off
    let plugin_dicwin_disable=1

    if exists('+macmeta')
        " enable meta key
        set macmeta
    endif
endif

"}}}2
"### Util Functinos {{{2

" jump current dir
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory ==# ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang ==# ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Plug>(mykey)cd :<C-u>CD<CR>

" highlight 全角space
function! ZenkakuSpace()
    highlight ZenkakuSpace 
                \ cterm=underline 
                \ ctermfg=darkgrey 
                \ gui=underline 
                \ guifg=darkgrey
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"}}}2
"### colorscheme "{{{2

"# xterm-256color
set t_Co=256

"# Colorscheme
syntax enable

let g:default_color_mode=has('unix') ? 'A' : 'B'

"# GUI
let g:gui_colorscheme_a='chlordane'
let g:gui_background_a='dark'
let g:gui_colorscheme_b='pyte'
let g:gui_background_b='light'

"# CUI
"let g:cui_colorscheme_dark= has('unix') ?  'darkdefault' : 'default'
let g:cui_colorscheme_a='jellybeans'
let g:cui_background_a='light'
let g:cui_colorscheme_b='matrix'
let g:cui_background_b='light'

let g:current_color_mode=g:default_color_mode

" setup color by background
function! SetupColorScheme ()
    if has('gui_running')
        execute 'colorscheme ' . 
                    \ ( (g:default_color_mode ==# 'A') ? 
                    \ g:gui_colorscheme_a : g:cui_colorscheme_a)
        execute 'set background=' . 
                    \ ( (g:default_color_mode ==# 'A') ?
                    \ g:gui_background_a : g:gui_background_b)
    else
        execute 'colorscheme ' . 
                    \ ( (g:default_color_mode ==# 'A') ? 
                    \ g:cui_colorscheme_a : g:cui_colorscheme_b)
        execute 'set background=' . 
                    \ ( (g:default_color_mode ==# 'A') ?
                    \ g:cui_background_a : g:cui_background_b)
    endif
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
endfunction


function! MyColor()
    "# ポップアップメニューの色変更
    highlight Pmenu 
                \ ctermbg=DarkGray
                \ ctermfg=White

    highlight PmenuSel
                \ ctermbg=White
                \ ctermfg=Black 

    "# Foldingの色変更
    highlight Folded
                \ gui=bold
                \ term=standout
                \ ctermbg=Black
                \ ctermfg=LightGray
                \ guibg=Grey30
                \ guifg=Grey80

    highlight FoldColumn
                \ gui=bold
                \ term=standout
                \ ctermbg=Black
                \ ctermfg=LightGray
                \ guibg=Grey
                \ guifg=DarkBlue

    "# 検索結果のカラースキーム変更
    highlight Search ctermbg=Gray
endfunction

augroup color_set
    autocmd!
    "autocmd ColorScheme * call MyColor()
augroup END

"# initialize colorcheme
call SetupColorScheme()

"# switching colrschme & background
nnoremap <silent> <Leader>b :<C-u> call ChangeBackground()<CR>

"}}}2

" }}}1
"[ ####------- Vim Plugins Settings ------------#### ] {{{1

"### Unite.vim {{{2

nnoremap <Plug>(mykey)u :<C-u>Unite<Space>

"# filehistory limit
let g:unite_source_file_mru_limit=10000

"#---------------------------#
"# buffers+unite             #
"#---------------------------#
nnoremap <silent> <Plug>(mykey)b  :<C-u>Unite -no-split buffer<CR>
nnoremap <silent> <Plug>(mykey)h  :<C-u>Unite -no-split -start-insert file_mru<CR>
nnoremap <silent> <Plug>(mykey)f  :<C-u>Unite -no-split -start-insert buffer file_mru<CR>
nnoremap <silent> <Plug>(mykey)i  :<C-u>Unite -no-split -buffer-name=files file<CR>
nnoremap <silent> <Plug>(mykey)d  :<C-u>UniteWithBufferDir -no-split file<CR>

"#---------------------------#
"# neobundle+unite           #
"#---------------------------#
" neobundle-menu
nnoremap <silent> <Plug>(mykey)N  :<C-u>Unite -no-split neobundle/

"#---------------------------#
"# ref+unite                 #
"#---------------------------#
" perldoc
nnoremap <silent> <Plug>(mykeylite)r :<C-u>Unite ref/

"#---------------------------#
"# tweetvim+unite            #
"#---------------------------#
" tweetvim menu
nnoremap <silent> <Plug>(mykeylite)t  :<C-u>Unite tweetvim<CR>

"#---------------------------#
"# unitesource:unite-outline #
"#---------------------------#
nnoremap <silent> <Plug>(mykey)o :<C-u>Unite outline<CR>

"}}}2
"### VimShell {{{2

let g:vimshell_prompt='[' . $USER . '@vimshell] $ '
let g:vimshell_user_prompt='getcwd()'
let g:vimshell_vimshrc_path = expand("$HOME/.vim/misc/vimshellrc")

"# VimShellを新規Windowで立ち上げる
command! Vshell call s:Shell()
function s:alter_vimshell()
    AlterCommand  vsh[ell] Vshell
endfunction
augroup vimshell_setting
    autocmd!
    "# shell buffer clear
    autocmd VimEnter * call s:alter_vimshell()
augroup END

nnoremap <silent> <Plug>(mykey)< :<C-u> call <SID>Shell()<CR>
function! s:Shell()
    echo 'vimshell start'
    VimShell
    setlocal number
endfunction

nnoremap <silent> <Plug>(mykey), :<C-u> call ShellSplit()<CR>
function! ShellSplit()
    vsplit
    call s:Shell()
endfunction

nnoremap <silent> <Plug>(mykey)l :VimShellPop<CR>

" iexe REPL
function! s:start_repl(repl_command)
    let l:command_name=a:repl_command
    if exists('g:project_dirname')
        execute 'cd ' . g:project_dirname
    endif
    execute "VimShellInteractive --split='split | wincmd j | resize 15 | setlocal noequalalways' " . l:command_name
    stopinsert
    wincmd k 
endfunction

"}}}2
"### VimFiler {{{2

nnoremap <Plug>(mykey)e :VimFilerCurrent<CR>

augroup vimfiler_setting
    autocmd!
    autocmd FileType vimfiler nmap <buffer> <Space> <Plug>(mykey)
    autocmd FileType vimfiler nnoremap <buffer> m <Plug>(vimfiler_toggle_mark_current_line)
    autocmd FileType vimfiler nnoremap <buffer> M <Plug>(vimfiler_toggle_mark_current_line_up)
    autocmd FileType vimfiler nnoremap <buffer> ? /^\s*\(\|-\\|\|+\\|+\\|-\) \zs
    autocmd FileType vimfiler call g:my_vimfiler_settings()
augroup END

nnoremap <silent> <Plug>(mykeylite)a :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
function! g:my_vimfiler_settings()
    nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
    nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
    nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
    wincmd p
    exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }                     
function! s:my_action.func(candidates)
    wincmd p
    exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)

let g:loaded_netrwPlugin = 1
let g:vimfiler_as_default_explorer=1
let g:vimfiler_force_overwrite_statusline = 0

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
let g:memolist_vimfiler_option=""

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
"### NeoComplcache {{{2

set infercase

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
"# Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
"# Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
"# Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_skip_auto_completion_time = '0.3'

"# Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default'    : '',
            \ 'c'          : $HOME.'/.vim/dict/c.dict',
            \ 'cpp'        : $HOME.'/.vim/dict/cpp.dict',
            \ 'lua'        : $HOME.'/.vim/dict/lua.dict',
            \ 'php'        : $HOME.'/.vim/dict/php.dict',
            \ 'perl'       : $HOME.'/.vim/dict/perl.dict',
            \ 'scheme'     : $HOME.'/.vim/dict/scheme.dict',
            \ 'java'       : $HOME.'/.vim/dict/java.dict',
            \ 'scala'      : $HOME.'/.vim/dict/scala.dict',
            \ 'ocaml'      : $HOME.'/.vim/dict/ocaml.dict',
            \ 'vim'        : $HOME.'/.vim/dict/vim.dict',
            \ 'vimshell'   : $HOME.'/.vimshell_hist',
            \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
            \ }
" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"# Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif

"}}}2
"### Airline {{{2

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline#extensions#branch#symbol = '⭠ '
let g:airline#extensions#readonly#symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡ '

let g:airline_theme='laederon'

"# ESCの遅延防止
if has('unix') && !has('gui_running')
    inoremap <silent> <ESC> <ESC>
    inoremap <silent> <C-[> <ESC>
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
let g:EasyMotion_keys = 'fjdkslaureiwoqpvncmwqertyuiopzxcvbnm,./1234567890'
"}}}2
"### EasyBuffer {{{2
nnoremap <Plug>(mykey)k :EasyBufferToggle<CR>
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

let g:ref_open="split | resize 15 | set noequalalways"

" ref-manpage
command! -nargs=?  Manpage call ref#open('man', '<args>')

" ref-perldoc
command! -nargs=?  Perldoc call ref#open('perldoc', '<args>')
command! -nargs=?  Perlfunc call OpenPerlfunc('<args>')

" ref-pydoc
command! -nargs=?  Pydoc call ref#open('pydoc', '<args>')

let g:ref_perldoc_auto_append_f=1

function! OpenPerlfunc(func_str)
    execute "Ref perldoc -f " . a:func_str
endfunction

function AlterRef()
    AlterCommand  perld[oc] Ref perldoc
    AlterCommand  perlf[unc] Ref perldoc -f
    AlterCommand  man[page] Manpage
endfunction
augroup ref_group
    autocmd!
    autocmd VimEnter * call AlterRef()
augroup END

"}}}2
"### MultipulSearch.vim {{{2

"# 検索の置き換え
nnoremap ? :Search<Space>
vnoremap ? :Search<Space>

"# 検索ハイライト消去
nnoremap <silent> <C-c><C-c> :<C-u>call SearchHighlightOff()<CR>

function! SearchHighlightOff ()
    if exists(":SearchReset")
        SearchReset
    endif
endfunction

"}}}2
"### TweetVim {{{2

augroup tweetvim_setting
    autocmd!
    autocmd FileType tweetvim
                \ highlight tweetvim_separator
                \ ctermfg=Black
augroup END

nnoremap <silent> <Plug>(mykeylite)ts  :<C-u>TweetVimSay<CR>

let g:tweetvim_tweet_per_page=100
let g:tweetvim_open_buffer_cmd='split'

function AlterTweet()
    AlterCommand  tws TweetVimSay
endfunction

"}}}2
"### iTunes{{{2

if has('mac') 
    nnoremap <Plug>(mykey)0 :ITunes<Space>
    command! -nargs=1 
                \ -complete=customlist,CompletionITunes 
                \ ITunes :call <SID>ITunes('<args>')

    function! s:ITunes(action)
        if a:action ==# 'list' 
            Unite it_track
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
        AlterCommand  iT[unes] ITunes
        AlterCommand  it[unes] ITunes
    endfunction

    augroup itunes_group
        autocmd!
        autocmd VimEnter * call AlterITunes()
    augroup END
endif

"}}}2
"### QuickRun {{{2

nnoremap <silent> <Plug>(mykey)r :<C-u>QuickRun<CR>
vnoremap <silent> <Plug>(mykey)r :QuickRun<CR>

function s:alter_quickrun()
    AlterCommand  qui[ckrun] QuickRun
endfunction
augroup quickrun_group
    autocmd!
    autocmd VimEnter * call s:alter_quickrun()
augroup END

for [key, com] in items({
            \   '<Leader>x' : '>message',
            \   '<Leader>p' : '-runner shell',
            \   '<Leader>w' : '>buffer',
            \   '<Leader>q' : '>>buffer',
            \ })
    execute 'nnoremap <silent>' . key . ':QuickRun' . com . '-mode n<CR>'
    execute 'vnoremap <silent>' . key . ':QuickRun' . com . '-mode v<CR>'

endfor
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = { 
            \       "command" : 'coffee',
            \       'exec'    : ['%c -cbp %s']
            \   }
let g:quickrun_config['typescript'] = { 
            \       "command" : 'tsc',
            \       'exec'    : ['%c --exec %s']
            \   }

"}}}2
"### Watchdogs {{{2

let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enables = {
            \	"perl"       : 1,
            \	"python"     : 1,
            \	"bash"       : 1,
            \	"scala"      : 0,
            \	"ruby"       : 1,
            \   "clang"      : 1,
            \   "jshint"     : 1,
            \   "typescript" : 1,
            \ }

let g:quickrun_config["watchdogs_checker/_"] = {
            \       "hook/close_quickfix/enable_exit" : 1,
            \		"runner/vimproc/updatetime" : 100,
            \       'outputter/quickfix/open_cmd' : '',
            \ }

call watchdogs#setup(g:quickrun_config)

"}}}2
"### Scratch {{{2

nnoremap <Plug>(mykey)s :TempolaryBuffer sh<CR>
command! -nargs=1 TempolaryBuffer call s:scratchbuffer_filetype('<args>')
function! s:scratchbuffer_filetype(filetype)
    split
    Scratch
    execute 'set filetype=' . a:filetype
endfunction
function s:alter_scratch()
    AlterCommand  tem[polarybuffer] TempolaryBuffer
endfunction
augroup scratch_setting
    autocmd!
    autocmd VimEnter * call s:alter_scratch()
augroup END

"}}}2
"### Chalice {{{2

function s:alter_chalice()
    AlterCommand  cha[lice] Chalice
endfunction
augroup chalice_group
    autocmd!
    autocmd VimEnter * call s:alter_chalice()
augroup END

"}}}2
"### sudo.vim {{{2

command! -nargs=? W :call s:sudo_write('<args>')
function s:sudo_write(arg)
    if a:arg ==# ''
        write sudo:%
    else
        execute 'write sudo:' . a:arg
    endif
endfunction

"}}}2
"### Singleton.vim {{{2
if has('clientserver')
    call singleton#enable()
endif
"}}}2
"### Sass {{{2
let g:sass_compile_auto = 1
let g:sass_compile_cdloop = 5
let g:sass_compile_cssdir = ['css', 'stylesheet']
let g:sass_compile_file = ['scss', 'sass']
let g:sass_started_dirs = []

augroup sass_group
    autocmd!
    autocmd FileType less,sass  setlocal sw=2 sts=2 ts=2 et
augroup END
"}}}2
"### NERDTree {{{2
nnoremap <Plug>(mykey)n :<C-u>NERDTreeToggle \| wincmd l<CR>
let g:NERDTreeHijackNetrw=0
"}}}2
"### NERDCommenter {{{2

let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <Leader><Leader> <Plug>NERDCommenterToggle
vmap <Leader><Leader> <Plug>NERDCommenterToggle

"}}}2
"### Emmet {{{2
let g:user_emmet_mode='i'
"}}}2

" }}}1
"[ ####------- Programming Support Settings ----#### ] {{{1

"### Perl support "{{{2

"# perldoc:  module source code open
command! -nargs=1  Perlread :call OpenPerlModuleCode('<args>')
function! OpenPerlModuleCode(module) range
    let l:module_name=a:module
    if a:module ==# '<visual>'
        let l:module_name=s:get_visual_selected()
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
function AlterFileTypePerl()
    AlterCommand  perlre[ad] Perlread
endfunction
augroup perl_ftplugin
    autocmd!
    autocmd FileType perl :compiler perl
    if executable('perltidy')
        autocmd FileType perl nnoremap <buffer> <C-\>  ? <C-u>:%! perltidy<CR>
        autocmd FileType perl vnoremap <buffer> <C-\> :!perltidy<CR>
    endif
    autocmd FileType perl nnoremap <buffer> <F4> :w !perl -c<CR>
    autocmd FileType perl nnoremap <buffer> <F5> :w !perl -c %<CR>
    autocmd FileType perl,ref-perldoc setlocal iskeyword+=a-z,A-Z,48-57,_,:,$,@,%,-
    autocmd FileType perl nnoremap <buffer> K :<C-u>call ref#open('perldoc', expand('<cword>'))<CR>
    autocmd FileType perl vnoremap <buffer> K :<C-u>call ref#jump('visual', 'perldoc')<CR>
    autocmd FileType perl,ref-perldoc nnoremap <buffer> <C-l> :<C-u>call OpenPerlModuleCode( expand('<cword>') )<CR>
    autocmd FileType perl,ref-perldoc vnoremap <buffer> <C-l> :<C-u>call OpenPerlModuleCode( '<visual>' )<CR>
    autocmd VimEnter * call AlterFileTypePerl()
augroup END

"}}}2
"### Python support {{{2

function AlterFileTypePython()
    AlterCommand  pydoc Ref pydoc
endfunction

augroup python_ftplugin
    autocmd!
    autocmd FileType python call s:PythonIndent()
    autocmd FileType python let b:did_ftplugin = 1
    autocmd FileType python let g:jedi#auto_initialization = 1
    autocmd FileType python let g:jedi#rename_command = "<Leader>R"
    autocmd FileType python let g:jedi#popup_on_dot = 1
    autocmd FileType python setlocal nocindent
    autocmd FileType python setlocal iskeyword+=.,(
    autocmd FileType python nnoremap <buffer> K :<C-u>call ref#open('pydoc', expand('<cword>'))<CR>
    autocmd FileType python vnoremap <buffer> K :<C-u>call ref#jump('visual', 'pydoc')<CR>
    autocmd VimEnter * call AlterFileTypePython()
augroup END

let g:pydiction_location=
            \ '~/.vim/bundle/automatic/pydiction/complete-dict'
function s:PythonIndent()
    "" PEP 8 Indent rule
    setlocal tabstop=8
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal smarttab
    setlocal expandtab
    setlocal autoindent
    setlocal nosmartindent
    setlocal cindent
    setlocal textwidth=80
    setlocal colorcolumn=80
    " Folding
    setlocal foldmethod=indent
    setlocal foldlevel=99"
endfunction

"}}}2
"### Ruby support "{{{2

command! -nargs=1  RubyGemRead :call <SID>open_rubygem_code('<args>')
function! s:open_rubygem_code(module) range
    let l:module_name=a:module
    if a:module ==# '<visual>'
        let l:module_name=s:get_visual_selected()
    endif

    try
        execute 'edit ' . system('bundle exec gem which ' . l:module_name )
    catch 
        try
            execute 'edit ' . system('gem which ' . l:module_name )
        catch
            echohl Error | echo 'No gemfile found.' | echohl None
        endtry
    endtry

endfunction
function AlterFileTypeRuby()
    AlterCommand  ri Ref ri
endfunction

augroup ruby_ftplugin
    autocmd!
    autocmd FileType ruby setlocal nocindent
    autocmd FileType ruby :compiler ruby
    autocmd FileType ruby nnoremap <buffer> <F4> :w :!ruby -c<CR>
    autocmd FileType ruby nnoremap <buffer> <F5> :!ruby -c %<CR>
    autocmd FileType ruby,ref-ri setlocal iskeyword+=a-z,A-Z,48-57,_,:,$,@,%,?,-
    autocmd FileType ruby nnoremap <buffer> K :<C-u>call ref#open('ri', expand('<cword>'))<CR>
    autocmd FileType ruby vnoremap <buffer> K :<C-u>call ref#jump('visual', 'ri')<CR>
    autocmd FileType ruby,ref-ri nnoremap <buffer> <C-l> :<C-u>call <SID>open_rubygem_code( expand('<cword>') )<CR>
    autocmd FileType ruby,ref-ri vnoremap <buffer> <C-l> :<C-u>call <SID>open_rubygem_code( '<visual>' )<CR>
    autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd FileType ruby setlocal autoindent
    autocmd VimEnter * call AlterFileTypeRuby()
augroup END

command! -nargs=0 Irb call <SID>start_repl('irb')
command! -nargs=0 IrbWithBundler call <SID>start_repl('bundle exec irb')
command! -nargs=0 Pry call <SID>start_repl('pry --no-color')
command! -nargs=0 PryWithBundler call <SID>start_repl('bundle exec pry --no-color')
command! -nargs=0 RailsConsole   call <SID>start_repl('bundle exec rails console')

"}}}2
"### Scala support{{{2

if exists("current_compiler")
  finish
endif
let g:current_compiler = "sbt"


"# sbt
function! s:start_sbt()
    if exists('g:sbt_project_dirname')
        execute 'cd ' . g:sbt_project_dirname
    endif
    execute "VimShellInteractive --split='split | wincmd j | resize 20 | setlocal noequalalways' sbt"
    stopinsert
    let t:sbt_bufname = bufname('%')
    if !has_key(t:, 'sbt_cmds')
        let t:sbt_cmds = [input('t:sbt_cmds[0] = ')]
    endif
    wincmd k 
endfunction

command! -nargs=0 SBT call <SID>start_sbt()

function! s:sbt_compile()
    let cmds = get(t:, 'sbt_cmds', 'run')

    let sbt_bufname = get(t:, 'sbt_bufname')
    if sbt_bufname !=# ''
        call vimshell#interactive#set_send_buffer(sbt_bufname)
        call vimshell#interactive#send(cmds)
    else
        echoerr 'try SBT'
    endif
endfunction

function! s:sbt_run(command)
    let sbt_bufname = get(t:, 'sbt_bufname')
    if sbt_bufname !=# ''
        call vimshell#interactive#set_send_buffer(sbt_bufname)
        call vimshell#interactive#send(a:command)
    else
        echoerr 'try SBT'
    endif
endfunction

function! s:sbt_controll()
    nnoremap <buffer> <Plug>(mykey)m :<C-u>write<Cr>:call <SID>sbt_compile()<Cr>
    nnoremap <buffer> <Plug>(mykey)r :<C-u>write<Cr>:call <SID>sbt_run()<Cr>
endfunction

function! s:set_compiler_sbt()
    setlocal errorformat=%E[error]\ %f:%l:\ %m,%C[error]\ %p^,%-C%.%#,%Z,
                   \%W[warn]\ %f:%l:\ %m,%C[warn]\ %p^,%-C%.%#,%Z,
                   \%-G%.%#
    setlocal makeprg=sbt-no-color\ compile
    setlocal errorfile=target/error
endfunction

augroup scala_setting
    autocmd!
    autocmd FileType scala setlocal nocindent
    autocmd FileType scala call <SID>set_compiler_sbt()
    autocmd FileType scala call <SID>sbt_controll()
    autocmd FileType scala nnoremap <buffer> <Plug>(mykey)r :<C-u>SBT<CR>
    autocmd FileType scala nnoremap <buffer> <Leader>s :<C-u>SBT<CR>
augroup END

"}}}2
"### Java support{{{2

"# highlight
let g:java_highlight_all=1
let g:java_highlight_functions="style"

augroup java_ftplugin
    autocmd!
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
"### JavaScript support {{{2

if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif

let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1

augroup javascript_plugin
    autocmd!
    autocmd FileType javascript setlocal omnifunc+=nodejscomplete#CompleteJS
augroup END

command! -nargs=0 NodeREPL   call <SID>start_repl('node --interactive')

"}}}2
"### TypeScript support {{{2

augroup typescript_ftplugin
    autocmd!
    autocmd BufWritePost typescript :make
augroup END

"}}}2
"### Erlang support {{{2

command! -nargs=0 Erl call <SID>start_repl('erl')

"}}}2
"### FileType(Language) assistance "{{{2

"辞書ファイルを使用する設定に変更
set complete+=k

"ファイルタイプ別辞書ファイル
augroup filetype_dict
    autocmd!
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
    autocmd FileType scheme let is_gauche=1
augroup END

"CF用コメントハイライト有効
let html_wrong_comments=1

"}}}2
"### Template FileSetting{{{2

augroup template_setting
    autocmd!
    autocmd BufNewFile *.pl     0r $HOME/.vim/misc/tmpl/perl.template.pl
    autocmd BufNewFile *.pm     0r $HOME/.vim/misc/tmpl/perl_module.template.pm
    autocmd BufNewFile *.html   0r $HOME/.vim/misc/tmpl/html5.template.html
    autocmd BufNewFile *.psgi   0r $HOME/.vim/misc/tmpl/app.psgi
    autocmd BufNewFile *.py     0r $HOME/.vim/misc/tmpl/python.template.py
    autocmd BufNewFile *.rb     0r $HOME/.vim/misc/tmpl/template.rb
    autocmd BufNewFile Gemfile  0r $HOME/.vim/misc/tmpl/Gemfile
    autocmd BufNewFile Rakefile 0r $HOME/.vim/misc/tmpl/Rakefile
    autocmd BufNewFile gemspec  0r $HOME/.vim/misc/tmpl/gemspec
augroup END

" }}}2

" }}}1
"[ ####------- Read Local Settings -------------#### ] {{{1
let g:local_vimrc = '$HOME/.vimrc.local'
if filereadable(expand(g:local_vimrc))
    execute 'source ' . g:local_vimrc
endif
" }}}1
"# __END__
