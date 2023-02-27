#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QApplication>
#include <QMainWindow>
#include <QMessageBox>
#include "registerwindow.h"
#include "finalwindow.h"
#include <QObject>
#include <QTcpSocket>
#include <QDebug>
#include <iostream>
#include <string.h>

namespace Ui { class MainWindow; }

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void doConnect();
    void endConnect();
    void login(std::string user, std::string pass);
    int checkIf(std::string server_reply);

private slots:
    void on_registerBTN_clicked();
    void on_exitBTN_clicked();
    void on_loginBTN_clicked();

private:
    QTcpSocket *socket;
    Ui::MainWindow *ui;
    RegisterWindow *registerWindow;
    FinalWindow *finalWindow;
    std::string _user;
};

void handle_cli(int sock);
#endif // MAINWINDOW_H
