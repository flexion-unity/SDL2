# Build RPMs for SGUG-RSE

in sgugshell:

make sure you're in the repo root (not in irix dir)

$ git archive --prefix=SDL2-2.33.0/ -o ~/rpmbuild/SOURCES/SDL2-2.33.0.tar.gz HEAD
$ rpmbuild -ba irix/SDL2.spec 2>&1 | tee sdl2-rpmbuild.log


# Build libraries without SGUG

$ cd irix
$ smake