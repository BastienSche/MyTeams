#include "server.hpp"

void ftp_client_s::cmd_register(std::vector<std::string> tab_command) {
    if (tab_command.at(1).size() < 3) {
        char *message = "5";
        if( send(this->fd, message , strlen(message) , 0) < 0)
            printf("Send failed\n");
    } else {
        if (tab_command.at(2).size() < 3) {
            char *message = "6";
            if( send(this->fd, message , strlen(message) , 0) < 0)
                printf("Send failed\n");
        } else {
            char q[999];
            char *sql;
            _data_bd->open();
            int r = 0;
            const char *data = tab_command.at(1).c_str();
            /* Create SQL statement */
            sql = "CREATE TABLE if not exists USER("  \
                "IP             TEXT     NOT NULL,"\
                "NAME           TEXT    NOT NULL,"\
                "CONTACT        TEXT    NOT NULL,"\
                "MDP            TEXT    NOT NULL,"\
                "CALL           INT     NOT NULL);";

            q[sizeof q - 1] = '\0';
            snprintf(q,sizeof q - 1,"SELECT name FROM USER WHERE NAME = '%s'",tab_command.at(1).c_str());
            _data_bd->create(sql);
            r = _data_bd->select(q, data);
            if (r == 0) {
                // std::cout << "IPCHAR :" << _ipChar << " et " << htons(this->port)<< std::endl; 
                _data_bd->insert(this->_ipChar, tab_command.at(1), tab_command.at(2));
                char *message = "0";
                if( send(this->fd, message , strlen(message) , 0) < 0)
                    printf("Send failed\n");
            } else if (r == 7) {
                char *message = "7";
                if( send(this->fd, message , strlen(message) , 0) < 0)
                    printf("Send failed\n");
            }
        }
    }
}

void ftp_client_s::cmd_login(std::vector<std::string> tab_command) {

    if (this->is_logged == true) {
        char *message = "2";
        if( send(this->fd, message , strlen(message) , 0) < 0)
            printf("Send failed\n");
    } else {
        _data_bd->open();
        char result[100];   // array to hold the result.
        char result2[100];   // array to hold the result.
        const char *data1 = tab_command.at(1).c_str();
        const char *data2 = " ";
        const char *data3 = tab_command.at(2).c_str();
        strcpy(result,data1); // copy string one into the result.
        strcat(result,data2);
        strcpy(result2,result); // copy string one into the result.
        strcat(result2,data3);
        char q[999];
        int r = 0;
        q[sizeof q - 1] = '\0';
        snprintf(q,sizeof q - 1,"SELECT MDP FROM USER WHERE NAME = '%s'",tab_command.at(1).c_str());
        //snprintf(q,sizeof q - 1,"SELECT * FROM USER");
        r = _data_bd->select_login(q, result2);
        if (r == 0) {
            char *message = "0";
            this->is_logged = true;
            if( send(this->fd, message , strlen(message) , 0) < 0)
                printf("Send failed\n");
        } else if (r == 4) {
            char *message = "4";
            if( send(this->fd, message , strlen(message) , 0) < 0)
                printf("Send failed\n");
        } else if (r == 12) {
            char *message = "12";
            if( send(this->fd, message , strlen(message) , 0) < 0)
                printf("Send failed\n");
        } else if (r == 1) {
            char *message = "1";
            if( send(this->fd, message , strlen(message) , 0) < 0)
                printf("Send failed\n");
        }
        _name = tab_command.at(1);
    }
}

void ftp_client_s::cmd_get_contacts(std::vector<std::string> tab_command) {
    if (this->is_logged == false) {
        char *message = "1";
        if( send(this->fd, message , strlen(message) , 0) < 0)
            printf("Send failed\n");
    } else {
        char *message = "Not contacts";
        _data_bd->open();
        std::string save;
        const char *data = "";
        char q[999];
        q[sizeof q - 1] = '\0';
        snprintf(q,sizeof q - 1,"SELECT contact FROM USER WHERE NAME = '%s'",_name.c_str());
        save = _data_bd->get_contact(q, data);
            if( send(this->fd, save.c_str() , save.size(), 0) < 0)
                printf("Send failed\n");
    }
}

void ftp_client_s::cmd_add_contacts(std::vector<std::string> tab_command) {
    int r;
    if (this->is_logged == false) {
        char *message = "1";
        if( send(this->fd, message , strlen(message) , 0) < 0)
            printf("Send failed\n");
    } else {
        _data_bd->open();
        const char *data = tab_command.at(1).c_str();
        char q[999];
        q[sizeof q - 1] = '\0';
        snprintf(q,sizeof q - 1,"SELECT contact FROM USER WHERE NAME = '%s'",_name.c_str());
        r = _data_bd->update_contact(q, tab_command.at(1), data, _name);
        if (r == 0) {
            char *message = "0";
            if( send(this->fd, message , strlen(message) , 0) < 0)
                printf("Send failed\n");
        } else if (r == 3) {
            char *message = "3";
            if( send(this->fd, message , strlen(message) , 0) < 0)
                printf("Send failed\n");
        }
    }
}

void sendToIpName(std::string ipName)
{
    char *message = "56";
    int serv_socket;
    struct sockaddr_in server;
    int optval = 1;
    struct protoent	*tcp_protocol;

    if ((serv_socket = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
        fprintf(stderr, "[-] Could not create socket\n");
        exit(84);
    }
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr(ipName.c_str());
    server.sin_port = htons((unsigned int)9999);
    if (connect(serv_socket, (struct sockaddr *)&server, sizeof (server)) < 0) {
        printf( "connect() error\n");
        exit(1);
    }
    if( send(serv_socket , message , strlen(message) , 0) < 0)
    {
        printf("Send failed\n");
    }
}

void ftp_client_s::to_call(std::string name)
{
    _data_bd->open();
    const char *data = name.c_str();
    char q[999];
    q[sizeof q - 1] = '\0';
    snprintf(q,sizeof q - 1,"UPDATE USER set call = 1 where NAME = '%s'",name.c_str());
    _data_bd->update_call(q);
}

void ftp_client_s::to_no_call(std::string name)
{
    _data_bd->open();
    const char *data = name.c_str();
    char q[999];
    q[sizeof q - 1] = '\0';
    snprintf(q,sizeof q - 1,"UPDATE USER set call = 0 where NAME = '%s'",name.c_str());
    _data_bd->update_call(q);
}

void ftp_client_s::cmd_start_call(std::vector<std::string> tab_command) {
    std::vector<std::string> ipName;
    std::vector<std::string> ipNameSolo;
    if (this->is_logged == false) {
        char *message = "1";
        if( send(this->fd, message , strlen(message) , 0) < 0)
            printf("Send failed\n");
    } else {
        _data_bd->open();
        for (int i = 1; i < tab_command.size(); i++) {
            std::string ip_name("");
            const char *data = tab_command.at(i).c_str();
            char q[999];
            q[sizeof q - 1] = '\0';
            // std::cout << "name : -> " << tab_command.at(i).c_str() << std::endl;
            snprintf(q,sizeof q - 1,"SELECT ip FROM USER WHERE NAME = '%s'",tab_command.at(i).c_str());
            ip_name = _data_bd->get_name_for_call(q, data);
            // std::cout << "OOOO : " << tab_command.at(i) << " and " << ip_name << std::endl;
            ipName.push_back(tab_command.at(i) + " " + ip_name);
            ipNameSolo.push_back(ip_name);
        }
        for (int i = 0; i < ipName.size(); i++) {
            // sendToIpName(ipNameSolo.at(i));
            // std::cout << ipName.at(i).c_str() <<std::endl;
            char *message = "55";
            char *message2 = (char*)ipNameSolo.at(i).c_str();
            int read_size;
            char server_reply[2000];
            memset(server_reply, 0, 1000);
            if( send(this->fd, message , strlen(message) , 0) < 0)
                printf("Send failed\n");
            if(read_size = recv(this->fd , server_reply , 2000, 0) < 0)
            {
                printf("Send failed\n");
                break;
            }
            std::cout << "reçu : " << server_reply << std::endl;
            if (!strcmp(server_reply, "CALL")) {
                if( send(this->fd, message2 , strlen(message2) , 0) < 0)
                    printf("Send failed\n");
            }
            std::cout << "Call = " << tab_command.at(i+1) << " et " << _name << std::endl;
            to_call(tab_command.at(i + 1));
        }
    }
    // std::cout << "DONE" << std::endl;
}

void ftp_client_s::cmd_stop_call(std::vector<std::string> tab_command) {
}

//ADD DISCONNECT
void ftp_client_s::cmd_disconnect(std::vector<std::string> tab_command) {
    if (this->is_logged == false) {
        std::cout << "not LOG" << std::endl;
        char *message = "1";
        if( send(this->fd, message , strlen(message) , 0) < 0)
            printf("Send failed\n");
    } else {
        std::cout << "NO CALL : " << _name << std::endl;
        to_no_call(_name);
        this->is_logged = false;
        _name.clear();
        char *message = "0";
        if( send(this->fd, message , strlen(message) , 0) < 0)
            printf("Send failed\n");
    }
    _data_bd->close();
}

void ftp_client_s::command(std::vector<std::string> tab_command)
{
    sqlite3 * db;
    _data_bd = new DataBase(db);
    command_s commands[] = {
        {"/register", &ftp_client_s::cmd_register},
        {"/login", &ftp_client_s::cmd_login},
        {"/get_contacts", &ftp_client_s::cmd_get_contacts},
        {"/add_contacts", &ftp_client_s::cmd_add_contacts},
        {"/start_call", &ftp_client_s::cmd_start_call},
        {"/stop_call", &ftp_client_s::cmd_stop_call},
        {"/disconnect", &ftp_client_s::cmd_disconnect}
    };

    int i = 0;
    for (;i < 7;i++) {
        if (tab_command.at(0) == commands[i].command)
            return (((*this).*commands[i].function)(tab_command));
    }
    // char *message = "-1";
    // if( send(this->fd, tab_command.at(0), tab_command.at(0).size , 0) < 0)
    //     printf("Send failed\n");
}

void ftp_client_s::parser_recv_message(char *clt_message)
{
    std::string word(clt_message);
    std::stringstream ss(clt_message);
    std::istream_iterator<std::string> begin(ss);
    std::istream_iterator<std::string> end;
    std::vector<std::string> vstrings(begin, end);
    // std::copy(vstrings.begin(), vstrings.end(), std::ostream_iterator<std::string>(std::cout, "\n"));
    for (int i = 0; i < vstrings.size(); i++) {
        std::cout << "line : " << vstrings.at(i) << std::endl;
    }
    command(vstrings);
    //free(tab_command);
}