#! /bin/sh

#
# install something..
#

script_home=$(cd $(dirname) && pwd)
cd ${script_home}

version=0.1
tarball=sample-${version}.tar.gz
archivedir=sample-${version}

prefix=/usr/local

if [ ! -f ${tarball} ];then
    wget URL
fi

tar zxvf ${tarball}
cd ${archivedir}

./configure --prefix=${prefix}

make && make install

cd ${script_home}

rm -fr ${archivedir}


exit 0;

