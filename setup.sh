#! /bin/bash

#
# setup my vim emvironment
#

set -e

execdatetime=$(date +%Y-%m-%d_%H:%M:%S)

current=$(cd $(dirname $0) && pwd)

if [ ! -e ${current}/vim/memo ];then
  if [ -e $HOME/Dropbox/memolist.d ];then
    ln -sfn $HOME/Dropbox/memolist.d ${current}/vim/memo
  else
    if [ -L ${current}/vim/memo ];then
      rm ${current}/vim/memo
    fi
    mkdir -p ${current}/vim/memo
  fi
fi
mkdir -p ${current}/vim/bundle/
mkdir -p  ~/.vimundo


mkdir -p ${HOME}/.vim-backup && chmod 766 ${HOME}/.vim-backup
mkdir -p ${HOME}/.vim-yankring


files=( 'vimrc' 'gvimrc' 'vim' );
for x in ${files[@]}; do
  [ -e ${HOME}/.${x} ] && mv ${HOME}/.${x} ${HOME}/.${x}.BAK.${execdatetime}
  ln -sfn ${current}/${x} ${HOME}/.${x}
done;

vimproc_build

cp -a "${current}/bin/tovim" ~/local/bin/

echo;echo;echo "setup complete!"

exit 0;
