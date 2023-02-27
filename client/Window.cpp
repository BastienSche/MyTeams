/*
** EPITECH PROJECT, 2021
** B-CPP-500-MAR-5-1-babel-alexis.massard
** File description:
** Window
*/

#include "Client.hpp"

Window::Window(Client *client, int width, int height, QWidget *parent)
{
    _cli = client;
    _width = width;
    _height = height;
    _window.setFixedSize(_width, _height);

    _btn = new QPushButton("Hang up", &_window);
    _btn->setGeometry(340, 310, 180, 30);
    _btn->show();

    connect(client->responseHandler, SIGNAL(sigWinState(QString)), this, SLOT(StateSlot(QString)));
    //connect(client->responseHandler, SIGNAL(sigStartCall(QString)), this, SLOT(StartCallSlot(QString)));
    //connect(client->responseHandler, SIGNAL(sigReceiveCall(QString)), this, SLOT(ReceiveCallSlot(QString)));
    //connect(client->responseHandler, SIGNAL(sigAcceptCall()), this, SLOT(AcceptCallSlot()));
    //connect(client->responseHandler, SIGNAL(sigOnlines()), this, SLOT(OnlineSlot()));
    connect(client, SIGNAL(sigSendRecord()), this, SLOT(SendRecordSlot()));
    connect(_btn, SIGNAL(clicked()), this, SLOT(StopCallSlot()));
    // _cli->Listen("127.0.0.1", 9555);
}

void Window::SetErrorMessage(std::string error)
{
    _error->setText(error.c_str());
    int width = _error->text().toStdString().length()*7;
    _error->setGeometry(_width/2-width/2, 80, width, 30);
}

void Window::setState(State state)
{
    std::cout << "[WINDOW] State: " << _state << std::endl; 
    InitMainScreen();

    // switch (state) {
    //     case MAIN_SCREEN:
    //         InitMainScreen();
    //         break;
    //     default:
    //         //InitLoginScreen();
    //         break;
    // }
    _window.show();
    _state = state;
}

void Window::Show()
{
    _window.show();
}

void Window::Close()
{
    _window.close();
}

// void Window::RequestCallSlot(const QString &string)
// {
//     _cli->SendCommand(BabelProtocol::CALL_REQUEST, {string.toStdString()});
// }

void Window::StateSlot(const QString &string)
{
    Window::State state = static_cast<Window::State>(std::stoi(string.toStdString()));
    setState(state);
}

// void Window::StartCallSlot(const QString &string)
// {
//     _address = string.toStdString();
//     _callMessage = new QLabel(&_window);
//     QString text = "Attemp response from ";
//     text.append(_address.c_str());
//     _callMessage->setText(text);
//     int width = _callMessage->text().toStdString().length()*7;
//     _callMessage->setGeometry(_width/2-width/1.5, 110, width, 30);
//     _callMessage->show();
//     _btn = new QPushButton("Cancel", &_window);
//     _btn->setGeometry(340, 310, 180, 30);
//     _btn->show();
//     _cli->Listen("127.0.0.1", UDP_PORT);
//     connect(_btn, &QPushButton::clicked, this, [this]() {
//         StopCallSlot();
//     });
// }

// void Window::ReceiveCallSlot(const QString &string)
// {
//     _btn->close();
//     _address = string.toStdString();
//     _callMessage = new QLabel(&_window);
//     QString text = "You recevie a call from ";
//     text.append(string.toStdString().c_str());
//     _callMessage->setText(text);
//     int width = _callMessage->text().toStdString().length()*7;
//     _callMessage->setGeometry(_width/2-width/1.5, 110, width, 30);
//     _callMessage->show();
//     _btn = new QPushButton("Accept", &_window);
//     _btn->setGeometry(340, 310, 180, 30);
//     _btn->show();
//     connect(_btn, SIGNAL(clicked()), this, SLOT(AcceptCallSlot()));
// }

void Window::StopCallSlot()
{
    // _callMessage->close();
    // //_btn->close();
    std::cout << "PUSH DISCONNECTED" << std::endl;
    //_cli->StopCall(); 
    //_incall = false;
}

// void Window::AcceptCallSlot()
// {
//     _btn->close();
//     QString text = "You are in call !";
//     text.append(_address.c_str());
//     _callMessage->setText(text);
//     int width = _callMessage->text().toStdString().length()*7;
//     _callMessage->setGeometry(_width/2-width/1.5, 110, width, 30);
//     _callMessage->show();
//     _btn = new QPushButton("Hang Up", &_window);
//     _btn->setGeometry(340, 310, 180, 30);
//     _btn->show();
//     _cli->SendAudioPaquet(_address, UDP_PORT);
// }

void Window::SendRecordSlot()
{
    _cli->SendEncodedAudio();
}

// void Window::InitLoginScreen()
// {
//     _window.setWindowTitle(QApplication::translate("toplevel", "Babel-  Login"));
//     _error = new QLabel(&_window);
//     _error->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);

//     _pseudoLine = new QLineEdit(&_window);
//     _pseudoLine->setGeometry(340, 200, 180, 30);

//     _btn = new QPushButton("Connexion", &_window);
//     _btn->setGeometry(340, 310, 180, 30);
//     connect(_btn, SIGNAL(clicked()), this, SLOT(LoginSlot()));
// }

// void Window::InitOnlinesUser()
// {
//     for (int i = 0; i < _callBtns.size(); i++)
//         _callBtns[i]->close();
//     _callBtns.clear();

//     if (!_cli->contacts.size()) {
//         SetErrorMessage("No user online !");
//     } else {
//         SetErrorMessage("");
//         for (int i = 0; i < _cli->contacts.size(); i++) {
//             BabelProtocol::Client client = _cli->contacts[i];            
//             _callBtns.push_back(new QPushButton(std::string("Call "+client.userName).c_str(), &_window));
//             _callBtns.back()->setGeometry(100, i*50 + 150, 180, 30);
//             _callBtns.back()->show();
//             connect(_callBtns.back(), &QPushButton::clicked, this, [this, client]() {
//                 RequestCallSlot(client.uuid.c_str());
//             });
//         }

//     }
// }

void Window::InitMainScreen()
{
    // _pseudoLine->close();
    //_btn->close();
    //_window.setWindowTitle(QApplication::translate("toplevel", std::string("Babel - Hello " + _cli->GetUsername()).c_str()));
    //InitOnlizenesUser();
    QString title = "Pas de titre";
    _window.setWindowTitle(title);
}