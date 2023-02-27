#ifndef REGISTERWINDOW_H
#define REGISTERWINDOW_H

#include <QApplication>
#include <QMainWindow>
#include <QObject>
#include <QDialog>
#include <QMessageBox>
#include <QTcpSocket>
#include <iostream>
#include <string.h>

namespace Ui {
class RegisterWindow;
}

class RegisterWindow : public QDialog
{
    Q_OBJECT

public:
    explicit RegisterWindow(QTcpSocket *socket, QWidget *parent = 0);
    ~RegisterWindow();
    int checkIf(std::string server_reply);

private slots:
    void on_registerBTN_clicked();
    void on_backBTN_clicked();

private:
    Ui::RegisterWindow *ui;
    QTcpSocket *socket;
};

int checkIf(std::string server_reply);
#endif // REGISTERWINDOW_H
