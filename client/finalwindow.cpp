#include "finalwindow.h"
#include "ui_finalwindow.h"

int self_port = 5554;
int calling_port = 5555;
int udpPort = 9555;
std::string myIP = "127.0.0.1";

void FinalWindow::sendUDP(std::string ip, int port)
{
    QByteArray Data;
    // Data.append(_user);
    QString qip = QString::fromStdString(ip);
    //"192.168.1.155"
    udpSocket->writeDatagram(Data, QHostAddress(qip), port);
}

void FinalWindow::readPendingDatagrams()
{
    while (udpSocket->hasPendingDatagrams()) {
        // std::cout << "RECU " << std::endl;
        QNetworkDatagram datagram = udpSocket->receiveDatagram();
        // QByteArray data = datagram->data();
        QByteArray replyData = datagram.data();
        QString _data(replyData);
        qDebug() << "DATA : " << _data;
        QString path = "";
        path += _data;
        path += " vous appelles ....";
        QMessageBox msgBox;
        msgBox.setText(path);
        msgBox.setInformativeText("Voulez vous répondre ? ");
        msgBox.setStandardButtons(QMessageBox::Yes | QMessageBox::No);
        msgBox.setDefaultButton(QMessageBox::Yes);
        int ret = msgBox.exec();

        if (ret == QMessageBox::Yes){
            udpSocket->close();
            Client *tempClient = new Client(this->ui->Contact1->text().toStdString(), "127.0.0.1", calling_port, _user, self_port, myIP);
            tempClient->SendAudioPaquet("127.0.0.1", 9555);
            tempClient->Listen("127.0.0.1", 9554);
            tempClient->Connect();
        } else if (ret == QMessageBox::No) {
            std::cout << "pressed NO" << std::endl;
        }
        
    }
}

void FinalWindow::initUdp(int port)
{
    // create a QUDP socket
    udpSocket = new QUdpSocket(this);
    udpSocket->bind(QHostAddress::Any, port);
    connect(udpSocket, &QUdpSocket::readyRead, this, &FinalWindow::readPendingDatagrams);
}

FinalWindow::FinalWindow(std::string user, QTcpSocket *nsocket, QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::FinalWindow)
{
    ui->setupUi(this);
    initUdp(self_port);
    width = 113;
    height = 32;
    socket = nsocket;
    _user = user;
    on_pushButtonRefresh_clicked();
}

FinalWindow::~FinalWindow()
{
    delete ui;
}

void FinalWindow::showContact(int nb, std::vector<std::string> contacts)
{
    switch (nb)
    {
    case 1:
        this->ui->callBTN_1->setVisible(true);
        this->ui->Contact1->setVisible(true);
        this->ui->Contact1->setText(contacts[0].c_str());
        showContact(nb - 1, contacts);
        break;
    case 2:

        this->ui->callBTN_2->setVisible(true);
        this->ui->Contact2->setVisible(true);
        this->ui->Contact2->setText(contacts[1].c_str());
        showContact(nb - 1, contacts);
        break;
    case 3:
        this->ui->callBTN_3->setVisible(true);
        this->ui->Contact3->setVisible(true);
        this->ui->Contact3->setText(contacts[2].c_str());
        showContact(nb - 1, contacts);
        break;
    case 4:
        this->ui->callBTN_4->setVisible(true);
        this->ui->Contact4->setVisible(true);
        this->ui->Contact3->setText(contacts[3].c_str());
        showContact(nb - 1, contacts);
        break;
    case 5:
        this->ui->callBTN_5->setVisible(true);
        this->ui->Contact5->setVisible(true);
        this->ui->Contact5->setText(contacts[4].c_str());
        showContact(nb - 1, contacts);
        break;
    case 6:
        this->ui->callBTN_6->setVisible(true);
        this->ui->Contact6->setVisible(true);
        this->ui->Contact6->setText(contacts[5].c_str());
        showContact(nb - 1, contacts);
        break;
    case 7:
        this->ui->callBTN_7->setVisible(true);
        this->ui->Contact7->setVisible(true);
        this->ui->Contact7->setText(contacts[6].c_str());
        showContact(nb - 1, contacts);
        break;
    case 8:
        this->ui->callBTN_8->setVisible(true);
        this->ui->Contact8->setVisible(true);
        this->ui->Contact8->setText(contacts[7].c_str());
        showContact(nb - 1, contacts);
       break;
    default:
        break;
    }
}

void FinalWindow::hideContact(int nb)
{
    switch (nb)
    {
    case 1:
       this->ui->Contact1->setVisible(false);
       this->ui->callBTN_1->setVisible(false);
       hideContact(nb - 1);
       break;
    case 2:
       this->ui->callBTN_2->setVisible(false);
       this->ui->Contact2->setVisible(false);
       hideContact(nb - 1);
       break;
    case 3:
       this->ui->callBTN_3->setVisible(false);
       this->ui->Contact3->setVisible(false);
       hideContact(nb - 1);
       break;
    case 4:
       this->ui->callBTN_4->setVisible(false);
       this->ui->Contact4->setVisible(false);
       hideContact(nb - 1);
       break;
    case 5:
       this->ui->callBTN_5->setVisible(false);
       this->ui->Contact5->setVisible(false);
       hideContact(nb - 1);
       break;
    case 6:
       this->ui->callBTN_6->setVisible(false);
       this->ui->Contact6->setVisible(false);
       hideContact(nb - 1);
       break;
    case 7:
       this->ui->callBTN_7->setVisible(false);
       this->ui->Contact7->setVisible(false);
       hideContact(nb - 1);
       break;
    case 8:
       this->ui->callBTN_8->setVisible(false);
       this->ui->Contact8->setVisible(false);
       hideContact(nb - 1);
       break;
    default:
        break;
    }   
}

std::vector<std::string> str_to_vec(std::string str)
{
    str = std::regex_replace(str, std::regex("^ +"), "");
    std::vector<std::string> ret;
    std::string tmp;
    for (size_t i = 0; i < str.size(); i++){
        tmp += str[i];
        if (str[i] == ' '){
            ret.push_back(tmp);
            tmp.clear();
        }
    }
    ret.push_back(tmp);
    return ret;
}

void FinalWindow::on_pushButtonAddContact_clicked()
{
    std::cout << "You pressed Add contact button, name of the contact to add : " << this->ui->lineEditAddContact->text().toStdString() << std::endl;
    
    std::string server_request = "";
    std::string user = ui->lineEditAddContact->text().toStdString().c_str();
    std::string cmd = "/add_contacts ";
    server_request += cmd;
    server_request += user;
    socket->write(server_request.c_str());
    socket->waitForBytesWritten(1000);
    socket->waitForReadyRead(3000);
    std::string answer;
    QString data = QString(socket->readAll());
    answer = data.toStdString();

    //TODO Gestion d'erreur sur la réponse

    std::cout << answer << std::endl;
    on_pushButtonRefresh_clicked();
}

void FinalWindow::on_pushButtonRefresh_clicked()
{
    std::string cmd = "/get_contacts";
    socket->write(cmd.c_str());
    socket->waitForBytesWritten(1000);
    socket->waitForReadyRead(3000);
    std::string answer;
    QString data = QString(socket->readAll());
    answer = data.toStdString();

    std::cout << "You pressed Refresh button" << std::endl;
    std::cout << answer << std::endl;

    std::vector<std::string> contacts;
    contacts = str_to_vec(answer);
    std::cout << "contact.size() = " << contacts.size() << std::endl;
    hideContact(8);
    showContact(contacts.size(), contacts);
}

void FinalWindow::on_pushButtonDisconnect_clicked()
{
    std::string cmd = "/disconnect";
    socket->write(cmd.c_str());
    socket->waitForBytesWritten(1000);
    socket->waitForReadyRead(3000);
    std::string answer;
    QString data = QString(socket->readAll());
    answer = data.toStdString();

    std::cout << "You pressed DISCONNECTED boutton" << std::endl;
    std::cout << answer << std::endl;
    exit(0);
}

void FinalWindow::on_callBTN_1_clicked()
{
    std::string path = "/start_call ";
    path += this->ui->Contact1->text().toStdString();

    socket->write(path.c_str());
    socket->waitForBytesWritten(1000);
    socket->waitForReadyRead(3000);

    std::string answer;
    QString data = QString(socket->readAll());
    answer = data.toStdString();

    if (answer == "55") {
        socket->write("CALL");
        socket->waitForBytesWritten(1000);
        socket->waitForReadyRead(3000);
        std::string answer2;
        QString data2 = QString(socket->readAll());
        answer2 = data2.toStdString();
        std::cout << "Answer2 : " << answer2 << std::endl;
        sendUDP(answer2, calling_port);
    
        Client *tempClient = new Client(this->ui->Contact1->text().toStdString(), answer2, calling_port, _user, self_port, myIP);
        tempClient->Listen("127.0.0.1", 9555);
        tempClient->SendAudioPaquet("127.0.0.1", 9554);
        tempClient->Connect();
        //tempClient->SendAudioPaquet("127.0.0.1", udpPort);
    }
    //_cli->SendCommand(BabelProtocol::CALL_REQUEST, {string.toStdString()});

}

void FinalWindow::on_callBTN_2_clicked()
{

}

void FinalWindow::on_callBTN_3_clicked()
{

}

void FinalWindow::on_callBTN_4_clicked()
{
    std::cout << "You pressed CALL4" << std::endl;
}

void FinalWindow::on_callBTN_5_clicked()
{
    std::cout << "You pressed CALL5" << std::endl;
}

void FinalWindow::on_callBTN_6_clicked()
{
    std::cout << "You pressed CALL6" << std::endl;
}

void FinalWindow::on_callBTN_7_clicked()
{
    std::cout << "You pressed CALL7" << std::endl;
}

void FinalWindow::on_callBTN_8_clicked()
{
    std::cout << "You pressed CALL8" << std::endl;
}

int FinalWindow::checkIf(std::string server_reply)
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