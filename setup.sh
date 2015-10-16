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

libs=('neobundle.vim' 'vimproc');
for x in ${libs[@]}; do
  if [ ! -d ${current}/vim/bundle/${x} ];then
    git clone git://github.com/Shougo/${x} ${current}/vim/bundle/${x}
  fi
done;

mkdir -p ${HOME}/.vim-backup && chmod 766 ${HOME}/.vim-backup
mkdir -p ${HOME}/.vim-yankring

vimproc_build() {
  cd ${current}/vim/bundle/vimproc

  local kernelname=$(uname -s)
  local makefile_name=''
  case ${kernelname} in
    Linux | FreeBSD)
      makefile_name=make_unix.mak
      ;;
    Darwin)
      makefile_name=make_mac.mak
      ;;
  esac

  make -f ${makefile_name} clean
  make -f ${makefile_name}

  cd ${current}
}


files=( 'vimrc' 'gvimrc' 'vim' );
for x in ${files[@]}; do
  [ -e ${HOME}/.${x} ] && mv ${HOME}/.${x} ${HOME}/.${x}.BAK.${execdatetime}
  ln -sfn ${current}/${x} ${HOME}/.${x}
done;

vimproc_build

cp -a "${current}/bin/tovim" ~/local/bin/

echo;echo;echo "setup complete!"

exit 0;
