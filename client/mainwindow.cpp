#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    socket->close();
    delete ui;
}

void MainWindow::on_registerBTN_clicked()
{
    //Ouvrir autre window de register
    registerWindow = new RegisterWindow(socket, this);
    registerWindow->show();
}

void MainWindow::on_exitBTN_clicked()
{
    exit(0);
}

void MainWindow::on_loginBTN_clicked()
{
    // QString username = ui->lineEdit_username->text();
    // QString password = ui->lineEdit_password->text();
    std::string user = ui->lineEdit_username->text().toStdString().c_str();
    _user = user;
    std::string pass = ui->lineEdit_password->text().toStdString().c_str();
    login(user, pass);
    //send
    // _s->write(path);
    // _s->waitForBytesWritten(1000);
    // _s->waitForReadyRead(3000);
}

void MainWindow::doConnect()
{
    socket = new QTcpSocket(this);

    socket->connectToHost("127.0.0.1", 5556);

    if(socket->waitForConnected(5000)){
        qDebug() << "Connected!";
    } else {
        qDebug() << "Not connected!";
    }
}

void MainWindow::login(std::string user, std::string pass)
{
    std::string path = "/login ";
    path += user;
    path += ' ';
    path += pass;
    socket->write(path.c_str());
    socket->waitForBytesWritten(1000);
    socket->waitForReadyRead(3000);
    std::string answer;
    QString data = QString(socket->readAll());
    answer = data.toStdString();
    std::cout << answer << std::endl;
    if (checkIf(answer) == 0) {
        hide();
        finalWindow = new FinalWindow(this->_user, socket, this);
        finalWindow->show();
    }
}

int MainWindow::checkIf(std::string server_reply)
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