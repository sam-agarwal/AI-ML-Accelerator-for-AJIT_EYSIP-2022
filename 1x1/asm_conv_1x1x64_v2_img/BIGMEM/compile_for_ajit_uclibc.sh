makeLinkerScript.py -t 0x40000000 -d 0x40040000 -o customLinkerScript.lnk
# application name
MAIN=vector_sum
# support infrastructure.
#   for enabling serial device etc.
AAR=$AJIT_ACCESS_ROUTINES_MT
#   timer.
PT=$AJIT_MINIMAL_PRINTF_TIMER
#   trap handlers
# compile sources.
SRCS=" -c ../main.c -s ../conv.s -s ../sconv.s -s ../init.s -s $AAR/asm/trap_handlers.s -s $AAR/asm/mutexes.s -C $AAR/src -C $PT/src"
# compile includes.
INCLUDES="-I ../ -I $AAR/include -I $PT/include -I $AJIT_UCLIBC_HEADERS -I $AJIT_LIBGCC_INSTALL_DIR/include "
# compile the application.
compileToSparcUclibc.py -o 2 -V VMAP.TXT -U $SRCS $INCLUDES -N ${MAIN} -L customLinkerScript.lnk 

