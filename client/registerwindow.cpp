#include "registerwindow.h"
#include "ui_registerwindow.h"

RegisterWindow::RegisterWindow(QTcpSocket *nsocket, QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::RegisterWindow)
{
    ui->setupUi(this);
    socket = nsocket;
}

RegisterWindow::~RegisterWindow()
{
    delete ui;
}

void RegisterWindow::on_registerBTN_clicked()
{
    std::string username = ui->lineEditUsername->text().toStdString();
    std::string password = ui->lineEditPassword->text().toStdString();

    std::string path = "/register " + username + " " + password;
    socket->write(path.c_str());
    socket->waitForBytesWritten(1000);
    socket->waitForReadyRead(3000);
    std::string answer;
    QString data = QString(socket->readAll());
    answer = data.toStdString();
    std::cout << answer << std::endl;
    if (checkIf(answer) != 0){

    } else {
        QMessageBox::information(this, "Success" ,"Successfully registered");
    }
    //QMessageBox::information(this, "" ,"Welcome ! We're glad you decided to use Babel today " + username);
    //hide();
}


void RegisterWindow::on_backBTN_clicked()
{
    hide();
}

int RegisterWindow::checkIf(std::string server_reply) 
{
    if (server_reply == "0") {
        QMessageBox::information(this, "Login", "Username and password are correct");
        return 0;
    } else if (server_reply == "1") {
        QMessageBox::information(this, "Error", "Not connected");
        return 1;
    } else if (server_reply == "2") {
        QMessageBox::information(this, "Error", "Already connected");
        return 2;
    } else if (server_reply == "3") {
        QMessageBox::information(this, "Error", "Bad contact");
        return 3;
    } else if (server_reply == "4") {
        QMessageBox::information(this, "Error", "Wrong password");
        return 4;
    } else if (server_reply == "5") {
        QMessageBox::information(this, "Error", "Minimum 3 characters are needed for your username");
        return 5;
    } else if (server_reply == "6") {
        QMessageBox::information(this, "Error", "Minimum 3 characters are needed for your password");
        return 6;
    } else if (server_reply == "7") {
        QMessageBox::information(this, "Error", "Name already exists");
        return 7;
    } else if (server_reply == "12") {
        QMessageBox::information(this, "Error", "You are not registered");
        return 12;
    } else if (server_reply == "55") {
        // Client *client = new Client();
        // client->_call = true;
        // client->callOther(sock, server_reply ==;
    } else if (server_reply == "56") {
        std::cout << "SETUPPP POUR CALL" << std::endl;
        // udpCheck();
    } else if (server_reply == "-1") {
        std::cout << "Command not implemented" << std::endl;
    } else
        std::cout << "List of contacts : " << server_reply << std::endl;
    return 999;
}

