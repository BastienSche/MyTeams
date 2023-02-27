#ifndef FINALWINDOW_H
#define FINALWINDOW_H

#include <QApplication>
#include <QUdpSocket>
#include <QObject>
#include <QDialog>
#include <QMessageBox>
#include <QTcpSocket>
#include <QDebug>
#include <QtGui>
#include <QPushButton>
#include <QPixmap>
#include <iostream>

#include <QHostAddress>
#include <QNetworkDatagram>
#include <QByteArray>
#include <iomanip>
#include <regex>    
#include "../portaudio.h"
#include "Client.hpp"

namespace Ui {
class FinalWindow;
}

class FinalWindow : public QDialog
{
    Q_OBJECT

public:
    explicit FinalWindow(std::string user, QTcpSocket *socket, QWidget *parent = 0);
    ~FinalWindow();
    void hideContact(int nb);
    void showContact(int nb);
    void showContact(int nb, std::vector<std::string> contacts);
    int checkIf(std::string server_reply);
    void initUdp(int port);
    void sendUDP(std::string, int);
    void readPendingDatagrams();

private slots:
    void on_callBTN_1_clicked();
    void on_callBTN_2_clicked();
    void on_callBTN_3_clicked();
    void on_callBTN_4_clicked();
    void on_callBTN_5_clicked();
    void on_callBTN_6_clicked();
    void on_callBTN_7_clicked();
    void on_callBTN_8_clicked();
    void on_pushButtonAddContact_clicked();
    void on_pushButtonRefresh_clicked();
    void on_pushButtonDisconnect_clicked();

public slots:
    // void readyRead();

private:
    Ui::FinalWindow *ui;
    int width;
    int height;
    QTcpSocket *socket;
    QUdpSocket *udpSocket;
    std::string _user;
};

// class MyUDP
// {
//     Q_OBJECT

// public:
//     void HelloUDP();

// signals:

// public slots:

// private:
//     QUdpSocket *_socket;
// };

#endif // FINALWINDOW_H
