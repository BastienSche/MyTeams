#include "mainwindow.h"
#include <thread>
#include <pthread.h>

void *graphic(void* a)
{
}  

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.setWindowTitle("Babel");
    w.show();

    // MyTcpSocket s;
    w.doConnect();

    // int firstSocket;
    // struct sockaddr_in addr;
    // firstSocket = socket(AF_INET, SOCK_STREAM, 0);
    // int nPort = 9999;

    // if(firstSocket == -1)
    // {
    //     printf( "socket() error\n");
    //     exit(1);
    // }
    // // addr.sin_addr.s_addr = inet_addr("10.136.78.33");
    // addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    // addr.sin_family = AF_INET;
    // addr.sin_port = htons(nPort);
    // if (connect(firstSocket, (struct sockaddr *)&addr, sizeof (addr)) < 0) {
    //     printf( "connect() error\n");
    //     exit(1);
    // }
    // w._socket = firstSocket;
    // handle_cli(firstSocket);
    return a.exec();
}
