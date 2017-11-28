"#          __
"#  __  __ /\_\    ___ ___   _ __   ___
"# /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"# \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
"#  \ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"#   \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"#                for vim7.4
"[ ####------- Vim Basic Settings --------------#### ] {{{
"### Vim Options "{{{

"# mapkeyprefix
map  <Space> <Plug>(mykey)
map  , <Plug>(mykeylite)

"# vi互換のoff
set nocompatible

if v:version > 704 || v:version == 704 && has('patch785')
    set nofixeol
endif

"# timeout
set to
set tm=500
set ttm=100

set updatetime=300

"# 上下移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k

"# 強制終了の無効化
noremap ZZ <Nop>
noremap ZQ <Nop>

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

set display=lastline

"# filetype
nnoremap <Plug>(mykey)/ :<C-u>set filetype=

"# Plug-in有効設定
filetype indent on
filetype plugin on

nnoremap <Plug>(mykey); :<C-u>!
nnoremap <Plug>(mykey): :<C-u>r!
vnoremap <Plug>(mykey); :!
vnoremap <Plug>(mykeylite): :r!

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

"# cursorline
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

"# Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

"# バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
.
"# 全角文字でもカーソル位置がずれないようにする
set ambiwidth=double

"# コマンドライン補完するときに強化されたものを使う
set wildmenu
set wildmode=longest,full

"# コマンドラインの履歴の保存数
set history=256

"# tagjump stack preview
nnoremap <Leader>t <C-t>

"# buffer next/preview
nnoremap <silent> <Up> :bnext<CR>
nnoremap <silent> <Down> :bprevious<CR>

command! SudoWrite :w !sudo tee > /dev/null %

"}}}
"### VimScript "{{{

command! -nargs=0 SL :source %
command! -nargs=0 SU :source ~/.vimrc | call <SID>source_gvimrc()

command! -nargs=0 VimrcEdit :edit ~/.vimrc
command! -nargs=0 VE :VimrcEdit
command! -nargs=0 E :edit!

function! s:source_gvimrc()
    if has('gui_running')
        :source ~/.gvimrc
    endif
endfunction

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

"}}}
"### encoding & fileencoding "{{{

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
"}}}
"### LineNumber "{{{

"# LineNumberのトグル
nnoremap <silent> <Plug>(mykeylite)n :<C-u>call <SID>ToggleNumber()<CR>
command! -nargs=0 NumberToggle :call <SID>ToggleNumber()

function! s:ToggleNumber()
    if &number ==# '1'
        echohl Error | echo "disable line number" | echohl None
    else
        echohl DiffChange | echo "enable line number" | echohl None
    endif
    setlocal number!
endfunction

"}}}
"### mouse mode "{{{

if has('mouse')
    "# マウスモードの有効
    set mouse=
    "# terminalmutiprexa内でもマウスモード設定を反映
    set ttymouse=xterm2
    "# toggle mouse mode
    nnoremap <silent> <Plug>(mykeylite)m :<C-u>call <SID>ToggleMouseMode()<CR>
    command! -nargs=0 MouseToggle :call <SID>ToggleMouseMode()

    function! s:ToggleMouseMode()
        if &mouse ==# 'a'
            set mouse=
            echohl Error | echo "MouseMode disabled" | echohl None
        else
            set mouse=a
            echohl DiffChange | echo "MouseMode enabled" | echohl None
        endif
    endfunction
endif

"}}}
"### ListChar "{{{

"# Listcharのトグル
nnoremap <silent> <Plug>(mykeylite)c :<C-u>call <SID>ToggleListChar()<CR>
command! -nargs=0 ListCharToggle :call <SID>ToggleListChar()

function! s:ToggleListChar()
    if &list ==# '1'
        echohl Error | echo "disable list char" | echohl None
    else
        echohl DiffChange | echo "enable list char" | echohl None
    endif
    setlocal list!
endfunction

"}}}
"### backup,swapfile "{{{

"# mkdir $HOME/.vim-backup && chmod 766 $HOME/.vim-backup
let g:backupfile_save_dir="$HOME/.vim-backup"
if filewritable(expand(g:backupfile_save_dir))
    set backup
    set noswapfile
    execute 'set backupdir=' . g:backupfile_save_dir
    set backupext=.back
else
    echohl Error | echo '!!! no backup mode !!!' | echohl None
    echo '### mkdir $HOME/.vim-backup && chmod 766 $HOME/.vim-backup'
    set nobackup
    set noswapfile
endif
"# undo
if has('persistent_undo')
    set undodir=~/.vimundo
    set undofile
endif

"}}}
"### Tab "{{{

"# create new tab
nnoremap <Plug>(mykey)t :tabnew<CR>
nnoremap <Plug>(mykey)Tc :tabnew<CR>

"# close current tab
nnoremap <Plug>(mykey)Tk :tabclose<CR>

"# tab next/preview
nnoremap <silent> <C-f> gt
nnoremap <silent> <C-b> gT

"}}}
"### search "{{{

"# 検索に大文字を含んでいたら大小区別
set ignorecase
set smartcase

"# 検索時にヒット部位をハイライト
set hlsearch

"# 検索ハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR>

"# 検索時にインクリメンタルサーチを行う
set incsearch

"}}}
"### complation {{{
set complete+=k
set completeopt=menuone
set infercase
set pumheight=10

"# keybind
inoremap <C-j> <C-x><C-n>
inoremap <C-k> <C-x><C-o>
inoremap <C-l> <C-x><C-k>
inoremap <C-_> <C-x><C-f>

for key in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-$@",'\zs')
    exec printf("inoremap %s %s<Left><Right><C-x><C-n><C-p>", key, key)
endfor
inoremap ./ ./<C-x><C-f><C-p>
inoremap / /<C-x><C-f><C-p>
inoremap ~/ ~/<C-x><C-f><C-p>
" }}}
"### Emacs like keybind "{{{

"# カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>

"# Emacs 風カーソル移動
noremap! <C-n> <DOWN>
noremap! <C-p> <UP>
noremap! <C-b> <LEFT>
noremap! <C-f> <RIGHT>
noremap! <C-g> <ESC>

"# Emacs風 行頭行末移動
noremap <C-a> <Home>
noremap <C-e> <End>
noremap! <C-a> <Home>
noremap! <C-e> <End>
nnoremap + <C-a>
nnoremap - <C-x>

if v:version > 704 || v:version == 704 && has('patch754')
    vnoremap <C-a> <C-a>gv
    vnoremap <C-x> <C-x>gv
    vnoremap + <C-a>gv
    vnoremap - <C-x>gv
    vnoremap g+ g<C-a>gv
    vnoremap g- g<C-x>gv
endif

"}}}
"### Indent "{{{

function! s:IndentFormat(cmd)
    let l:cmd = a:cmd
    mkview
    execute "normal " . l:cmd
    loadview
endfunction

"# current buffer indent
nnoremap <C-\> :call <SID>IndentFormat('gg=G')<CR>
vnoremap <C-\> =

"# インデント
set autoindent
set smartindent
set smarttab

"# if(){}などのインデント
set cindent

"# タブを空白に置き換える
let g:my_default_indent=4
execute 'set tabstop=' . g:my_default_indent
set expandtab
execute 'set softtabstop=' . g:my_default_indent
execute 'set shiftwidth=' . my_default_indent

"# {}をインデントして入力
inoremap {<CR> {<CR>}<LEFT><CR><UP><TAB>

"}}}
"### Window "{{{

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

"}}}
"### Folding {{{

"# difine foldmethod
set foldmethod=marker
set foldtext=FoldCCtext()

nnoremap <Space><Space> za<Space>

"}}}
"### for MacVim {{{

if has('macvim')
    " kaoriyadicwin off
    let plugin_dicwin_disable=1

    if exists('+macmeta')
        " enable meta key
        set macmeta
    endif
endif

"}}}
"### Util Functions {{{

" jump startdir
let g:vimstart_dir=$PWD
let g:vimhome_dir=g:vimstart_dir
command! -nargs=0 Home :execute 'cd ' . g:vimhome_dir
command! -nargs=0 SetHome :let g:vimhome_dir=expand('%:p:h')
command! -nargs=0 ResetHome :let g:vimhome_dir=g:vimstart_dir | Home

" jump current dir
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory ==# ''
        execute "cd " . expand("%:p:h")
    else
        execute 'cd ' . a:directory
    endif

    if a:bang ==# ''
        pwd
    endif
endfunction

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

let g:matsubi_space_state = 1
function! MatsubiSpace()
    if g:matsubi_space_state
        highlight MatsubiSpace ctermbg=199 guibg=Cyan
    else
        highlight MatsubiSpace ctermbg=NONE guibg=NONE
    endif
endfunction

function! s:ToggleMatsubiSpaceHighLight()
    let g:matsubi_space_state=g:matsubi_space_state ? 0 : 1
    call MatsubiSpace()
endfunction

if has('syntax')
    augroup MatsubiSpace
        autocmd!
        autocmd ColorScheme * call MatsubiSpace()
        autocmd VimEnter,WinEnter * match MatsubiSpace /\s\+$/
    augroup END
    call ZenkakuSpace()
endif

function! GetCursorSyntaxGroup()
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                \    . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                \    . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction
nnoremap <Leader>s :call GetCursorSyntaxGroup()<CR>
vnoremap <Leader>s :call GetCursorSyntaxGroup()<CR>


function! VimColorTest(outfile, fgend)
    let result = []
    for fg in range(a:fgend)
        let kw = printf('%-7s', printf('c_%d', fg))
        let h = printf('hi %s ctermfg=%d', kw, fg)
        let s = printf('syn keyword %s %s', kw, kw)
        call add(result, printf('%-32s | %s', h, s))
    endfor
    call writefile(result, a:outfile)
    execute 'edit '.a:outfile
    source %
endfunction
" Increase numbers in next line to see more colors.
command! VimColorTest call VimColorTest('vim-color-test.tmp', 255)


" cursor word highlight
" 1 が設定されていれば有効になる
let g:enable_highlight_cursor_word=0

function! s:toggle_highlight_cursor_word()
    if g:enable_highlight_cursor_word
        let g:enable_highlight_cursor_word = 0
        call s:hl_clear()
        echohl Error | echo "Highlight CursorWord disabled" | echohl None
    else
        let g:enable_highlight_cursor_word = 1
        call <SID>set_cursor_word_color()
        echohl DiffChange | echo "Highlight CursorWord enabled" | echohl None
    endif
endfunction

nnoremap <silent> <Plug>(mykey)a :<C-u>call <SID>toggle_highlight_cursor_word()<CR>

function! s:set_cursor_word_color()
    highlight CursorWord ctermfg=Red guifg=Red
endfunction

augroup HighlightCursorWord
    autocmd!
    autocmd CursorHold * call s:hl_cword()
    autocmd ColorScheme * call <SID>set_cursor_word_color()
    autocmd BufLeave * call s:hl_clear()
augroup END

function! s:hl_clear()
    if exists("b:highlight_cursor_word_id") && exists("b:highlight_cursor_word")
        silent! call matchdelete(b:highlight_cursor_word_id)
        unlet b:highlight_cursor_word_id
        unlet b:highlight_cursor_word
    endif
endfunction

function! s:hl_cword()
    if !g:enable_highlight_cursor_word
        return
    endif

    let word = expand("<cword>")
    if word == ""
        return
    endif
    if get(b:, "highlight_cursor_word", "") ==# word
        return
    endif

    call s:hl_clear()

    if !empty(filter(split(word, '\zs'), "strlen(v:val) > 1"))
        return
    endif

    let pattern = printf("\\<%s\\>", expand("<cword>"))
    silent! let b:highlight_cursor_word_id = matchadd("CursorWord", pattern)
    let b:highlight_cursor_word = word
endfunction

"let g:meet_neocomplete_requirements = has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))

"}}}
" }}}
"[ ####------- NeoBundle Settings --------------#### ] {{{
filetype off

let g:neobundle_default_git_protocol = 'https'
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin( expand('~/.vim/bundle') )

"#---------------------------#
"# regular use               #
"#---------------------------#
"# neobundle
NeoBundle 'Shougo/neobundle.vim', 'ver.2.1'
"# sonic-template
NeoBundle 'mattn/sonictemplate-vim'


"# vimproc
NeoBundle 'Shougo/vimproc', 'ver.7.0', {
            \ 'build' : {
            \     'mac'     : 'make -f make_mac.mak',
            \     'unix'    : 'make -f make_unix.mak',
            \    },
            \ }
"# NERDTree
NeoBundleLazy 'scrooloose/nerdtree', {
            \   'autoload' : {
            \       'commands' : [ "NERDTree", "NERDTreeToggle", "NERDTreeCWD" ],
            \       'explorer' : 1,
            \   }
            \ }
"# quickrun
NeoBundle 'thinca/vim-quickrun'
"# quickfixstatus
NeoBundle 'dannyob/quickfixstatus'

"# vim-endwise
NeoBundleLazy 'taichouchou2/vim-endwise', {
            \ 'autoload' : { 'insert' : 1, }
            \ }
"# smartinput
NeoBundleLazy 'kana/vim-smartinput', {
            \ 'autoload' : { 'insert' : 1, }
            \ }
"# niceblock
NeoBundleLazy 'kana/vim-niceblock', {
            \ 'autoload' : { 'insert' : 1, }
            \ }
"# AnsiEsc
NeoBundle 'vim-scripts/AnsiEsc.vim'
"# surround.vim
NeoBundle 'surround.vim'
"# vimsualstar
NeoBundle 'thinca/vim-visualstar'
"# foldCC
NeoBundle 'magicdrive/foldCC'
"# ariline
NeoBundle 'vim-airline/vim-airline'
"# ariline-themes
NeoBundle 'vim-airline/vim-airline-themes'
"# memolist
NeoBundleLazy 'glidenote/memolist.vim', {
            \ 'autoload' : { 'commands' : ['MemoNew','MemoList', 'MemoGrep'] }
            \ }
"# sql-util
NeoBundleLazy 'SQLUtilities', {
            \ 'filetypes' : ['sql'],
            \ 'commands' : ['SQLUFormatter']
            \ }
"# easybuffer
NeoBundle 'troydm/easybuffer.vim'
"# yankring
NeoBundle 'YankRing.vim'

"#----------------------------------#
"# golang                           #
"#----------------------------------#
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'fatih/vim-go'
NeoBundle 'ekalinin/Dockerfile.vim'


"#---------------------------#
"# programing suport plug-in #
"#---------------------------#
"# emacs-commandline
NeoBundle 'houtsnip/vim-emacscommandline'
"# align.vim
NeoBundleLazy 'Align', {
            \ 'autoload' : { 'commands' : ['Align', 'AlignCtrl', 'AlignMapsClean', 'AlignPop', 'AlignPush', 'AlignReplaceQuotedSpaces'] }
            \ }


"#-----------------------#
"# xcode                 #
"#-----------------------#
"# cocoa.vim
NeoBundleLazy 'cocoa.vim', {
            \ 'autoload' : {'filetypes': ['objective-c']}
            \ }
"# swift
NeoBundleLazy 'toyamarinyon/vim-swift', {
            \ 'autoload' : {'filetypes': ['swift']}
            \ }

"#-----------------------#
"# lisp                  #
"#-----------------------#
"# niji
NeoBundleLazy 'losingkeys/vim-niji', {
            \ 'autoload' : {'filetypes': ['clojure','lisp','scheme']}
            \ }

"#-----------------------#
"# ocaml                 #
"#-----------------------#
"# ocamlspot
NeoBundleLazy 'cohama/the-ocamlspot.vim', {
            \ "autoload" : {"filetypes": ['ocaml']}
            \ }

"#-----------------------#
"# jvm                   #
"#-----------------------#
"# groovy.vim
NeoBundleLazy 'groovy.vim', {
            \ "autoload" : {"filetypes": ['groovy']}
            \ }
"# vim-scala
NeoBundleLazy 'magicdrive/vim-scala', {
            \ "autoload" : {"filetypes": ['scala']}
            \}
"# vim-processing
NeoBundleLazy 'sophacles/vim-processing', {
            \ "autoload" : {"filetypes": ['processing']}
            \}
"# pig
NeoBundleLazy 'pig.vim', {
            \ "autoload" : {"filetypes": ['pig']}
            \}

"#-----------------------#
"# javascript            #
"#-----------------------#
"# javascript-syntax
NeoBundle 'jelera/vim-javascript-syntax'
"# vim-coffee-script
NeoBundleLazy 'kchmck/vim-coffee-script',{
            \ 'autoload' : {'filetypes': ['coffee']}
            \ }
"# vim-typescript
NeoBundleLazy 'leafgarland/typescript-vim',{
            \ 'autoload' : {'filetypes': ['typescript']}
            \ }
"# jasmine
NeoBundle 'claco/jasmine.vim', {
            \ 'autoload' : {'filetypes': ['javascript']}
            \ }

"#-----------------------#
"# beamvm                #
"#-----------------------#
NeoBundleLazy 'elixir-lang/vim-elixir', {
            \ 'autoload' : {'filetypes': ['elixir']}
            \ }

NeoBundleLazy 'jimenezrick/vimerl', {
            \ 'autoload' : {'filetypes': ['erlang']}
            \ }

"#-----------------------#
"# ruby                  #
"#-----------------------#
"# vim-bundler
NeoBundleLazy 'tpope/vim-bundler', {
            \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml', 'slim', 'rspec'] }
            \ }

"#-----------------------#
"# python                #
"#-----------------------#
"# jedi
NeoBundleLazy 'davidhalter/jedi-vim', {
            \ 'autoload': { 'filetypes': ['python'] }
            \ }
"# ansible
NeoBundleLazy 'chase/vim-ansible-yaml', {
            \ 'autoload': { 'filetypes': ['yaml'] }
            \ }

"#-----------------------#
"# html-coding           #
"#-----------------------#
"# vim-less
NeoBundleLazy 'groenewege/vim-less', {
            \ 'autoload' : {'filetypes': ['less']}
            \ }
"# emmet.vim
NeoBundleLazy 'mattn/emmet-vim', {
            \ 'autoload' : {'filetypes': ['eruby','html','tt','haml','slim','jade']}
            \ }
"# nginx.vim
NeoBundle 'nginx.vim', {
            \ 'autoload' : {'filetypes': ['nginx']}
            \}
"# html5.vim
NeoBundleLazy 'taichouchou2/html5.vim', {
            \ 'autoload' : {'filetypes': ['html']}
            \}
"# css3vim
NeoBundleLazy 'hail2u/vim-css3-syntax', {
            \ 'autoload' : {'filetypes': ['css']}
            \}
"# sass
NeoBundle 'cakebaker/scss-syntax.vim'
"# haml
NeoBundleLazy 'tpope/vim-haml', {'autoload': {'filetypes':['haml']}}
"# slim
NeoBundleLazy 'slim-template/vim-slim', {'autoload': {'filetypes':['slim']}}

"#-----------------------#
"# util-tool             #
"#-----------------------#
"# yanktmp
NeoBundle 'yanktmp.vim'

NeoBundle 'plasticboy/vim-markdown'
"# jellybeans
NeoBundle 'magicdrive/jellybeans.vim'
"# molokai
NeoBundle 'tomasr/molokai'
"# hybrid
NeoBundle 'w0ng/vim-hybrid'
"# pyte
NeoBundle 'vim-scripts/pyte'

call neobundle#end()
filetype plugin on
filetype indent on

"}}}
"[ ####------- Vim Plugins Settings ------------#### ] {{{
"### vim-markdown {{{

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1

"}}}
"### MemoList.vim {{{

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

"}}}
"### yannktmp.vim "{{{
map <silent> <Plug>(mykey)y :call YanktmpYank()<CR>
map <silent> <Plug>(mykey)p :call YanktmpPaste_p()<CR>
"}}}
"### Align.vim {{{
let g:Align_xstrlen=3
let g:DrChipTopLvlMenu=''
"}}}
"### Airline {{{

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline_theme=has('gui_running') ? 'lucius' : 'dark'

let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = []

"# ESCの遅延防止
if has('unix') && !has('gui_running')
    inoremap <silent> <ESC> <ESC>
    inoremap <silent> <C-[> <ESC>
endif

"}}}
"### EasyBuffer {{{
nnoremap <Plug>(mykey)k :EasyBufferToggle<CR>
"}}}
"### Ref.vim {{{
let g:ref_open="split | resize 15 | set noequalalways"
" ref-manpage
command! -nargs=?  Manpage call ref#open('man', '<args>')
" ref-perldoc
command! -nargs=?  Perldoc call ref#open('perldoc', '<args>')
command! -nargs=?  Perlfunc call OpenPerlfunc('<args>')
function! OpenPerlfunc(func_str)
    execute "Ref perldoc -f " . a:func_str
endfunction
let g:ref_perldoc_auto_append_f=1
" ref-pydoc
command! -nargs=?  Pydoc call ref#open('pydoc', '<args>')

"}}}
"### QuickRun {{{
nnoremap <silent> <Plug>(mykey)r :<C-u>QuickRun<CR>
vnoremap <silent> <Plug>(mykey)r :QuickRun<CR>

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

if executable('processing-java')
    let g:quickrun_config['processing'] = {
                \     'command': 'processing-java',
                \     'exec': ['%c --run --force --sketch=$PWD --output=$PWD/build'],
                \   }
endif

if executable('html2haml')
    let g:quickrun_config = {
                \     'html' : { "type" : "html/haml" },
                \     'html/haml' : { "command" : "html2haml" },
                \   }
endif
"}}}
"### Sass {{{
let g:sass_compile_auto = 1
let g:sass_compile_cdloop = 5
let g:sass_compile_cssdir = ['css', 'stylesheet']
let g:sass_compile_file = ['scss', 'sass']
let g:sass_started_dirs = []

augroup sass_group
    autocmd!
    autocmd FileType less,sass  setlocal sw=2 sts=2 ts=2 et
augroup END
"}}}
"### NERDTree {{{

"# NERDTreeToggle wrapper
nnoremap <silent> <Plug>(mykey)n :call <SID>MY_NERDTreeToggle()<CR>
nnoremap <silent> <Plug>(mykey)i :call <SID>MY_NERDTreeRefresh()<CR>
let g:my_nerdtree_status=0

function! s:MY_NERDTreeRefresh()
    NERDTreeFocus
    normal R
    wincmd l
    let g:my_nerdtree_status = 1
endfunction

function! s:MY_NERDTreeToggle()
    :NERDTreeToggle
    if g:my_nerdtree_status == 0
        wincmd l
    endif
    let g:my_nerdtree_status =
                \ g:my_nerdtree_status ==# 1 ? 0 : 1
endfunction

let g:NERDTreeHijackNetrw=1
let g:NERDTreeWinSize=(&columns / 5)
"}}}
"### Emmet {{{
"#let g:user_emmet_mode='i'
let g:user_emmet_expandabbr_key='<C-Y><C-Y>'
let g:user_emmet_expandword_key='<C-Y><C-Y>'
"}}}
"### YankRing{{{
let g:yankring_history_dir=$HOME . '/.vim-yankring'
if !filewritable(expand(g:yankring_history_dir))
    let s:tmp=system('mkdir -p ' . g:yankring_history_dir)
    echo "create directory:  " . g:yankring_history_dir
endif
"}}}
"### jellybeans {{{
let g:jellybeans_use_lowcolor_black=0
let g:jellybeans_background_color=''
let g:jellybeans_background_color_256=''
"}}}
"### molokai {{{
let g:molokai_original=1
let g:rehash256=1
"}}}
"### sonictemplate {{{
nnoremap <Plug>(mykeylite)t :<C-u>Template<Space>
let g:sonictemplate_vim_template_dir = '~/.vim/misc/template/'
"}}}
"### Jedi {{{
command! -nargs=0 JediRename :call jedi#rename()
let g:jedi#rename_command = ""
let g:jedi#documentation_command = "pydoc"
"}}}
" }}}
"[ ####------- Programming Support Settings ----#### ] {{{
"### C++ support "{{{
augroup cpp_ftplugin
    autocmd!
    if executable('clang-format')
        autocmd FileType c,cpp nnoremap <buffer> <C-\> :<C-u>call <SID>IndentFormat('%!clang-format')<CR>
        autocmd FileType c,cpp vnoremap <buffer> <C-\> :!clang-format<CR>
    endif
augroup END
"}}}
"### Perl support "{{{
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
augroup perl_ftplugin
    autocmd!
    autocmd FileType perl :compiler perl
    if executable('perltidy')
        autocmd FileType perl nnoremap <buffer> <C-\> <C-u>:call <SID>IndentFormat('%! perltidy')<CR>
        autocmd FileType perl vnoremap <buffer> <C-\> :!perltidy<CR>
    endif
    autocmd FileType perl nnoremap <buffer> <F4> :w !perl -c<CR>
    autocmd FileType perl nnoremap <buffer> <F5> :w !perl -c %<CR>
    autocmd FileType perl,ref-perldoc setlocal iskeyword+=a-z,A-Z,48-57,_,:,$,@,%
    autocmd FileType perl nnoremap <buffer> K :<C-u>call ref#open('perldoc', expand('<cword>'))<CR>
    autocmd FileType perl vnoremap <buffer> K :<C-u>call ref#jump('visual', 'perldoc')<CR>
    autocmd FileType perl,ref-perldoc nnoremap <buffer> <Plug>(mykey)3 :<C-u>call OpenPerlModuleCode( expand('<cword>') )<CR>
    autocmd FileType perl,ref-perldoc vnoremap <buffer> <Plug>(mykey)3 :<C-u>call OpenPerlModuleCode( '<visual>' )<CR>
    autocmd FileType perl,ref-perldoc nnoremap <buffer> <F3> :<C-u>call OpenPerlModuleCode( expand('<cword>') )<CR>
    autocmd FileType perl,ref-perldoc vnoremap <buffer> <F3> :<C-u>call OpenPerlModuleCode( '<visual>' )<CR>
augroup END
"}}}
"### Ruby support "{{{
let g:ref_ruby_cmd= executable('refe') ? 'refe' : 'ri'
let g:no_ruby_ftplugin=1

augroup ruby_ftplugin
    autocmd!
    autocmd FileType ruby setlocal nocindent
    autocmd FileType ruby :compiler ruby
    autocmd FileType ruby,ref-ri setlocal iskeyword+=a-z,A-Z,48-57,_,:,$,@,%,?,-
    autocmd FileType ruby nnoremap <buffer> K :<C-u>call ref#open(g:ref_ruby_cmd, expand('<cword>'))<CR>
    autocmd FileType ruby vnoremap <buffer> K :<C-u>call ref#jump('visual', g:ref_ruby_cmd)<CR>
    autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd FileType ruby setlocal autoindent
augroup END
"}}}
"### Python support{{{

augroup python_ftplugin
    autocmd!
    autocmd FileType python setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd FileType python setlocal autoindent
    autocmd FileType python setlocal smartindent
    autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python setlocal commentstring=#%s
augroup END

"}}}
"### Golang support {{{

let g:gocode_path="$HOME/.gopath/src/github.com/nsf/gocode/vim"
if filereadable(expand(g:gocode_path))
    execute "set rtp^=".g:gocode_path
endif
set path+=$GOPATH/src/**
let g:gofmt_command = 'goimports'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_autosave = 0

function! g:GolangFTP()
    syntax keyword goErr err
    highlight goErr cterm=bold ctermfg=214
    syntax keyword goSelf self
    highlight goSelf ctermfg=167
    set sw=4 noexpandtab ts=4
endfunction

function GoImportsOverlay()
    :GoImports
    call GolangFTP()
    echo ":GoImports"
endfunction

augroup go_ftplugin
    autocmd!
    autocmd FileType go nnoremap <silent> <buffer> <C-\> :call GoImportsOverlay()<CR>
    autocmd BufNewFile,BufRead,BufWritePost,BufEnter,BufLeave *.go call GolangFTP()
    autocmd FileType go compiler go
augroup END
"}}}
"### Shell support{{{
augroup shell_ftplugin
    autocmd FileType sh,bash,zsh,csh,tcsh,fish nnoremap <buffer> K :<C-u>call ref#open('man', expand('<cword>'))<CR>
    autocmd FileType sh,bash,zsh,csh,tcsh,fish vnoremap <buffer> K :<C-u>call ref#jump('visual', 'man')<CR>
augroup END
"}}}
"### SQL support{{{

augroup sql_ftplugin
    autocmd!
    autocmd FileType sql nnoremap <buffer> <C-\> <C-u>:call <SID>IndentFormat('SQLUFormatter')<CR>
    autocmd FileType sql vnoremap <buffer> <C-\> :SQLUFormatter<CR>
augroup END

" }}}
"### Lisp support{{{
let g:gauche_repl_cmd = 0
function! s:GaucheREPL(file)
    let filename = a:file
    execute g:gauche_repl_cmd . filename
endfunction

augroup lisp_ftplugin
    autocmd!
    autocmd FileType lisp    :nnoremap <buffer> <Plug>(mykey)m :<C-u>!clisp -i %<CR>
    autocmd FileType scheme  :let g:gauche_repl_cmd = (executable('rlwrap') ? '!rlwrap -pCyan ' : '!') . 'gosh -i -l '
    autocmd FileType scheme  :nnoremap <buffer> <Plug>(mykey)m :<C-u>call <SID>GaucheREPL(expand("%:p"))<CR>
    autocmd FileType clojure :nnoremap <buffer> <Plug>(mykey)m :<C-u>!clj -i %<CR>
    autocmd FileType lisp,scheme :setlocal lisp
    autocmd FileType lisp,scheme :setlocal nocindent
augroup END
" }}}
"### Scala support{{{
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
augroup END
"}}}
"### JavaScript support {{{
augroup javascript_plugin
    autocmd!
    autocmd FileType javascript setlocal omnifunc+=nodejscomplete#CompleteJS
    autocmd FileType javascript setlocal autoindent
augroup END
"}}}
"### TypeScript support {{{
augroup typescript_ftplugin
    autocmd!
    autocmd BufWritePost typescript :make
augroup END
"}}}
"### YAML file {{{
augroup yaml_ftplugin
    autocmd!
    autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab
augroup END
"}}}
"### FileType(Language) assistance "{{{
"# filetype dictionary files
augroup filetype_dict
    autocmd!
    autocmd FileType c,cpp,perl setlocal cindent
    autocmd FileType ruby :setlocal dictionary+=~/.vim/plugin/ruby.vim
    autocmd FileType perl :setlocal dictionary+=~/.vim/dict/perl_function.dict
    autocmd FileType vimshell :setlocal dictionary+=~/.vimshell_hist

    for e in [ 'c', 'cpp', 'lua', 'php', 'perl', 'java', 'scala', 'ocaml', 'vim', 'clisp', 'scheme', 'javascript' ]
        execute 'autocmd FileType '+e+' :setlocal dictionary+=~/.vim/dict/'+e+'.dict'
    endfor

    autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType c          setlocal omnifunc=ccomplete#Complete
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType scheme let is_gauche=1
augroup END
"CF用コメントハイライト有効
let html_wrong_comments=1

"}}}
" }}}
"[ ####------- Colorscheme Settings ------------#### ] "{{{
"# xterm-256color
set t_Co=256

"# Colorscheme
syntax enable

let g:my_colorscheme= has('gui_running') ?  'molokai' : 'jellybeans'
try
    exec "colorscheme" . " " . g:my_colorscheme
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

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

    highlight Normal ctermbg=NONE

    highlight WildMenu
                \ term=bold
                \ ctermfg=217
                \ ctermbg=16
                \ guifg=#f0a0c0
                \ guibg=#302028
    highlight StatusLine
                \ term=bold
                \ ctermfg=16
                \ ctermbg=252
                \ guifg=#000000
                \ guibg=#dddddd

    "# 検索結果のカラースキーム変更
    highlight Search ctermbg=Gray
    if g:colors_name == "molokai"
        highlight rubyModule ctermfg=129 guifg=#af00ff
        highlight rubyClass  ctermfg=129 guifg=#af00ff
    endif
endfunction

augroup color_set
    autocmd!
    if !has('gui_running')
        autocmd ColorScheme * call MyColor()
    endif
augroup END

"# switching colrschme & background
nnoremap <silent> <Plug>(mykey)c :<C-u> call <SID>ChangeBackground()<CR>
"}}}
"[ ####------- FileType Settings ---------------#### ]"{{{
augroup detect_filetype
    autocmd!
    " javascript genus
    autocmd BufNewFile,BufRead,BufWritePost *.bowerrc* set filetype=javascript
    autocmd BufNewFile,BufRead,BufWritePost *[Ss]pec.js,*SpecHelper.js set filetype=jasmine.javascript syntax=jasmine.javascript
    autocmd BufNewFile,BufRead,BufWritePost *[Ss]pec.coffee,*SpecHelper.coffee set filetype=jasmine.coffee syntax=jasmine.coffee
    autocmd BufRead,BufNewFile,BufWritePost *.coffee set filetype=coffee
    autocmd BufRead,BufNewFile,BufWritePost *.ts set filetype=typescript
    " html genus
    autocmd BufRead,BufNewFile,BufWritePost *.html.template set filetype=html
    autocmd BufRead,BufNewFile,BufWritePost *.vue set filetype=html
    " perl genus
    autocmd BufNewFile,BufRead,BufWritePost *.tt,*.cfm set filetype=html
    autocmd BufNewFile,BufRead,BufWritePost *.t,*.psgi set filetype=perl
    " perl genus
    autocmd BufNewFile,BufRead,BufWritePost *.py,*.py3.[0-9],*.py3,*.py2,*.py2.[0-9] set filetype=python
    " xcode genus
    autocmd BufNewFile,BufRead,BufWritePost *.m  set filetype=objective-c
    autocmd BufNewFile,BufRead,BufWritePost *.mm set filetype=cpp.objective-c
    autocmd BufNewFile,BufRead,BufWritePost *.swift set filetype=swift
    " shell genus
    autocmd BufNewFile,BufRead,BufWritePost **/nginx/conf/*.conf set filetype=nginx
    autocmd BufNewFile,BufRead,BufWritePost nginx.conf set filetype=nginx
    autocmd BufNewFile,BufRead,BufWritePost *.nginx.conf set filetype=nginx
    autocmd BufNewFile,BufRead,BufWritePost */apache/conf/* set filetype=apache
    autocmd BufNewFile,BufRead,BufWritePost apache.conf set filetype=apache
    autocmd BufNewFile,BufRead,BufWritePost *.apache.conf set filetype=apache
    autocmd BufNewFile,BufRead,BufWritePost */patches/* set filetype=diff
    autocmd BufNewFile,BufRead,BufWritePost *tmux*conf* set filetype=tmux
    autocmd BufNewFile,BufRead,BufWritePost *envrc* set filetype=bash
    " graphics genus
    autocmd BufNewFile,BufRead,BufWritePost *.pde set filetype=processing
    autocmd BufNewFile,BufRead,BufWritePost *.as set filetype=actionscript
    " jvm genus
    autocmd BufNewFile,BufRead,BufWritePost .vrapperrc set filetype=vim
    autocmd BufNewFile,BufRead,BufWritePost *.scala set filetype=scala
    autocmd BufNewFile,BufRead,BufWritePost *.sbt set filetype=sbt
    autocmd BufNewFile,BufRead,BufWritePost *.gradle set filetype=groovy
    autocmd BufNewFile,BufRead,BufWritePost *.pig set filetype=pig syntax=pig
    " ruby genus
    autocmd BufNewFile,BufRead,BufWritePost [Rr]akefile set filetype=ruby
    autocmd BufNewFile,BufRead,BufWritePost [Gg]emfile set filetype=ruby
    autocmd BufNewFile,BufRead,BufWritePost [Gg]uardfile set filetype=ruby
    autocmd BufNewFile,BufRead,BufWritePost *.gemspec set filetype=ruby
    autocmd BufNewFile,BufRead,BufWritePost *.rake set filetype=ruby
    autocmd BufNewFile,BufRead,BufWritePost *.ru set filetype=ruby
    autocmd BufNewFile,BufRead,BufWritePost *.unicorn set filetype=ruby
    autocmd BufNewFile,BufRead,BufWritePost *.cap set filetype=ruby
    autocmd BufNewFile,BufRead,BufWritePost *.god,*.eye set filetype=ruby
    autocmd BufNewFile,BufRead,BufWritePost *_spec.rb set filetype=ruby.rspec
    autocmd BufNewFile,BufRead,BufWritePost *_text.rb set filetype=ruby.rspec
    autocmd BufNewFile,BufRead,BufWritePost *[Pp]rocfile* set syntax=yaml
    " lisp genus
    autocmd FileType lisp set syntax=lisp
    autocmd BufNewFile,BufRead,BufWritePost *.gosh set filetype=scheme
    autocmd FileType scheme set syntax=scheme
    " beamvm
    autocmd BufRead,BufNewFile,BufWritePost *.ex,*.exs set filetype=elixir
    autocmd BufRead,BufNewFile,BufWritePost *.erl set filetype=erlang
    " sql
    autocmd BufNewFile,BufRead,BufWritePost *.presto set syntax=sql
    autocmd BufNewFile,BufRead,BufWritePost *.hive set syntax=sql
    " mysql
    autocmd BufNewFile,BufRead,BufWritePost my.cnf set syntax=dosini
augroup END
"}}}
"[ ####------- Read Local Settings -------------#### ] {{{
let g:user_local_vimrc = $HOME . '/.vimrc.local'
if filereadable(expand(g:user_local_vimrc))
    execute 'source ' . g:user_local_vimrc
endif
if expand($PWD) !=# expand($HOME)
    let g:local_vimrc = $PWD . '/.vimrc.local'
    if filereadable(expand(g:local_vimrc))
        execute 'source ' . g:local_vimrc
    endif
endif
" }}}
"[ ####------- NeoBundleCheck ------------------#### ] {{{
NeoBundleCheck
" }}}
"# __END__
