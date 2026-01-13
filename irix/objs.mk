OBJS = \
SDL.o \
SDL_assert.o \
SDL_dataqueue.o \
SDL_error.o \
SDL_guid.o \
SDL_hints.o \
SDL_list.o \
SDL_log.o \
SDL_utils.o \
SDL_atomic.o \
SDL_spinlock.o \
SDL_audio.o \
SDL_audiocvt.o \
SDL_audiodev.o \
SDL_audiotypecvt.o \
SDL_mixer.o \
SDL_wave.o \
SDL_diskaudio.o \
SDL_dmediaaudio.o \
SDL_dummyaudio.o \
SDL_poll.o \
SDL_cpuinfo_irix.o \
SDL_dynapi.o \
SDL_clipboardevents.o \
SDL_displayevents.o \
SDL_dropevents.o \
SDL_events.o \
SDL_gesture.o \
SDL_keyboard.o \
SDL_mouse.o \
SDL_quit.o \
SDL_touch.o \
SDL_windowevents.o \
SDL_keysym_to_scancode.o \
SDL_scancode_tables.o \
imKStoUCS.o \
SDL_rwops.o \
SDL_sysfilesystem.o \
SDL_haptic.o \
SDL_syshaptic.o \
SDL_hidapi.o \
SDL_gamecontroller.o \
SDL_joystick.o \
SDL_steam_virtual_gamepad.o \
controller_type.o \
SDL_sysjoystick.o \
SDL_sysloadso.o \
SDL_locale.o \
SDL_syslocale.o \
SDL_url.o \
SDL_sysurl.o \
SDL_power.o \
SDL_render.o \
SDL_yuv_sw.o \
SDL_render_gl.o \
SDL_shaders_gl.o \
SDL_blendfillrect.o \
SDL_blendline.o \
SDL_blendpoint.o \
SDL_drawline.o \
SDL_drawpoint.o \
SDL_render_sw.o \
SDL_rotate.o \
SDL_triangle.o \
SDL_sensor.o \
SDL_dummysensor.o \
SDL_crc16.o \
SDL_crc32.o \
SDL_getenv.o \
SDL_iconv.o \
SDL_malloc.o \
SDL_qsort.o \
SDL_stdlib.o \
SDL_string.o \
SDL_strtokr.o \
SDL_thread.o \
SDL_syscond.o \
SDL_sysmutex.o \
SDL_syssem.o \
SDL_systhread.o \
SDL_systls.o \
SDL_timer.o \
SDL_systimer.o \
SDL_RLEaccel.o \
SDL_blit.o \
SDL_blit_0.o \
SDL_blit_1.o \
SDL_blit_A.o \
SDL_blit_N.o \
SDL_blit_auto.o \
SDL_blit_copy.o \
SDL_blit_slow.o \
SDL_bmp.o \
SDL_clipboard.o \
SDL_fillrect.o \
SDL_pixels.o \
SDL_rect.o \
SDL_shape.o \
SDL_stretch.o \
SDL_surface.o \
SDL_video.o \
SDL_yuv.o \
yuv_rgb_std.o \
SDL_nullevents.o \
SDL_nullframebuffer.o \
SDL_nullvideo.o \
SDL_x11clipboard.o \
SDL_x11dyn.o \
SDL_x11events.o \
SDL_x11framebuffer.o \
SDL_x11keyboard.o \
SDL_x11messagebox.o \
SDL_x11modes.o \
SDL_x11mouse.o \
SDL_x11opengl.o \
SDL_x11shape.o \
SDL_x11touch.o \
SDL_x11video.o \
SDL_x11window.o \
SDL_x11xfixes.o \
SDL_x11xinput2.o


SDL.o: ../src/SDL.c
	$(CC) $(CFLAGS) -c ../src/SDL.c -o SDL.o

SDL_assert.o: ../src/SDL_assert.c
	$(CC) $(CFLAGS) -c ../src/SDL_assert.c -o SDL_assert.o

SDL_dataqueue.o: ../src/SDL_dataqueue.c
	$(CC) $(CFLAGS) -c ../src/SDL_dataqueue.c -o SDL_dataqueue.o

SDL_error.o: ../src/SDL_error.c
	$(CC) $(CFLAGS) -c ../src/SDL_error.c -o SDL_error.o

SDL_guid.o: ../src/SDL_guid.c
	$(CC) $(CFLAGS) -c ../src/SDL_guid.c -o SDL_guid.o

SDL_hints.o: ../src/SDL_hints.c
	$(CC) $(CFLAGS) -c ../src/SDL_hints.c -o SDL_hints.o

SDL_list.o: ../src/SDL_list.c
	$(CC) $(CFLAGS) -c ../src/SDL_list.c -o SDL_list.o

SDL_log.o: ../src/SDL_log.c
	$(CC) $(CFLAGS) -c ../src/SDL_log.c -o SDL_log.o

SDL_utils.o: ../src/SDL_utils.c
	$(CC) $(CFLAGS) -c ../src/SDL_utils.c -o SDL_utils.o

SDL_atomic.o: ../src/atomic/SDL_atomic.c
	$(CC) $(CFLAGS) -c ../src/atomic/SDL_atomic.c -o SDL_atomic.o

SDL_spinlock.o: ../src/atomic/SDL_spinlock.c
	$(CC) $(CFLAGS) -c ../src/atomic/SDL_spinlock.c -o SDL_spinlock.o

SDL_audio.o: ../src/audio/SDL_audio.c
	$(CC) $(CFLAGS) -c ../src/audio/SDL_audio.c -o SDL_audio.o

SDL_audiocvt.o: ../src/audio/SDL_audiocvt.c
	$(CC) $(CFLAGS) -c ../src/audio/SDL_audiocvt.c -o SDL_audiocvt.o

SDL_audiodev.o: ../src/audio/SDL_audiodev.c
	$(CC) $(CFLAGS) -c ../src/audio/SDL_audiodev.c -o SDL_audiodev.o

SDL_audiotypecvt.o: ../src/audio/SDL_audiotypecvt.c
	$(CC) $(CFLAGS) -c ../src/audio/SDL_audiotypecvt.c -o SDL_audiotypecvt.o

SDL_mixer.o: ../src/audio/SDL_mixer.c
	$(CC) $(CFLAGS) -c ../src/audio/SDL_mixer.c -o SDL_mixer.o

SDL_wave.o: ../src/audio/SDL_wave.c
	$(CC) $(CFLAGS) -c ../src/audio/SDL_wave.c -o SDL_wave.o

SDL_diskaudio.o: ../src/audio/disk/SDL_diskaudio.c
	$(CC) $(CFLAGS) -c ../src/audio/disk/SDL_diskaudio.c -o SDL_diskaudio.o

SDL_dmediaaudio.o: ../src/audio/dmedia/SDL_dmediaaudio.c
	$(CC) $(CFLAGS) -c ../src/audio/dmedia/SDL_dmediaaudio.c -o SDL_dmediaaudio.o

SDL_dummyaudio.o: ../src/audio/dummy/SDL_dummyaudio.c
	$(CC) $(CFLAGS) -c ../src/audio/dummy/SDL_dummyaudio.c -o SDL_dummyaudio.o

SDL_poll.o: ../src/core/unix/SDL_poll.c
	$(CC) $(CFLAGS) -c ../src/core/unix/SDL_poll.c -o SDL_poll.o

SDL_cpuinfo_irix.o: ../src/cpuinfo/SDL_cpuinfo_irix.c
	$(CC) $(CFLAGS) -c ../src/cpuinfo/SDL_cpuinfo_irix.c -o SDL_cpuinfo_irix.o

SDL_dynapi.o: ../src/dynapi/SDL_dynapi.c
	$(CC) $(CFLAGS) -c ../src/dynapi/SDL_dynapi.c -o SDL_dynapi.o

SDL_clipboardevents.o: ../src/events/SDL_clipboardevents.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_clipboardevents.c -o SDL_clipboardevents.o

SDL_displayevents.o: ../src/events/SDL_displayevents.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_displayevents.c -o SDL_displayevents.o

SDL_dropevents.o: ../src/events/SDL_dropevents.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_dropevents.c -o SDL_dropevents.o

SDL_events.o: ../src/events/SDL_events.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_events.c -o SDL_events.o

SDL_gesture.o: ../src/events/SDL_gesture.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_gesture.c -o SDL_gesture.o

SDL_keyboard.o: ../src/events/SDL_keyboard.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_keyboard.c -o SDL_keyboard.o

SDL_mouse.o: ../src/events/SDL_mouse.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_mouse.c -o SDL_mouse.o

SDL_quit.o: ../src/events/SDL_quit.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_quit.c -o SDL_quit.o

SDL_touch.o: ../src/events/SDL_touch.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_touch.c -o SDL_touch.o

SDL_windowevents.o: ../src/events/SDL_windowevents.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_windowevents.c -o SDL_windowevents.o

SDL_keysym_to_scancode.o: ../src/events/SDL_keysym_to_scancode.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_keysym_to_scancode.c -o SDL_keysym_to_scancode.o

SDL_scancode_tables.o: ../src/events/SDL_scancode_tables.c
	$(CC) $(CFLAGS) -c ../src/events/SDL_scancode_tables.c -o SDL_scancode_tables.o

imKStoUCS.o: ../src/events/imKStoUCS.c
	$(CC) $(CFLAGS) -c ../src/events/imKStoUCS.c -o imKStoUCS.o

SDL_rwops.o: ../src/file/SDL_rwops.c
	$(CC) $(CFLAGS) -c ../src/file/SDL_rwops.c -o SDL_rwops.o

SDL_sysfilesystem.o: ../src/filesystem/unix/SDL_sysfilesystem.c
	$(CC) $(CFLAGS) -c ../src/filesystem/unix/SDL_sysfilesystem.c -o SDL_sysfilesystem.o

SDL_haptic.o: ../src/haptic/SDL_haptic.c
	$(CC) $(CFLAGS) -c ../src/haptic/SDL_haptic.c -o SDL_haptic.o

SDL_syshaptic.o: ../src/haptic/dummy/SDL_syshaptic.c
	$(CC) $(CFLAGS) -c ../src/haptic/dummy/SDL_syshaptic.c -o SDL_syshaptic.o

SDL_hidapi.o: ../src/hidapi/SDL_hidapi.c
	$(CC) $(CFLAGS) -c ../src/hidapi/SDL_hidapi.c -o SDL_hidapi.o

SDL_gamecontroller.o: ../src/joystick/SDL_gamecontroller.c
	$(CC) $(CFLAGS) -c ../src/joystick/SDL_gamecontroller.c -o SDL_gamecontroller.o

SDL_joystick.o: ../src/joystick/SDL_joystick.c
	$(CC) $(CFLAGS) -c ../src/joystick/SDL_joystick.c -o SDL_joystick.o

SDL_steam_virtual_gamepad.o: ../src/joystick/SDL_steam_virtual_gamepad.c
	$(CC) $(CFLAGS) -c ../src/joystick/SDL_steam_virtual_gamepad.c -o SDL_steam_virtual_gamepad.o

controller_type.o: ../src/joystick/controller_type.c
	$(CC) $(CFLAGS) -c ../src/joystick/controller_type.c -o controller_type.o

SDL_sysjoystick.o: ../src/joystick/dummy/SDL_sysjoystick.c
	$(CC) $(CFLAGS) -c ../src/joystick/dummy/SDL_sysjoystick.c -o SDL_sysjoystick.o

SDL_sysloadso.o: ../src/loadso/dlopen/SDL_sysloadso.c
	$(CC) $(CFLAGS) -c ../src/loadso/dlopen/SDL_sysloadso.c -o SDL_sysloadso.o

SDL_locale.o: ../src/locale/SDL_locale.c
	$(CC) $(CFLAGS) -c ../src/locale/SDL_locale.c -o SDL_locale.o

SDL_syslocale.o: ../src/locale/unix/SDL_syslocale.c
	$(CC) $(CFLAGS) -c ../src/locale/unix/SDL_syslocale.c -o SDL_syslocale.o

SDL_url.o: ../src/misc/SDL_url.c
	$(CC) $(CFLAGS) -c ../src/misc/SDL_url.c -o SDL_url.o

SDL_sysurl.o: ../src/misc/unix/SDL_sysurl.c
	$(CC) $(CFLAGS) -c ../src/misc/unix/SDL_sysurl.c -o SDL_sysurl.o

SDL_power.o: ../src/power/SDL_power.c
	$(CC) $(CFLAGS) -c ../src/power/SDL_power.c -o SDL_power.o

SDL_render.o: ../src/render/SDL_render.c
	$(CC) $(CFLAGS) -c ../src/render/SDL_render.c -o SDL_render.o

SDL_yuv_sw.o: ../src/render/SDL_yuv_sw.c
	$(CC) $(CFLAGS) -c ../src/render/SDL_yuv_sw.c -o SDL_yuv_sw.o

SDL_render_gl.o: ../src/render/opengl/SDL_render_gl.c
	$(CC) $(CFLAGS) -c ../src/render/opengl/SDL_render_gl.c -o SDL_render_gl.o

SDL_shaders_gl.o: ../src/render/opengl/SDL_shaders_gl.c
	$(CC) $(CFLAGS) -c ../src/render/opengl/SDL_shaders_gl.c -o SDL_shaders_gl.o

SDL_blendfillrect.o: ../src/render/software/SDL_blendfillrect.c
	$(CC) $(CFLAGS) -c ../src/render/software/SDL_blendfillrect.c -o SDL_blendfillrect.o

SDL_blendline.o: ../src/render/software/SDL_blendline.c
	$(CC) $(CFLAGS) -c ../src/render/software/SDL_blendline.c -o SDL_blendline.o

SDL_blendpoint.o: ../src/render/software/SDL_blendpoint.c
	$(CC) $(CFLAGS) -c ../src/render/software/SDL_blendpoint.c -o SDL_blendpoint.o

SDL_drawline.o: ../src/render/software/SDL_drawline.c
	$(CC) $(CFLAGS) -c ../src/render/software/SDL_drawline.c -o SDL_drawline.o

SDL_drawpoint.o: ../src/render/software/SDL_drawpoint.c
	$(CC) $(CFLAGS) -c ../src/render/software/SDL_drawpoint.c -o SDL_drawpoint.o

SDL_render_sw.o: ../src/render/software/SDL_render_sw.c
	$(CC) $(CFLAGS) -c ../src/render/software/SDL_render_sw.c -o SDL_render_sw.o

SDL_rotate.o: ../src/render/software/SDL_rotate.c
	$(CC) $(CFLAGS) -c ../src/render/software/SDL_rotate.c -o SDL_rotate.o

SDL_triangle.o: ../src/render/software/SDL_triangle.c
	$(CC) $(CFLAGS) -c ../src/render/software/SDL_triangle.c -o SDL_triangle.o

SDL_sensor.o: ../src/sensor/SDL_sensor.c
	$(CC) $(CFLAGS) -c ../src/sensor/SDL_sensor.c -o SDL_sensor.o

SDL_dummysensor.o: ../src/sensor/dummy/SDL_dummysensor.c
	$(CC) $(CFLAGS) -c ../src/sensor/dummy/SDL_dummysensor.c -o SDL_dummysensor.o

SDL_crc16.o: ../src/stdlib/SDL_crc16.c
	$(CC) $(CFLAGS) -c ../src/stdlib/SDL_crc16.c -o SDL_crc16.o

SDL_crc32.o: ../src/stdlib/SDL_crc32.c
	$(CC) $(CFLAGS) -c ../src/stdlib/SDL_crc32.c -o SDL_crc32.o

SDL_getenv.o: ../src/stdlib/SDL_getenv.c
	$(CC) $(CFLAGS) -c ../src/stdlib/SDL_getenv.c -o SDL_getenv.o

SDL_iconv.o: ../src/stdlib/SDL_iconv.c
	$(CC) $(CFLAGS) -c ../src/stdlib/SDL_iconv.c -o SDL_iconv.o

SDL_malloc.o: ../src/stdlib/SDL_malloc.c
	$(CC) $(CFLAGS) -c ../src/stdlib/SDL_malloc.c -o SDL_malloc.o

SDL_qsort.o: ../src/stdlib/SDL_qsort.c
	$(CC) $(CFLAGS) -c ../src/stdlib/SDL_qsort.c -o SDL_qsort.o

SDL_stdlib.o: ../src/stdlib/SDL_stdlib.c
	$(CC) $(CFLAGS) -c ../src/stdlib/SDL_stdlib.c -o SDL_stdlib.o

SDL_string.o: ../src/stdlib/SDL_string.c
	$(CC) $(CFLAGS) -c ../src/stdlib/SDL_string.c -o SDL_string.o

SDL_strtokr.o: ../src/stdlib/SDL_strtokr.c
	$(CC) $(CFLAGS) -c ../src/stdlib/SDL_strtokr.c -o SDL_strtokr.o

SDL_thread.o: ../src/thread/SDL_thread.c
	$(CC) $(CFLAGS) -c ../src/thread/SDL_thread.c -o SDL_thread.o

SDL_syscond.o: ../src/thread/pthread/SDL_syscond.c
	$(CC) $(CFLAGS) -c ../src/thread/pthread/SDL_syscond.c -o SDL_syscond.o

SDL_sysmutex.o: ../src/thread/pthread/SDL_sysmutex.c
	$(CC) $(CFLAGS) -c ../src/thread/pthread/SDL_sysmutex.c -o SDL_sysmutex.o

SDL_syssem.o: ../src/thread/pthread/SDL_syssem.c
	$(CC) $(CFLAGS) -c ../src/thread/pthread/SDL_syssem.c -o SDL_syssem.o

SDL_systhread.o: ../src/thread/pthread/SDL_systhread.c
	$(CC) $(CFLAGS) -c ../src/thread/pthread/SDL_systhread.c -o SDL_systhread.o

SDL_systls.o: ../src/thread/pthread/SDL_systls.c
	$(CC) $(CFLAGS) -c ../src/thread/pthread/SDL_systls.c -o SDL_systls.o

SDL_timer.o: ../src/timer/SDL_timer.c
	$(CC) $(CFLAGS) -c ../src/timer/SDL_timer.c -o SDL_timer.o

SDL_systimer.o: ../src/timer/irix/SDL_systimer.c
	$(CC) $(CFLAGS) -c ../src/timer/irix/SDL_systimer.c -o SDL_systimer.o

SDL_RLEaccel.o: ../src/video/SDL_RLEaccel.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_RLEaccel.c -o SDL_RLEaccel.o

SDL_blit.o: ../src/video/SDL_blit.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_blit.c -o SDL_blit.o

SDL_blit_0.o: ../src/video/SDL_blit_0.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_blit_0.c -o SDL_blit_0.o

SDL_blit_1.o: ../src/video/SDL_blit_1.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_blit_1.c -o SDL_blit_1.o

SDL_blit_A.o: ../src/video/SDL_blit_A.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_blit_A.c -o SDL_blit_A.o

SDL_blit_N.o: ../src/video/SDL_blit_N.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_blit_N.c -o SDL_blit_N.o

SDL_blit_auto.o: ../src/video/SDL_blit_auto.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_blit_auto.c -o SDL_blit_auto.o

SDL_blit_copy.o: ../src/video/SDL_blit_copy.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_blit_copy.c -o SDL_blit_copy.o

SDL_blit_slow.o: ../src/video/SDL_blit_slow.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_blit_slow.c -o SDL_blit_slow.o

SDL_bmp.o: ../src/video/SDL_bmp.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_bmp.c -o SDL_bmp.o

SDL_clipboard.o: ../src/video/SDL_clipboard.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_clipboard.c -o SDL_clipboard.o

SDL_fillrect.o: ../src/video/SDL_fillrect.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_fillrect.c -o SDL_fillrect.o

SDL_pixels.o: ../src/video/SDL_pixels.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_pixels.c -o SDL_pixels.o

SDL_rect.o: ../src/video/SDL_rect.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_rect.c -o SDL_rect.o

SDL_shape.o: ../src/video/SDL_shape.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_shape.c -o SDL_shape.o

SDL_stretch.o: ../src/video/SDL_stretch.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_stretch.c -o SDL_stretch.o

SDL_surface.o: ../src/video/SDL_surface.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_surface.c -o SDL_surface.o

SDL_video.o: ../src/video/SDL_video.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_video.c -o SDL_video.o

SDL_yuv.o: ../src/video/SDL_yuv.c
	$(CC) $(CFLAGS) -c ../src/video/SDL_yuv.c -o SDL_yuv.o

yuv_rgb_std.o: ../src/video/yuv2rgb/yuv_rgb_std.c
	$(CC) $(CFLAGS) -c ../src/video/yuv2rgb/yuv_rgb_std.c -o yuv_rgb_std.o

SDL_nullevents.o: ../src/video/dummy/SDL_nullevents.c
	$(CC) $(CFLAGS) -c ../src/video/dummy/SDL_nullevents.c -o SDL_nullevents.o

SDL_nullframebuffer.o: ../src/video/dummy/SDL_nullframebuffer.c
	$(CC) $(CFLAGS) -c ../src/video/dummy/SDL_nullframebuffer.c -o SDL_nullframebuffer.o

SDL_nullvideo.o: ../src/video/dummy/SDL_nullvideo.c
	$(CC) $(CFLAGS) -c ../src/video/dummy/SDL_nullvideo.c -o SDL_nullvideo.o

SDL_x11clipboard.o: ../src/video/x11/SDL_x11clipboard.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11clipboard.c -o SDL_x11clipboard.o

SDL_x11dyn.o: ../src/video/x11/SDL_x11dyn.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11dyn.c -o SDL_x11dyn.o

SDL_x11events.o: ../src/video/x11/SDL_x11events.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11events.c -o SDL_x11events.o

SDL_x11framebuffer.o: ../src/video/x11/SDL_x11framebuffer.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11framebuffer.c -o SDL_x11framebuffer.o

SDL_x11keyboard.o: ../src/video/x11/SDL_x11keyboard.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11keyboard.c -o SDL_x11keyboard.o

SDL_x11messagebox.o: ../src/video/x11/SDL_x11messagebox.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11messagebox.c -o SDL_x11messagebox.o

SDL_x11modes.o: ../src/video/x11/SDL_x11modes.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11modes.c -o SDL_x11modes.o

SDL_x11mouse.o: ../src/video/x11/SDL_x11mouse.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11mouse.c -o SDL_x11mouse.o

SDL_x11opengl.o: ../src/video/x11/SDL_x11opengl.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11opengl.c -o SDL_x11opengl.o

SDL_x11shape.o: ../src/video/x11/SDL_x11shape.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11shape.c -o SDL_x11shape.o

SDL_x11touch.o: ../src/video/x11/SDL_x11touch.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11touch.c -o SDL_x11touch.o

SDL_x11video.o: ../src/video/x11/SDL_x11video.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11video.c -o SDL_x11video.o

SDL_x11window.o: ../src/video/x11/SDL_x11window.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11window.c -o SDL_x11window.o

SDL_x11xfixes.o: ../src/video/x11/SDL_x11xfixes.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11xfixes.c -o SDL_x11xfixes.o

SDL_x11xinput2.o: ../src/video/x11/SDL_x11xinput2.c
	$(CC) $(CFLAGS) -c ../src/video/x11/SDL_x11xinput2.c -o SDL_x11xinput2.o

