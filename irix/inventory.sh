#!/bin/bash

OBJS_MK="objs.mk"

# Explicit list of source files for IRIX
SRCS="
src/SDL.c
src/SDL_assert.c
src/SDL_dataqueue.c
src/SDL_error.c
src/SDL_guid.c
src/SDL_hints.c
src/SDL_list.c
src/SDL_log.c
src/SDL_utils.c
src/atomic/SDL_atomic.c
src/atomic/SDL_spinlock.c
src/audio/SDL_audio.c
src/audio/SDL_audiocvt.c
src/audio/SDL_audiodev.c
src/audio/SDL_audiotype.c
src/audio/SDL_audiotypecvt.c
src/audio/SDL_mixer.c
src/audio/SDL_wave.c
src/audio/disk/SDL_diskaudio.c
src/audio/dmedia/SDL_dmediaaudio.c
src/audio/dummy/SDL_dummyaudio.c
src/core/unix/SDL_poll.c
src/cpuinfo/SDL_cpuinfo_irix.c
src/dynapi/SDL_dynapi.c
src/events/SDL_clipboardevents.c
src/events/SDL_displayevents.c
src/events/SDL_dropevents.c
src/events/SDL_events.c
src/events/SDL_gesture.c
src/events/SDL_keyboard.c
src/events/SDL_mouse.c
src/events/SDL_quit.c
src/events/SDL_touch.c
src/events/SDL_windowevents.c
src/events/SDL_keysym_to_scancode.c
src/events/SDL_scancode_tables.c
src/events/imKStoUCS.c
src/file/SDL_rwops.c
src/filesystem/unix/SDL_sysfilesystem.c
src/haptic/SDL_haptic.c
src/haptic/dummy/SDL_syshaptic.c
src/hidapi/SDL_hidapi.c
src/joystick/SDL_gamecontroller.c
src/joystick/SDL_joystick.c
src/joystick/SDL_steam_virtual_gamepad.c
src/joystick/controller_type.c
src/joystick/dummy/SDL_sysjoystick.c
src/loadso/dlopen/SDL_sysloadso.c
src/locale/SDL_locale.c
src/locale/unix/SDL_syslocale.c
src/misc/SDL_url.c
src/misc/unix/SDL_sysurl.c
src/power/SDL_power.c
src/power/dummy/SDL_syspower.c
src/render/SDL_render.c
src/render/SDL_yuv_sw.c
src/render/opengl/SDL_render_gl.c
src/render/opengl/SDL_shaders_gl.c
src/render/software/SDL_blendfillrect.c
src/render/software/SDL_blendline.c
src/render/software/SDL_blendpoint.c
src/render/software/SDL_drawline.c
src/render/software/SDL_drawpoint.c
src/render/software/SDL_render_sw.c
src/render/software/SDL_rotate.c
src/render/software/SDL_triangle.c
src/sensor/SDL_sensor.c
src/sensor/dummy/SDL_dummysensor.c
src/stdlib/SDL_crc16.c
src/stdlib/SDL_crc32.c
src/stdlib/SDL_getenv.c
src/stdlib/SDL_iconv.c
src/stdlib/SDL_malloc.c
src/stdlib/SDL_qsort.c
src/stdlib/SDL_stdlib.c
src/stdlib/SDL_string.c
src/stdlib/SDL_strtokr.c
src/thread/SDL_thread.c
src/thread/pthread/SDL_syscond.c
src/thread/pthread/SDL_sysmutex.c
src/thread/pthread/SDL_syssem.c
src/thread/pthread/SDL_systhread.c
src/thread/pthread/SDL_systls.c
src/timer/SDL_timer.c
src/timer/irix/SDL_systimer.c
src/video/SDL_RLEaccel.c
src/video/SDL_blit.c
src/video/SDL_blit_0.c
src/video/SDL_blit_1.c
src/video/SDL_blit_A.c
src/video/SDL_blit_N.c
src/video/SDL_blit_auto.c
src/video/SDL_blit_copy.c
src/video/SDL_blit_slow.c
src/video/SDL_bmp.c
src/video/SDL_clipboard.c
src/video/SDL_fillrect.c
src/video/SDL_pixels.c
src/video/SDL_rect.c
src/video/SDL_shape.c
src/video/SDL_stretch.c
src/video/SDL_surface.c
src/video/SDL_video.c
src/video/SDL_yuv.c
src/video/yuv2rgb/yuv_rgb_std.c
src/video/dummy/SDL_nullevents.c
src/video/dummy/SDL_nullframebuffer.c
src/video/dummy/SDL_nullvideo.c
src/video/x11/SDL_x11clipboard.c
src/video/x11/SDL_x11dyn.c
src/video/x11/SDL_x11events.c
src/video/x11/SDL_x11framebuffer.c
src/video/x11/SDL_x11keyboard.c
src/video/x11/SDL_x11messagebox.c
src/video/x11/SDL_x11modes.c
src/video/x11/SDL_x11mouse.c
src/video/x11/SDL_x11opengl.c
src/video/x11/SDL_x11shape.c
src/video/x11/SDL_x11touch.c
src/video/x11/SDL_x11video.c
src/video/x11/SDL_x11window.c
src/video/x11/SDL_x11xfixes.c
src/video/x11/SDL_x11xinput2.c
"

echo "OBJS = \\" > "$OBJS_MK"

objects=()
for src in $SRCS; do
    if [ -f "../$src" ]; then
        objects+=("$(basename "$src" .c).o")
    fi
done

last_idx=$((${#objects[@]} - 1))
for i in "${!objects[@]}"; do
    if [ "$i" -eq "$last_idx" ]; then
        echo "${objects[$i]}" >> "$OBJS_MK"
    else
        echo "${objects[$i]} \\" >> "$OBJS_MK"
    fi
done

echo "" >> "$OBJS_MK"
echo "" >> "$OBJS_MK"

for src in $SRCS; do
    if [ -f ../"$src" ]; then
        obj="$(basename "$src" .c).o"
        echo "$obj: ../$src" >> "$OBJS_MK"
        echo "	\$(CC) \$(CFLAGS) -c ../$src -o $obj" >> "$OBJS_MK"
        echo "" >> "$OBJS_MK"
    fi
done
