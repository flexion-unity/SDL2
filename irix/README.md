# Build RPMs for SGUG-RSE

in sgugshell:

make sure you're in the repo root (not in irix dir)

$ git archive --prefix=SDL2-2.33.0/ -o ~/rpmbuild/SOURCES/SDL2-2.33.0.tar.gz HEAD
$ rpmbuild -ba irix/SDL2.spec 2>&1 | tee sdl2-rpmbuild.log


# Build libraries without SGUG

$ cd irix
$ smake


# Compile an app with MIPSPro (static)

cc -o test-static-mipspro test.c -v -c99 -static -I/usr/sgug/include /usr/sgug/lib32/libSDL2.a -lpthread -laudio -lm -lGL -lX11


# Compile an app with SGUG-RSE gcc (static)
well, we shouldn't mix, but as long as it works :)

CFLAGS="-I/usr/sgug/lib/gcc/mips-sgi-irix6.5/9/include -I/usr/include -I/usr/sgug/include"

LDFLAGS+="/usr/lib32/libX11.so.1 /usr/lib32/libXext.a /usr/lib32/libXt.a /usr/lib32/libXm.so.1 /usr/lib32/libXpm.so.1  -lpthread -laudio -g -Wl,--allow-shlib-undefined -Wl,-rpath-link=/usr/lib32 -Wl,-rpath=/usr/lib32:/usr/sgug/lib32"

gcc -o test-static-gcc test.c -static $CFLAGS $LDFLAGS -l:/usr/lib32/libX11.so.1 -l:/usr/lib32/libGL.so -l:/usr/lib32/libXext.so -l:/usr/lib32/libGLcore.so /usr/sgug/lib32/libSDL2.a
