#ifndef _PORT_AUDIO_HPP_
#define _PORT_AUDIO_HPP_

#define SAMPLE_RATE (48000)
#define FRAMES_PER_BUFFER (480)
#define NUM_SECONDS (5)
#define NUM_CHANNELS (1)
#define UDP_SEND_AUDIO (200)

#include "../portaudio.h"

class PortAudio
{
    public:
        static PaError Initialize()
        {
            return Pa_Initialize();
        }

        static void Terminate()
        {
            Pa_Terminate();
        }

        static int GetDefaultInputDevice()
        {
            return Pa_GetDefaultInputDevice();
        }

        static const PaDeviceInfo *GetDeviceInfo(int num)
        {
            return Pa_GetDeviceInfo(num);
        }

        // static PaError OpenStream(PaStream **stream, const PaStreamParameters *inputParameters, const PaStreamParameters *outputParameters, double sampleRate, unsigned long framesPerBuffer, PaStreamFlags streamFlags, PaStreamCallback *streamCallback, void *userData)
        // {
        //     return Pa_OpenStream(stream, inputParameters, outputParameters, sampleRate, framesPerBuffer, streamFlags, streamCallback, userData);
        // }

        static PaError OpenDefaultStream(PaStream **stream, int numInputChannels, int numOutputChannels, PaSampleFormat sampleFormat, double sampleRate, unsigned long framesPerBuffer, PaStreamCallback *streamCallback, void *userData)
        {
            return Pa_OpenDefaultStream(stream, numInputChannels, numOutputChannels, sampleFormat, sampleRate, framesPerBuffer, streamCallback, userData);
        }

        // static PaError IsStreamActive(PaStream *stream)
        // {
        //     return Pa_IsStreamActive(stream);
        // }

        static PaError ReadStream(PaStream *stream, void *buffer, unsigned long frames)
        {
            return Pa_ReadStream(stream, buffer, frames);
        }

        static PaError WriteStream(PaStream *stream, void *buffer, unsigned long frames)
        {
            return Pa_WriteStream(stream, buffer, frames);
        }

        static PaError StartStream(PaStream *stream)
        {
            return Pa_StartStream(stream);
        }

        static PaError CloseStream(PaStream *stream)
        {
            return Pa_CloseStream(stream);
        }

        static PaError StopStream(PaStream *stream)
        {
            return Pa_StopStream(stream);
        }

        static const char *GetErrorText(PaError error)
        {
            return Pa_GetErrorText(error);
        }

        static void Sleep(long val)
        {
            Pa_Sleep(val);
        }
};


#endif