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

"# vim-flymake
NeoBundle 'kana/vim-flymake'

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

