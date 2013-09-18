#! /bin/bash

#
# setup my vim emvironment
#

set -e

execdatetime=$(date +%Y-%m-%d_%H:%M:%S)

current=$(cd $(dirname $0) && pwd)

if [ ! -e ${current}/vim/memo ];then
    if [ -e $HOME/Dropbox/memolist.d ];then
        ln -s $HOME/Dropbox/memolist.d ${current}/vim/memo
    else
        mkdir ${current}/vim/memo
    fi
fi
mkdir -p ${current}/vim/bundle/automatic/

libs=('neobundle.vim' 'vimproc' 'unite.vim');
for x in ${libs[@]}; do
    if [ ! -d ${current}/vim/bundle/automatic/${x} ];then
        git clone git://github.com/Shougo/${x} ${current}/vim/bundle/automatic/${x}
    fi
done;

mkdir -p ${HOME}/.vim-backup && chmod 766 ${HOME}/.vim-backup

vimproc_build() {
    cd ${current}/vim/bundle/automatic/vimproc

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

nerdcommenter_build() {
    [ $(which rake) ] || return

    if [ ! -d ${current}/vim/bundle/automatic/nerdcommenter ];then
            git clone git://github.com/scrooloose/nerdcommenter ${current}/vim/bundle/automatic/nerdcommenter
    fi
    cd ${current}/vim/bundle/automatic/nerdcommenter
    rake
    [ -f ${current}/vim/README.md ] && rm -f cd ${current}/vim/README.md
    cd ${current}
}

files=( 'vimrc' 'gvimrc' 'vim' );
for x in ${files[@]}; do
    [ -e ${HOME}/.${x} ] && mv ${HOME}/.${x} ${HOME}/.${x}.BAK.${execdatetime}
    ln -s ${current}/${x} ${HOME}/.${x}
done;

vimproc_build
nerdcommenter_build

yes | vim -c qa!

echo;echo;echo "setup complete!"

exit 0;
