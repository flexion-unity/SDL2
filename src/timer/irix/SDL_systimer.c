/*
  Simple DirectMedia Layer
  Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/
#include "../../SDL_internal.h"

#if SDL_TIMER_IRIX

#include <stdio.h>
#include <sys/time.h>
#include <unistd.h>
#include <errno.h>
#include <time.h>
#include <sys/syssgi.h>

#include "SDL_timer.h"
#include "../SDL_timer_c.h"

static SDL_bool ticks_started = SDL_FALSE;
static SDL_bool has_cycle_counter = SDL_FALSE;

/* SGI cycle counter specifics */
static int sgi_counter_bits = 0;
static Uint64 sgi_start_tick_nsec = 0;
static Uint64 sgi_total_ticks_nsec = 0; /* 64-bit accumulator for 32-bit counters */
static Uint64 sgi_cycle_wrap_nsec = 0;
static Uint64 sgi_last_cycle_nsec = 0;
static struct timespec sgi_last_sys_ts;

/* Fallback using clock_gettime */
static struct timespec start_ts;

void
SDL_TicksInit(void)
{
    struct timespec res;

    if (ticks_started) {
        return;
    }
    ticks_started = SDL_TRUE;

    if (clock_getres(CLOCK_SGI_CYCLE, &res) == 0) {
        struct timespec now;
        has_cycle_counter = SDL_TRUE;

        sgi_counter_bits = syssgi(SGI_CYCLECNTR_SIZE);

        clock_gettime(CLOCK_SGI_CYCLE, &now);
        clock_gettime(CLOCK_REALTIME, &sgi_last_sys_ts);

        if (sgi_counter_bits > 0 && sgi_counter_bits < 64) {
            /* The user is concerned about 32-bit rollovers.
               We will use a 64-bit accumulator to track total nanoseconds.
               This assumes that `now.tv_nsec` contains the raw 32-bit counter,
               and that `clock_gettime` returns values in nanoseconds.
               This also assumes this function is called frequently enough to not
               miss more than one wrap, which is about 4.2 seconds for a 1GHz counter.
             */
            Uint64 resolution_nsec = (Uint64)res.tv_sec * 1000000000ULL + res.tv_nsec;
            sgi_cycle_wrap_nsec = (1ULL << sgi_counter_bits) * resolution_nsec;
            sgi_last_cycle_nsec = (Uint64)now.tv_sec * 1000000000ULL + now.tv_nsec;
            sgi_total_ticks_nsec = 0;
        } else {
            /* Assume 64-bit, or that tv_sec helps extend it */
            sgi_start_tick_nsec = (Uint64)now.tv_sec * 1000000000 + now.tv_nsec;
            /* 64-bit counter: we don't need the complex hybrid logic, 
               but we reuse the same variables for simplicity, just treating 
               wrap as impossible/huge. */
            sgi_cycle_wrap_nsec = 0; /* 0 indicates no wrapping handling needed */
            sgi_last_cycle_nsec = (Uint64)now.tv_sec * 1000000000ULL + now.tv_nsec;
            sgi_total_ticks_nsec = 0;
        }
    } else {
        clock_gettime(CLOCK_REALTIME, &start_ts);
    }
}

void
SDL_TicksQuit(void)
{
    ticks_started = SDL_FALSE;
}

static void update_ticks(void)
{
    struct timespec now_cycle_ts;
    struct timespec now_sys_ts;
    Uint64 now_cycle_nsec;
    Uint64 inc_nsec;

    clock_gettime(CLOCK_SGI_CYCLE, &now_cycle_ts);
    clock_gettime(CLOCK_REALTIME, &now_sys_ts);

    now_cycle_nsec = (Uint64)now_cycle_ts.tv_sec * 1000000000ULL + now_cycle_ts.tv_nsec;

    if (sgi_cycle_wrap_nsec > 0) {
        /* Hybrid logic for < 64-bit counters */
        Sint64 delta_sys_nsec = ((Sint64)now_sys_ts.tv_sec - sgi_last_sys_ts.tv_sec) * 1000000000LL +
                                (Sint64)now_sys_ts.tv_nsec - sgi_last_sys_ts.tv_nsec;

        /* If the system clock has advanced by more than half the cycle wrap period,
           we assume we might have missed a wrap (or multiple). In this case, we
           trust the system clock's delta, effectively re-syncing our high-res timer
           to the low-res system timer to handle the long gap. */
        if (delta_sys_nsec > (Sint64)(sgi_cycle_wrap_nsec / 2)) {
            inc_nsec = (Uint64)delta_sys_nsec;
        } else {
            /* Short interval: trust the cycle counter.
               Handle single wrap-around using modulo arithmetic. */
            if (now_cycle_nsec < sgi_last_cycle_nsec) {
                inc_nsec = (now_cycle_nsec + sgi_cycle_wrap_nsec) - sgi_last_cycle_nsec;
            } else {
                inc_nsec = now_cycle_nsec - sgi_last_cycle_nsec;
            }
        }
    } else {
        /* 64-bit counter, just subtract */
        inc_nsec = now_cycle_nsec - sgi_last_cycle_nsec;
    }

    sgi_total_ticks_nsec += inc_nsec;
    sgi_last_cycle_nsec = now_cycle_nsec;
    sgi_last_sys_ts = now_sys_ts;
}

Uint64
SDL_GetTicks64(void)
{
    if (!ticks_started) {
        SDL_TicksInit();
    }

    if (has_cycle_counter) {
        update_ticks();
        return sgi_total_ticks_nsec / 1000000;
    } else {
        struct timespec now;
        clock_gettime(CLOCK_REALTIME, &now);
        return (Uint64)(((Sint64)(now.tv_sec - start_ts.tv_sec) * 1000) + ((now.tv_nsec - start_ts.tv_nsec) / 1000000));
    }
}

Uint64
SDL_GetPerformanceCounter(void)
{
    if (!ticks_started) {
        SDL_TicksInit();
    }

    if (has_cycle_counter) {
        update_ticks();
        return sgi_total_ticks_nsec;
    } else {
        struct timespec now;
        clock_gettime(CLOCK_REALTIME, &now);
        return (Uint64)now.tv_sec * 1000000000 + now.tv_nsec;
    }
}

Uint64
SDL_GetPerformanceFrequency(void)
{
    if (has_cycle_counter) {
        return 1000000000;
    } else {
        return 1000000000;
    }
}

void
SDL_Delay(Uint32 ms)
{
    int was_error;
    struct timespec elapsed, tv;

    /* Set the timeout interval */
    elapsed.tv_sec = ms / 1000;
    elapsed.tv_nsec = (ms % 1000) * 1000000;
    do {
        errno = 0;
        tv.tv_sec = elapsed.tv_sec;
        tv.tv_nsec = elapsed.tv_nsec;
        was_error = nanosleep(&tv, &elapsed);
    } while (was_error && (errno == EINTR));
}

#endif /* SDL_TIMER_IRIX */
