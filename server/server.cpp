#include "server.hpp"

Server::Server(/* args */)
{
}

Server::~Server()
{
}

ftp_client_s::ftp_client_s(int clt_socket, unsigned int clt_ip, int n_port, char *ipChar)
{
    this->ip = clt_ip;
    this->is_logged = false;
    this->fd = clt_socket;
    this->dfd = -1;
    this->port = n_port;
    this->user = NULL;
    this->_ipChar = ipChar;
}

ftp_client_s::~ftp_client_s()
{
}

const char* Server::GetAddress(const sockaddr_in& addr)
{
	char buff[INET6_ADDRSTRLEN] = { 0 };
	return inet_ntop(addr.sin_family, (void*)&(addr.sin_addr), buff, INET6_ADDRSTRLEN);
}

void ftp_client_s::setup_call()
{
    std::string sve;
    int rc;
    char q[999];
    int r;

    if (this->is_logged == false) {
    } else {
        std::cout << "----------- CALLL --------------" << std::endl;
        q[sizeof q - 1] = '\0';
        snprintf(q,sizeof q - 1,"SELECT call FROM USER WHERE NAME = '%s'",_name.c_str());
        _data_bd->open();
        r = _data_bd->CheckIfCall(q);
        if (r == 0)
            _call = false;
        else if (r == 1)
            _call = true;
        else 
            std::cout << "ERROR WITH CALL" << std::endl;
        std::cout << "----------- ENND - CALL --------------" << std::endl;
    }
}

void ftp_client_s::client_process_command()
{
    int read_size;
    char client_message[2000];
    memset(client_message, 0, 1000);
    // char *message = "0";
    char *message2 = "56";

    // if( send(this->fd, message , strlen(message) , 0) < 0)
    // {
    //     printf("Send failed\n");
    //     exit (84);
    // } else {
    //     std::cout<< "send : " <<message<<std::endl;
    // }
    while (1) {
        //CHECK IF CALL = 0  ou 1
        // setup_call();
        // if (_call == false) {
            if (read_size = recv(this->fd , client_message , 1000 , 0) <= 0)
                break;
            std::cout << "client : " << client_message << std::endl;
            // if( send(this->fd, message , strlen(message) , 0) < 0)
            // {
            //     printf("Send failed\n");
            //     break;
            // } else {
            //     //std::cout<< "send : " << message<<std::endl;
            // }
            parser_recv_message(client_message);    
            memset(client_message, 0, 1000);
        // } else if (_call == true) {
        //     std::cout << "SENDDD OKOKOK" << std::endl;
        //     if( send(this->fd, message2 , strlen(message2) , 0) < 0)
        //     {
        //         printf("Send failed\n");
        //         exit (84);
        //     }
        //     _call == false;
        //     to_no_call(_name);
        //     break;
        // }
    }
}

void Server::client_process(int clt_socket, struct sockaddr_in client_in, int n_port)
{
    ftp_client_s *ftp_client_t = new ftp_client_s(clt_socket, client_in.sin_addr.s_addr, n_port, inet_ntoa(client_in.sin_addr));
    ftp_client_t->client_process_command();
    //dprintf(clt_socket, "%d %s\r\n", 221, "Service closing control connection.");
}

void Server::followServSocket()
{
    struct sockaddr_in client;
    struct timeval tv;
    socklen_t addrlen = sizeof(_server);
    fd_set readfs;
    int max_client = 1;
    int cltSocket;
    //sockaddr_in from = {inet_addr("127.0.0.1")};
    int pid;

    _cltSocket.push_back(_srvSocket);
    while (1) {
        FD_ZERO(&readfs);
        int j;
        int sockmax = 0;
        FD_SET(STDIN_FILENO, &readfs);
        FD_SET(_srvSocket, &readfs);

        for (j = 0; j < max_client; j++) {
            if (_cltSocket.at(j) != 0)
                FD_SET(_cltSocket.at(j), &readfs);
            if(sockmax < _cltSocket.at(j))
                sockmax = _cltSocket.at(j);
        }
        cltSocket = accept(_srvSocket, (struct sockaddr *)&client, &addrlen);
        std::cout << "connexion de : " << inet_ntoa(client.sin_addr) << ":"<< ntohs(client.sin_port)<< std::endl;
        if (cltSocket < 0)
		{
            fprintf(stderr, "accept() error\n");
            exit(1);
		}
        if(pid=fork()==0) {
            max_client++;
            _cltSocket.push_back(cltSocket);
            for (int i = 1; i < _cltSocket.size(); i++) {
                client_process(_cltSocket[i], client, 5556);
            }
            close(cltSocket);
            break;
        }
    }
}

void Server::createServSocket()
{
    int serv_socket;
    int optval = 1;
    struct protoent	*tcp_protocol;

    if ((tcp_protocol = getprotobyname("TCP")) == NULL) {
        fprintf(stderr, "[-] Get TCP protocol failed");
        exit(84);
    }
    if ((serv_socket = socket(AF_INET, SOCK_STREAM, tcp_protocol->p_proto)) == -1) {
        fprintf(stderr, "[-] Could not create socket\n");
        exit(84);
    }
    if (setsockopt(serv_socket, SOL_SOCKET, SO_REUSEADDR, &optval, sizeof(int)) < 0) {
        fprintf(stderr, "[-] Could not set SO_REUSEADDR\n");
        exit(84);
    }
    _server.sin_family = AF_INET;
    _server.sin_addr.s_addr = INADDR_ANY;
    _server.sin_port = htons((unsigned int)5556);
    if (bind(serv_socket, (struct sockaddr *)&_server, sizeof(_server)) == -1)
    {
        fprintf(stderr, "bind() error\n");
        exit(84);
    }
    if (listen(serv_socket, 10) == -1)
    {
        fprintf(stderr, "listen() error\n");
        exit(84);
    }
    _srvSocket = serv_socket;
    followServSocket();
}

int main(int ac, char **av)
{
    Server *server = new Server();
    server->createServSocket();
    return (0);
}


// Adresse IP du host du serveur dans Server::followServSocket

// Adresse IP du serveur pour ce connecter dans MainWindow::doConnect

// Client 1   -> finalWindow::finalWindow -> 9995
// 		-> finalWindow::on_callBTN 1, 2, 3, 4, 5, 6 -> 9994

// Client 2    -> finalWindow::finalWindow -> 9994
// 		-> finalWindow::on_callBTN 1, 2, 3, 4, 5, 6 -> 9995