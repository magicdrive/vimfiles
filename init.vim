" Adding the Vim runtime to Neovim
set runtimepath+=~/.vim
set packpath+=~/.vim

" Loading shared settings with Vim
source ~/.vimrc

set notermguicolors
" Neovim reads after/syntax/go.vim when using Go filetype
augroup my_go_after_syntax
  autocmd!
  autocmd FileType go source ~/.vim/after/syntax/go.vim
augroup END
