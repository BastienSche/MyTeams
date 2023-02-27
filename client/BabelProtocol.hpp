#pragma once
#ifndef _TCPPROTOCOL_HPP_
#define _TCPPROTOCOL_HPP_

#define ARG_SIZE 128

#define TCP_PORT 8080
#define UDP_PORT 8053

#include <asio.hpp>
#include <asio/ts/buffer.hpp>

#include <vector>
#include <iostream>
#include <memory>
#include <deque>
#include <chrono>

struct BabelProtocol
{
    #pragma pack(push, 1)
    struct PaquetHeader {
        unsigned short cmd;
        unsigned short arg_size;
        unsigned short nb_args;
        unsigned short time;
    };

    struct Paquet {
        PaquetHeader header;
        unsigned char body[1024];
    };

    struct Client {
        std::string uuid;
        std::string userName;
        std::string address;
        int port;
        bool inCall;
    };
    #pragma pack(pop)

    enum Command: unsigned short {
        LOGIN,
        ONLINES,
        CALL_REQUEST,
        CALL_ACCEPT,
        HANG_UP,
        LOGIN_RESPONSE = 100,
        ONLINES_RESPONSE,
        CALL_RESPONSE,
        CALL_RECEIVE,
        CALL_ACCEPT_RESPONSE,
        HANG_UP_RESPONSE,
        UDP_SEND_AUDIO = 200
    };

    struct Request {
        Command cmd;
        std::vector<std::string> args;
    };

    struct Response {
        bool error;
        Command cmd;
        std::vector<std::string> args;
    };

    static Paquet SerializeRequest(Command action, std::vector<std::string> args_str)
    {
        Paquet paquet = {};
        std::vector<const char*> args(args_str.size());
        std::transform(args_str.begin(), args_str.end(), args.begin(),
            [](const std::string& s) { return s.c_str(); }
        );
        unsigned short arg_size = 0;
        for (int i = 0, size = 0; i < args.size(); i++) {
            size = std::strlen(args[i]);
            arg_size = arg_size < size ? size : arg_size;
        }
        paquet.header = { action, arg_size, static_cast<unsigned short>(args.size()), 0};
        for (int i = 0; i < paquet.header.nb_args; i++)
            memcpy(&paquet.body[i*paquet.header.arg_size], args[i], strlen(args[i]));
        return paquet;
    }

    static Paquet SerializeResponse(Response response)
    {
        std::reverse(response.args.begin(), response.args.end());
        response.args.push_back(response.error ? "1" : "0");
        std::reverse(response.args.begin(), response.args.end());
        return SerializeRequest(response.cmd, response.args);
    }

    static Request DeserializeRequest(Paquet paquet)
    {
        Request action = {};
        action.cmd = (Command) paquet.header.cmd;
        for (int i = 0; i < paquet.header.arg_size*paquet.header.nb_args; i += paquet.header.arg_size)
            action.args.push_back(std::string(&paquet.body[i], &paquet.body[i+paquet.header.arg_size]));
        return action;
    }

    static Response DeserializeResponse(Paquet paquet)
    {
        Response response = {};
        response.cmd = (Command) paquet.header.cmd;
        std::string error = std::string(&paquet.body[0], &paquet.body[paquet.header.arg_size]);

        if (std::strlen(error.c_str()) != 1) {
            response.error = true;
            response.args[0] = "Invalide arguments size !";
        } else
            response.error = std::stoi(error.c_str());

        for (int i = paquet.header.arg_size; i < paquet.header.arg_size*paquet.header.nb_args; i += paquet.header.arg_size)
            response.args.push_back(std::string(&paquet.body[i], &paquet.body[i+paquet.header.arg_size]));
        return response;
    }
};

#endif