#if $(STATIC) == "1"
TEST_LIBS    = libSDL2_test.a libSDL2.a -lpthread -laudio -lX11 -lXext -lm
#else
TEST_LIBS    = libSDL2_test.a -L. -lSDL2
#endif

# OpenGL flags for tests that need OpenGL
GL_CFLAGS = -DHAVE_OPENGL

TESTS = \
	checkkeys \
	loopwave \
	testaudioinfo \
	testcustomcursor \
	testdisplayinfo \
	testdraw2 \
	testdrawchessboard \
	testdropfile \
	testerror \
	testfile \
	testfilesystem \
	testgamecontroller \
	testgeometry \
	testgesture \
	testgl2 \
	testgles \
	testhaptic \
	testiconv \
	testime \
	testintersections \
	testjoystick \
	testkeys \
	testloadso \
	testlock \
	testmessage \
	testmultiaudio \
	testnative \
	testoverlay2 \
	testplatform \
	testpower \
	testrelative \
	testrendercopyex \
	testrendertarget \
	testrumble \
	testscale \
	testsem \
	testshape \
	testsprite2 \
	testspriteminimal \
	teststreaming \
	testthread \
	testtimer \
	testver \
	testviewport \
	testwm2 \
	testyuv \
	torturethread \
	testautomation

SDLTEST_OBJS = \
	SDL_test_assert.o \
	SDL_test_common.o \
	SDL_test_compare.o \
	SDL_test_crc32.o \
	SDL_test_font.o \
	SDL_test_fuzzer.o \
	SDL_test_harness.o \
	SDL_test_imageBlit.o \
	SDL_test_imageBlitBlend.o \
	SDL_test_imageFace.o \
	SDL_test_imagePrimitives.o \
	SDL_test_imagePrimitivesBlend.o \
	SDL_test_log.o \
	SDL_test_md5.o \
	SDL_test_memory.o \
	SDL_test_random.o

libSDL2_test.a: $(SDLTEST_OBJS)
	ar -cr $@ $(SDLTEST_OBJS)

SDL_test_assert.o: ../src/test/SDL_test_assert.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_assert.c
SDL_test_common.o: ../src/test/SDL_test_common.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_common.c
SDL_test_compare.o: ../src/test/SDL_test_compare.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_compare.c
SDL_test_crc32.o: ../src/test/SDL_test_crc32.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_crc32.c
SDL_test_font.o: ../src/test/SDL_test_font.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_font.c
SDL_test_fuzzer.o: ../src/test/SDL_test_fuzzer.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_fuzzer.c
SDL_test_harness.o: ../src/test/SDL_test_harness.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_harness.c
SDL_test_imageBlit.o: ../src/test/SDL_test_imageBlit.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_imageBlit.c
SDL_test_imageBlitBlend.o: ../src/test/SDL_test_imageBlitBlend.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_imageBlitBlend.c
SDL_test_imageFace.o: ../src/test/SDL_test_imageFace.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_imageFace.c
SDL_test_imagePrimitives.o: ../src/test/SDL_test_imagePrimitives.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_imagePrimitives.c
SDL_test_imagePrimitivesBlend.o: ../src/test/SDL_test_imagePrimitivesBlend.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_imagePrimitivesBlend.c
SDL_test_log.o: ../src/test/SDL_test_log.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_log.c
SDL_test_md5.o: ../src/test/SDL_test_md5.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_md5.c
SDL_test_memory.o: ../src/test/SDL_test_memory.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_memory.c
SDL_test_random.o: ../src/test/SDL_test_random.c
	$(CC) $(CFLAGS) -c ../src/test/SDL_test_random.c
testutils.o: ../test/testutils.c
	$(CC) $(CFLAGS) -c ../test/testutils.c

checkkeys: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/checkkeys.c testutils.o $(LDFLAGS) $(TEST_LIBS)

loopwave: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/loopwave.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testaudioinfo: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testaudioinfo.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testcustomcursor: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testcustomcursor.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testdisplayinfo: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testdisplayinfo.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testdraw2: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testdraw2.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testdrawchessboard: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testdrawchessboard.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testdropfile: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testdropfile.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testerror: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testerror.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testfile: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testfile.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testfilesystem: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testfilesystem.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testgamecontroller: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testgamecontroller.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testgeometry: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testgeometry.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testgesture: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testgesture.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testgl2: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) $(GL_CFLAGS) -o $@ ../test/testgl2.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testgles: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) $(GL_CFLAGS) -o $@ ../test/testgles.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testhaptic: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testhaptic.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testiconv: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testiconv.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testime: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testime.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testintersections: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testintersections.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testjoystick: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testjoystick.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testkeys: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testkeys.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testloadso: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testloadso.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testlock: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testlock.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testmessage: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testmessage.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testmultiaudio: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testmultiaudio.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testnative: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testnative.c ../test/testnativex11.c testutils.o $(LDFLAGS) $(TEST_LIBS) -lX11

testoverlay2: libSDL2_test.a testutils.o testyuv_cvt.o
	$(CC) $(CFLAGS) -o $@ ../test/testoverlay2.c testyuv_cvt.o testutils.o $(LDFLAGS) $(TEST_LIBS)

testplatform: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testplatform.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testpower: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testpower.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testrelative: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testrelative.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testrendercopyex: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testrendercopyex.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testrendertarget: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testrendertarget.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testrumble: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testrumble.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testscale: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testscale.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testsem: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testsem.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testshape: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testshape.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testsprite2: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testsprite2.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testspriteminimal: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testspriteminimal.c testutils.o $(LDFLAGS) $(TEST_LIBS)

teststreaming: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/teststreaming.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testthread: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testthread.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testtimer: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testtimer.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testver: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testver.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testviewport: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testviewport.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testwm2: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/testwm2.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testyuv_cvt.o: ../test/testyuv_cvt.c
	$(CC) $(CFLAGS) -c ../test/testyuv_cvt.c

testyuv: libSDL2_test.a testutils.o testyuv_cvt.o
	$(CC) $(CFLAGS) -o $@ ../test/testyuv.c testyuv_cvt.o testutils.o $(LDFLAGS) $(TEST_LIBS)

torturethread: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ ../test/torturethread.c testutils.o $(LDFLAGS) $(TEST_LIBS)

testautomation: libSDL2_test.a testutils.o
	$(CC) $(CFLAGS) -o $@ \
	../test/testautomation.c \
	../test/testautomation_audio.c \
	../test/testautomation_clipboard.c \
	../test/testautomation_events.c \
	../test/testautomation_guid.c \
	../test/testautomation_hints.c \
	../test/testautomation_joystick.c \
	../test/testautomation_keyboard.c \
	../test/testautomation_log.c \
	../test/testautomation_main.c \
	../test/testautomation_math.c \
	../test/testautomation_mouse.c \
	../test/testautomation_pixels.c \
	../test/testautomation_platform.c \
	../test/testautomation_rect.c \
	../test/testautomation_render.c \
	../test/testautomation_rwops.c \
	../test/testautomation_sdltest.c \
	../test/testautomation_stdlib.c \
	../test/testautomation_subsystems.c \
	../test/testautomation_surface.c \
	../test/testautomation_syswm.c \
	../test/testautomation_timer.c \
	../test/testautomation_video.c \
	testutils.o \
	$(LDFLAGS) $(TEST_LIBS)

tests: $(TESTS)

clean_tests:
	rm -f $(TESTS) libSDL2_test.a *.o

.PHONY: tests clean_tests
