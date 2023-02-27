#ifndef _OPUS_HPP_
#define _OPUS_HPP_

#include "../opus.h"

class Opus
{
    public:
        static OpusEncoder *EncoderCreate(opus_int32 Fs, int channels, int application, int *error)
        {
            return opus_encoder_create(Fs, channels, application, error);
        }

        static OpusDecoder *DecoderCreate(opus_int32 Fs, int channels, int *error)
        {
            return opus_decoder_create(Fs, channels, error);
        }

        static opus_int32 Encode(OpusEncoder *st, const opus_int16 *pcm, int frame_size, unsigned char *data, opus_int32 max_data_bytes)
        {
            return opus_encode(st, pcm, frame_size, data, max_data_bytes);
        }

        static int Decode(OpusDecoder *st, const unsigned char *data, opus_int32 len, opus_int16 *pcm, int frame_size, int decode_fec)
        {
            return opus_decode(st, data, len, pcm, frame_size, decode_fec);
        }
};

#endif