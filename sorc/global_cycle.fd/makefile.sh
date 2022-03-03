#!/bin/ksh
set -x

#-----------------------------------------------------
#-use standard module.
#-----------------------------------------------------

export FCMP=${FCMP:-ifort}

##export DEBUG='-ftrapuv -check all -check nooutput_conversion -fp-stack-check -fstack-protector -traceback -g'
export INCS="-I$IP_INCd -I${NETCDF_INCLUDES}"
export FFLAGS="$INCS -O3 -fp-model precise -r8 -convert big_endian -traceback -g"
export OMPFLAG=-qopenmp
export LDFLG=-qopenmp

export LIBSM="${W3NCO_LIBd} ${BACIO_LIB4} ${IP_LIBd} ${SP_LIBd} -L${NETCDF_LIBRARIES} -lnetcdff -lnetcdf -L${HDF5_LIBRARIES} -lhdf5_hl -lhdf5 ${ZLIB_LIB}"

make -f Makefile clean
make -f Makefile
make -f Makefile install
make -f Makefile clean
