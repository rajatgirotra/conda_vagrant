cc -L$PREFIX/lib -Wl,-rpath,${PREFIX}/lib -I$PREFIX/include -lmpfr -lgmp $RECIPE_DIR/test.c -o test.o
./test.o
