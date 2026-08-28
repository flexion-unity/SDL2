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
#include "../SDL_internal.h"

#if defined(__sgi)

#include "SDL_cpuinfo.h"
#include <sys/types.h>
#include <sys/sysmp.h>
#include <unistd.h>
#include <invent.h>
#include <stdlib.h>
#include <stdio.h>

static int SDL_CPUCount = 0;

int SDL_GetCPUCount(void)
{
    if (!SDL_CPUCount) {
        SDL_CPUCount = (int)sysconf(_SC_NPROC_ONLN);
        if (SDL_CPUCount <= 0) {
            SDL_CPUCount = 1;
        }
    }
    return SDL_CPUCount;
}

int SDL_GetCPUCacheLineSize(void)
{
    return 128;
}

SDL_bool SDL_HasRDTSC(void) { return SDL_FALSE; }
SDL_bool SDL_HasAltiVec(void) { return SDL_FALSE; }
SDL_bool SDL_HasMMX(void) { return SDL_FALSE; }
SDL_bool SDL_Has3DNow(void) { return SDL_FALSE; }
SDL_bool SDL_HasSSE(void) { return SDL_FALSE; }
SDL_bool SDL_HasSSE2(void) { return SDL_FALSE; }
SDL_bool SDL_HasSSE3(void) { return SDL_FALSE; }
SDL_bool SDL_HasSSE41(void) { return SDL_FALSE; }
SDL_bool SDL_HasSSE42(void) { return SDL_FALSE; }
SDL_bool SDL_HasAVX(void) { return SDL_FALSE; }
SDL_bool SDL_HasAVX2(void) { return SDL_FALSE; }
SDL_bool SDL_HasAVX512F(void) { return SDL_FALSE; }
SDL_bool SDL_HasARMSIMD(void) { return SDL_FALSE; }
SDL_bool SDL_HasNEON(void) { return SDL_FALSE; }
SDL_bool SDL_HasLSX(void) { return SDL_FALSE; }
SDL_bool SDL_HasLASX(void) { return SDL_FALSE; }

int SDL_GetSystemRAM(void)
{
    int ram = 0;
    inventory_t *inv;

    setinvent();
    while ((inv = getinvent()) != NULL) {
        if (inv->inv_class == INV_MEMORY && inv->inv_type == INV_MAIN_MB) {
            ram = (int)inv->inv_state;
            break;
        }
    }
    endinvent();
    return ram;
}

size_t SDL_SIMDGetAlignment(void)
{
    return sizeof(void *);
}

void *SDL_SIMDAlloc(const size_t len)
{
    const size_t alignment = SDL_SIMDGetAlignment();
    const size_t padding = (alignment - (len % alignment)) % alignment;
    Uint8 *retval = NULL;
    Uint8 *ptr;
    size_t to_allocate;

    if (SDL_size_add_overflow(len, alignment + padding + sizeof(void *), &to_allocate)) {
        return NULL;
    }

    ptr = (Uint8 *)SDL_malloc(to_allocate);
    if (ptr) {
        retval = ptr + sizeof(void *);
        retval += alignment - (((size_t)retval) % alignment);
        *(((void **)retval) - 1) = ptr;
    }
    return retval;
}

void *SDL_SIMDRealloc(void *mem, const size_t len)
{
    const size_t alignment = SDL_SIMDGetAlignment();
    const size_t padding = (alignment - (len % alignment)) % alignment;
    Uint8 *retval = (Uint8 *)mem;
    void *oldmem = mem;
    size_t memdiff = 0, ptrdiff;
    Uint8 *ptr;
    size_t to_allocate;

    if (SDL_size_add_overflow(len, alignment + padding + sizeof(void *), &to_allocate)) {
        return NULL;
    }

    if (mem) {
        mem = *(((void **)mem) - 1);
        memdiff = ((size_t)oldmem) - ((size_t)mem);
    }

    ptr = (Uint8 *)SDL_realloc(mem, to_allocate);

    if (!ptr) {
        return NULL;
    }

    retval = ptr + sizeof(void *);
    retval += alignment - (((size_t)retval) % alignment);

    if (mem) {
        ptrdiff = ((size_t)retval) - ((size_t)ptr);
        if (memdiff != ptrdiff) {
            oldmem = (void *)(((uintptr_t)ptr) + memdiff);
            SDL_memmove(retval, oldmem, len);
        }
    }

    *(((void **)retval) - 1) = ptr;
    return retval;
}

void SDL_SIMDFree(void *ptr)
{
    if (ptr) {
        SDL_free(*(((void **)ptr) - 1));
    }
}

#endif /* __sgi */
