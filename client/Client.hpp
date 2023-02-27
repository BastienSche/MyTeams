#pragma once
#ifndef _CLIENT_HPP_
#define _CLIENT_HPP_

#include "UdpConnection.hpp"
#include "BabelProtocol.hpp"
#include <QApplication>
#include <QPushButton>
#include <QtWidgets>
#include <iostream>
#include <string>

class Client;

#define f_req std::function<bool(BabelProtocol::Request)>

class RequestHandler
{
    public: 
        RequestHandler(Client *client);
        ~RequestHandler();
        bool Send(BabelProtocol::Request request);

    private:
        static bool Login(BabelProtocol::Request req,  Client *cli);

    private:
        Client *_cli;
        std::vector<f_req> _sendRequest;
};

#define f_res std::function<bool(BabelProtocol::Response)>

class ResponseHandler: public QObject
{
    Q_OBJECT
    public:
        ResponseHandler(Client *client);
        ~ResponseHandler();
        bool Apply(BabelProtocol::Response response);

    private:
        Client *_cli;
        std::vector<f_res> _handleResponse;

    signals:    
        void sigWinState(const QString &); 
        void sigOnlines();
        void sigReceiveCall(const QString &);
        void sigStartCall(const QString &);
        void sigAcceptCall();
};

class Window: public QMainWindow
{
    Q_OBJECT
    public:
        enum Func
        {
            LOGIN_FUNC
        };

        enum State: unsigned short
        {
            CLOSE,
            LOGIN_SCREEN,
            MAIN_SCREEN,
            CALL_SCREEN
        };

    public:
        explicit Window(Client *client, int width = 860, int height = 540, QWidget *parent = 0);
        void SetErrorMessage(std::string error);
        void setState(State state);


    private slots:
        void StateSlot(const QString &);
        // void RequestCallSlot(const QString &);
        // void StartCallSlot(const QString &);
        // void ReceiveCallSlot(const QString &);
        // void AcceptCallSlot();
        void StopCallSlot();
        void SendRecordSlot();

    private:
        void Show();
        void Close();
        void InitMainScreen();

    private:
        int _width, _height;
        QLabel *_error, *_callMessage;
        QLineEdit *_pseudoLine;
        QMainWindow _window;
        QPushButton *_btn;
        std::vector<QPushButton *> _callBtns;
        Func _funcSlot;
        State _state = CLOSE;
        std::string _address;
        Client *_cli;
};

class Client: public QObject
{
    Q_OBJECT
    public:
        Client(std::string callingUsername, std::string callingIp, int callingPort, std::string selfUsername, int selfPort, std::string selfIp)
        {
            _requestHandler = new RequestHandler(this);
            responseHandler = new ResponseHandler(this);
            window = new Window(this);
            window->setState(Window::State::CALL_SCREEN);
            _username = selfUsername;
        }

        ~Client()
        {
            Disconnect();
        }
        
        //Getters
        int getPort(){
            return _callingPort;
        }

        void Connect()
        {
            try {
                _port = 9555;

                _threadResponse = std::thread([this] () {
                    _micro = new Microphone();
                    while(true) {
                        HandleUdpResponse();
                    }
                });
        
            } catch(std::exception &err) {
                std::cout << "[CLIENT] ERROR: " << err.what() << std::endl;
                _error = true;
                Disconnect();
                return;
            }
        }

        void Listen(std::string host, unsigned int port)
        {
            udpIn = std::make_unique<UdpConnection>(_contextUdp, asio::ip::udp::socket(_contextUdp));
            udpIn->Listen(host, port);
            _readAudio = true;
        }

        void SendAudioPaquet(std::string host, unsigned int port)
        {
            udpOut = std::make_unique<UdpConnection>(_contextUdp, asio::ip::udp::socket(_contextUdp));
            udpOut->ConnectTo(host, port);
            _sendAudio = true;
        }

        void Disconnect()
        {
            if (_threadResponse.joinable()) {
                std::cout << "THREAD RESPONSE IS JOINABLE" << std::endl;
                _threadResponse.join();
            }
        }

        std::string GetUsername()
        {
            return _username;
        }

        void SetUsername(std::string username)
        {
            _username = username;
        }

        bool SendCommand(BabelProtocol::Command command, std::vector<std::string> args)
        {
            Connect();
            return _requestHandler->Send({command, args});
        }

        void SendEncodedAudio()
        {
            BabelProtocol::Paquet paquet = _micro->EncodeStreamPaquet();
            udpOut->Send(paquet);
            std::cout << "sending paquet" << std::endl;
        }
    
    private:
        void HandleUdpResponse()
        {
            if (_sendAudio == true){
                emit sigSendRecord();
            }
            if (_readAudio == true) {
                if (!udpIn->CommingPaquet().empty() && udpIn->CommingPaquet().size()) {
                    BabelProtocol::Paquet paquet = udpIn->CommingPaquet().front();
                    _micro->PlayEncodedStream(paquet.body, paquet.header.arg_size);
                    udpIn->CommingPaquet().pop_front();
                }
            }
        }

    public:
        std::unique_ptr<UdpConnection> udpIn;
        std::unique_ptr<UdpConnection> udpOut;
        Window *window;
        std::vector<BabelProtocol::Client> contacts;
        Microphone *_micro;
        ResponseHandler *responseHandler;

    private:
        std::string _uuid, _username, _host;
        RequestHandler *_requestHandler;
        unsigned int _port;
        unsigned int _callingPort;
        bool _error = false, _sendAudio = true, _readAudio = true;
        std::thread _threadContext, _threadResponse;
        asio::io_context _contextUdp;

    signals:
        void sigSendRecord();
};
#endif