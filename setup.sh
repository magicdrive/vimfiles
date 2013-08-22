#! /bin/bash

execdatetime=$(date +%Y-%m-%d_%H:%M:%S)

[ ! -e ${PWD}/vim/memo ] && mkdir ${PWD}/vim/memo

libs=('neobundle.vim' 'unite.vim' 'vimproc');

for x in ${libs[@]}; do
    git clone git://github.com/Shougo/${x} ${PWD}/vim/bundle/automatic/${x}
done;

mkdir ${HOME}/.vim-backup && chmod 766 ${HOME}/.vim-backup

pushd ${PWD}/vim/bundle/automatic/vimproc

kernelname=$(uname -s)

if [ ${kernelname} = 'Linux' ];then
    make -f make_unix.mak
elif [ ${kernelname} = 'Darwin' ];then
    make -f make_mac.mak
fi

popd

files=( 'vimrc' 'gvimrc' 'vim' );

for x in ${files[@]}; do
    [ -e ${HOME}/.${x} ] && mv ${HOME}/.${x} ${HOME}/.${x}.BAK.${execdatetime}
    ln -s ${PWD}/${x} ${HOME}/.${x}
done;

exit 0;

