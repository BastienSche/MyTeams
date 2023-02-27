#pragma once
#ifndef _UDP_CONNECTION_HPP_
#define _UDP_CONNECTION_HPP_
#include "BabelProtocol.hpp"
#include "./Microphone.hpp"

class UdpConnection: public std::enable_shared_from_this<UdpConnection>
{
    public:
        UdpConnection(asio::io_context &context, asio::ip::udp::socket socket): _context(context), _socket(std::move(socket))
        {
            _prefix = "[UDP-CONNECTION]";
        }

        virtual ~UdpConnection()
        {
            Disconnect();
        }

        bool IsConnected() const
        {
            return _socket.is_open();
        }

        void Disconnect()
        {
            std::cout << _prefix << " Disconnect" << std::endl;
            if (IsConnected())
                asio::post(_context, [this] () { 
                    _socket.close(); 
                });
            if (_threadContext.joinable())
                _threadContext.join();
        }

    public:
        void Listen(std::string host, unsigned int port)
        {
            _endpoint = asio::ip::udp::endpoint(asio::ip::address::from_string(host), port);
            _socket.open(asio::ip::udp::v4());
            _socket.bind(_endpoint);
            std::cout << _prefix << " Listen at " << _endpoint.address().to_string() << ":" << _endpoint.port() << std::endl;
            WaitForData();
            _threadContext = std::thread([this]() {
                _context.run();
            });
        }

        void WaitForData()
        {
            _socket.async_receive_from(asio::buffer(&_tmpPaquet, sizeof(BabelProtocol::Paquet)), _endpoint,
            [this] (std::error_code err, std::size_t length) {
                if (!err) {
                    std::cout << _prefix << " Receive " << length << " bytes" << std::endl;
                    _qPaquetIn.push_back(_tmpPaquet);
                    WaitForData();
                }
            });
        }

        void ConnectTo(std::string host, unsigned int port)
        {
            _endpoint = asio::ip::udp::endpoint(asio::ip::address::from_string(host), port);
            _socket.open(asio::ip::udp::v4());
            std::cout << _prefix << " Connected at " << _endpoint.address().to_string() << ":" << _endpoint.port() << std::endl;
        }

        void Send(BabelProtocol::Paquet paquet)
        {
            std::cout << "PAQUET :" << std::endl;
            std::cout << "paquet.body = " << paquet.body << std::endl;
            std::error_code err;
            _socket.send_to(asio::buffer(reinterpret_cast<char *>(&paquet), sizeof(BabelProtocol::Paquet)), _endpoint, 0, err);
            if (err)
                std::cout << _prefix << " WriteHeader ERROR: " << err.message() << std::endl;
        }

    public:
        std::deque<BabelProtocol::Paquet> &CommingPaquet()
        {
            return _qPaquetIn;
        }
    
    private:
        asio::io_context &_context;
        asio::ip::udp::socket _socket;
        asio::ip::udp::endpoint _endpoint;
        
        BabelProtocol::Paquet _tmpPaquet;
        std::deque<BabelProtocol::Paquet> _qPaquetIn;
        std::thread _threadContext;

        std::string _prefix;
};

#endif