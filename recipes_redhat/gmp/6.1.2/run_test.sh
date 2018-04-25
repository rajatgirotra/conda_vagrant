cc -I $PREFIX/include -L $PREFIX/lib -Wl,-rpath,${PREFIX}/lib test.c -lgmp -o test.out
./test.out
