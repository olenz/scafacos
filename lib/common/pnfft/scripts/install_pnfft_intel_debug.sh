#!/bin/sh -e

myprefix=$HOME/local
PNFFT_VERSION=1.0.5-alpha
PFFT_VERSION=1.0.6-alpha
FFTW_VERSION=3.3.3
INSTDIR=$myprefix/pnfft-$PNFFT_VERSION-debug
PFFTDIR=$myprefix/pfft-$PFFT_VERSION-debug
FFTWDIR=$myprefix/fftw-$FFTW_VERSION-debug
TMP="tmp-pnfft-$PNFFT_VERSION-debug"

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
../../configure --prefix=$INSTDIR --with-fftw3=$FFTWDIR --disable-shared --enable-debug FC=mpif90 CC=mpicc MPICC=mpicc MPIFC=mpif90 

make -j 4
make install
#make check
# ./configure --prefix=$INSTDIR --with-fftw3=$FFTWDIR FC="mpif90 -f90=gfortran" CC="mpicc -cc=gcc"&& make && make check && make install
