## Recipe for setup with ...
* msys2
* mingw-w64-x86_64-toolchain
* BAWT batteries included
* OSGeo4W with proj installed

```
./configure --prefix=/c/Tcl --exec-prefix=/c/Tcl  
make clean  
make CFLAGS=-I/c/OSGeo4W/include LDFLAGS=-L/c/OSGeo4W/bin  
make install    

```