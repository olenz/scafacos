#!/bin/sh -e

myprefix=$HOME/local
PFFT_VERSION=1.0.6-alpha
FFTW_VERSION=3.3.3
INSTDIR=$myprefix/pfft-$PFFT_VERSION
FFTWDIR=$myprefix/fftw-$FFTW_VERSION
TMP="tmp-pfft-$PFFT_VERSION"

# bash check if directory exists
if [ -d $TMP ]; then
        echo "Directory $TMP already exists. Delete it? (y/n)"
	read answer
	if [ ${answer} = "y" ]; then
		rm -rf $TMP
	else
		echo "Program aborted."
		exit 1
	fi
fi

mkdir $TMP && cd $TMP
cd ../.. && ./bootstrap.sh && cd -
../../configure --prefix=$INSTDIR --with-fftw3=$FFTWDIR --disable-shared

make -j 4
make install

