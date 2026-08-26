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

#if SDL_AUDIO_DRIVER_DMEDIA

#include "SDL_config.h"

/* Allow access to a raw mixing buffer (For IRIX 6.5 and higher) */

#include "SDL_timer.h"
#include "SDL_audio.h"
#include "../SDL_audiodev_c.h"
#include "../SDL_audio_c.h"
#include "SDL_dmediaaudio.h"

/* This code is for IRIX 6.5+ using the dmedia audio library */

/* Audio driver functions */
static int DMEDIA_OpenDevice(_THIS, const char *devname);
static void DMEDIA_WaitDevice(_THIS);
static void DMEDIA_PlayDevice(_THIS);
static Uint8 *DMEDIA_GetDeviceBuf(_THIS);
static void DMEDIA_CloseDevice(_THIS);

static void DMEDIA_WaitDevice(_THIS)
{
    Sint32 timeleft;

    timeleft = this->spec.samples - alGetFillable(audio_port);
    if (timeleft > 0) {
        timeleft /= (this->spec.freq / 1000);
        SDL_Delay((Uint32)timeleft);
    }
}

static void DMEDIA_PlayDevice(_THIS)
{
    /* Write the audio data out */
    if (alWriteFrames(audio_port, mixbuf, this->spec.samples) < 0) {
        /* Assume fatal error, for now */
        SDL_OpenedAudioDeviceDisconnected(this);
    }
}

static Uint8 *DMEDIA_GetDeviceBuf(_THIS)
{
    return mixbuf;
}

static void DMEDIA_CloseDevice(_THIS)
{
    if (mixbuf != NULL) {
        SDL_free(mixbuf);
        mixbuf = NULL;
    }
    if (audio_port != NULL) {
        alClosePort(audio_port);
        audio_port = NULL;
    }
}

static int DMEDIA_GetDefaultAudioInfo(char **name, SDL_AudioSpec *spec, int iscapture)
{
    char devname[128];
    ALpv pv[2];

    if (iscapture) {
        return SDL_SetError("No capture support");
    }

    /* Query actual hardware capabilities */
    SDL_zerop(spec);

    pv[0].param = AL_RATE;
    pv[1].param = AL_NAME;
    pv[1].value.ptr = devname;
    pv[1].sizeIn = sizeof(devname);

    if (alGetParams(AL_DEFAULT_OUTPUT, pv, 2) >= 0) {
        spec->freq = (int) alFixedToDouble(pv[0].value.ll);
        if (name != NULL) {
            *name = SDL_strdup((pv[1].sizeOut > 0) ? devname : DEFAULT_OUTPUT_DEVNAME);
        }
    } else {
        if (name != NULL) {
            *name = SDL_strdup(DEFAULT_OUTPUT_DEVNAME);
        }
    }

    /* Set defaults if query failed */
    if (spec->freq == 0) {
        spec->freq = 44100;
    }
    
    if (name != NULL && *name == NULL) {
        return SDL_OutOfMemory();
    }

    spec->format = AUDIO_S16SYS;
    spec->channels = 2;
    spec->samples = 512;

    return 0;
}

static void DMEDIA_DetectDevices(void)
{
    SDL_AudioSpec spec;
    char *name = NULL;
    if (DMEDIA_GetDefaultAudioInfo(&name, &spec, 0) == 0) {
        SDL_AddAudioDevice(SDL_FALSE, name, &spec, (void *)((size_t)0x1));
        SDL_free(name);
    }
}

static int DMEDIA_OpenDevice(_THIS, const char *devname)
{
    int iscapture = this->iscapture;
    SDL_AudioFormat test_format = SDL_FirstAudioFormat(this->spec.format);
    long width = 0;
    long fmt = 0;
    int valid = 0;

    /* We don't care what the devname is...we'll try to open anything. */
    /*  ...but default to first name in the list... */
    if (devname == NULL) {
        devname = SDL_GetAudioDeviceName(0, iscapture);
        if (devname == NULL) {
            return SDL_SetError("No such audio device");
        }
    }

    /* Initialize all variables that we clean on shutdown */
    this->hidden = (struct SDL_PrivateAudioData *)
        SDL_malloc((sizeof *this->hidden));
    if (this->hidden == NULL) {
        return SDL_OutOfMemory();
    }
    SDL_zerop(this->hidden);

    {
        ALpv audio_param;
        audio_param.param = AL_RATE;
        audio_param.value.ll = alDoubleToFixed((double) this->spec.freq);
        if (alSetParams(AL_DEFAULT_OUTPUT, &audio_param, 1) < 0) {
            return SDL_SetError("alSetParams failed: %s", alGetErrorString(oserror()));
        }
    }

    while ((!valid) && (test_format)) {
        valid = 1;
        this->spec.format = test_format;

        switch (test_format) {
        case AUDIO_S8:
            width = AL_SAMPLE_8;
            fmt = AL_SAMPFMT_TWOSCOMP;
            break;

        case AUDIO_S16SYS:
            width = AL_SAMPLE_16;
            fmt = AL_SAMPFMT_TWOSCOMP;
            break;

        default:
            valid = 0;
            test_format = SDL_NextAudioFormat();
            break;
        }

        if (valid) {
            ALconfig audio_config = alNewConfig();
            valid = 0;
            if (audio_config) {
                if (alSetChannels(audio_config, this->spec.channels) < 0) {
                    if (this->spec.channels > 2) {  /* can't handle > stereo? */
                        this->spec.channels = 2;  /* try again below. */
                    }
                }

                if ((alSetSampFmt(audio_config, fmt) >= 0) &&
                    ((!width) || (alSetWidth(audio_config, width) >= 0)) &&
                    (alSetQueueSize(audio_config, this->spec.samples * 2) >= 0) &&
                    (alSetChannels(audio_config, this->spec.channels) >= 0)) {

                    audio_port = alOpenPort("SDL audio", "w", audio_config);
                    if (audio_port == NULL) {
                        /* docs say AL_BAD_CHANNELS happens here, too. */
                        int err = oserror();
                        if (err == AL_BAD_CHANNELS) {
                            this->spec.channels = 2;
                            alSetChannels(audio_config, this->spec.channels);
                            audio_port = alOpenPort("SDL audio", "w", audio_config);
                        }
                    }

                    if (audio_port != NULL) {
                        valid = 1;
                    }
                }

                alFreeConfig(audio_config);
            }
        }
    }

    if (!valid) {
        SDL_SetError("Unsupported audio format");
        return -1;
    }

    /* Update the fragment size as size in bytes */
    SDL_CalculateAudioSpec(&this->spec);

    /* Allocate mixing buffer */
    mixbuf = (Uint8 *) SDL_malloc(this->spec.size);
    if (mixbuf == NULL) {
        SDL_OutOfMemory();
        return -1;
    }
    SDL_memset(mixbuf, this->spec.silence, this->spec.size);

    /* We're ready to rock and roll. :-) */
    return 0;
}

static int
DMEDIA_init(SDL_AudioDriverImpl * impl)
{
    /* Set the function pointers */
    impl->OpenDevice = DMEDIA_OpenDevice;
    impl->WaitDevice = DMEDIA_WaitDevice;
    impl->PlayDevice = DMEDIA_PlayDevice;
    impl->GetDeviceBuf = DMEDIA_GetDeviceBuf;
    impl->CloseDevice = DMEDIA_CloseDevice;
    impl->GetDefaultAudioInfo = DMEDIA_GetDefaultAudioInfo;
    impl->DetectDevices = DMEDIA_DetectDevices;

    impl->OnlyHasDefaultOutputDevice = SDL_TRUE;
    impl->HasCaptureSupport = SDL_FALSE;

    return 1;
}

AudioBootStrap DMEDIA_bootstrap = {
    "dmedia", "IRIX DMedia audio", DMEDIA_init, SDL_FALSE
};

#endif /* SDL_AUDIO_DRIVER_DMEDIA */
