#! /bin/bash

execdatetime=$(date +%Y-%m-%d_%H:%M:%S)

[ ! -e ${PWD}/vim/memo ] && mkdir ${PWD}/vim/memo

git clone https://github.com/Shougo/neobundle.vim.git ${PWD}/vim/bundle/automatic/neobundle.vim
git clone https://github.com/Shougo/unite.vim.git ${PWD}/vim/bundle/automatic/unite.vim
git clone https://github.com/Shougo/vimproc.git ${PWD}/vim/bundle/automatic/vimproc

mkdir ${HOME}/.vim-backup && chmod 766 ${HOME}/.vim-backup

pushd ${PWD}/vim/bundle/automatic/vimproc

if [ $(uname) = 'Linux' ];then
    make -f make_unix.mak
else
    make -f make_mac.mak
fi

popd

[ -e ${HOME}/.vim ] && mv ${HOME}/.vim ${HOME}/.vim.BAK.${execdatetime}
[ -e ${HOME}/.vimrc ] && mv ${HOME}/.vimrc ${HOME}/.vimrc.BAK.${execdatetime}

ln -s ${PWD}/vim ${HOME}/.vim
ln -s ${PWD}/vimrc ${HOME}/.vimrc

vim -c 'Unite -vertical neobundle/install' -c 'qall'

exit 0;

