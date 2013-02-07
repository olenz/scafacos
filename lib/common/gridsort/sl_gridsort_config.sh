#!/bin/sh
#set -xv

SL_CONFIG=../sl/support/sl_config.sh

${SL_CONFIG} --dst-sl=. --source-ref=../sl --am-libname=libfcs_gridsort.a --extra-prefix=fcs_gridsort_

sed -i -e 's!^noinst_LIBRARIES\(.*libfcs_gridsort.a\)$!if ENABLE_SINGLE_LIB\nnoinst_LIBRARIES\1\nelse\nlib_LIBRARIES\1\n\endif!' \
       -e 's!\(-I$(srcdir_sl)/include\)!\1 -I$(top_srcdir)/lib!' \
       Makefile.am
