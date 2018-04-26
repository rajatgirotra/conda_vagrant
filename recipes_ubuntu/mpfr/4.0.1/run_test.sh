cc -I$PREFIX/include $RECIPE_DIR/test.c -L$PREFIX/lib -Wl,-rpath,${PREFIX}/lib -lmpfr -lgmp -o test.o
./test.o
