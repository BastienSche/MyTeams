#pragma once
#ifndef _MICROPHONE_HPP_
#define _MICROPHONE_HPP_

#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <iostream>
#include <deque>
#include <thread>
#include "PortAudio.hpp"
#include "Opus.hpp"

class Microphone
{
    public:
        Microphone()
        {
            if ((_err = PortAudio::Initialize()) != paNoError)
            {
                std::cout << "[PORT-AUDIO] Initialize failed: " << PortAudio::GetErrorText(_err) << std::endl;
                return;
            }

            if ((_err = PortAudio::OpenDefaultStream(&_stream, NUM_CHANNELS, NUM_CHANNELS, paInt16, SAMPLE_RATE, FRAMES_PER_BUFFER, NULL, NULL)) != paNoError) {
                std::cout << "[PORT-AUDIO] OpenStream failed: " << PortAudio::GetErrorText(_err) << std::endl;
                return;
            }
            _encoder = Opus::EncoderCreate(SAMPLE_RATE, NUM_CHANNELS, OPUS_APPLICATION_AUDIO, &_opusErr);
            if (_opusErr != OPUS_OK) {
                  std::cout << "Opus EncoderCreate failed: " << _opusErr << std::endl;
                  return;
            }

            _decoder = Opus::DecoderCreate(SAMPLE_RATE, NUM_CHANNELS, &_opusErr);
            StartRecord();
        }

        ~Microphone()
        {
            PortAudio::Terminate();
        }

        void StartRecord()
        {  
            if ((_err = PortAudio::StartStream(_stream)) != paNoError) {
                std::cout << "[PORT-AUDIO] StartStream failed: " << PortAudio::GetErrorText(_err) << std::endl;
                return;
            }
            std::cout << "[PORT-AUDIO] Record started !" << std::endl;
        }

        BabelProtocol::Paquet EncodeStreamPaquet()
        {
            std::vector<unsigned char> captured(1024);
            std::vector<unsigned char> encoded(1024);

            BabelProtocol::Paquet paquet = {};
            paquet.header = {};
            paquet.header.cmd = 200;
        
            if ((_err = PortAudio::ReadStream(_stream, captured.data(), FRAMES_PER_BUFFER)) != paNoError) {
                std::cout << "[PORT-AUDIO] ReadStream failed: " << PortAudio::GetErrorText(_err) << std::endl;
            }

            if ((paquet.header.arg_size = Opus::Encode(_encoder, reinterpret_cast<opus_int16 const*>(captured.data()), 480, encoded.data(), encoded.size())) < 0) {
                std::cout << "Opus Encode failed: " << _opusErr << std::endl;
            }

            memcpy(paquet.body, encoded.data(), 1024);
            
            return paquet;
        }

        void PlayEncodedStream(unsigned char *encoded, opus_int32 enc_bytes)
        {
            opus_int32 dec_bytes;

            if ((dec_bytes = Opus::Decode(_decoder, encoded, enc_bytes, reinterpret_cast<opus_int16*>(encoded), 480, 0)) < 0) {
                std::cout << "Opus Decode failed: " << _opusErr << std::endl;
                return;
            }

            if ((_err = PortAudio::WriteStream(_stream, encoded, FRAMES_PER_BUFFER)) != paNoError) {
                std::cout << "[PORT-AUDIO] WriteStream failed: " << PortAudio::GetErrorText(_err) << std::endl;
                return;
            }
        }

        void StopRecord() {
            if ((_err = PortAudio::StopStream(_stream)) != paNoError) {
                std::cout << "[PORT-AUDIO] StopStream failed: " << PortAudio::GetErrorText(_err) << std::endl;
                return;
            }
        }

    private:
        PaStream *_stream = nullptr;
        PaError _err;
        int _opusErr;
        OpusEncoder *_encoder;
        OpusDecoder *_decoder;
};

#endif
