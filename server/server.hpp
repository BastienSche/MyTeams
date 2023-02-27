#ifndef BABEL__
#define BABEL__

#include <iostream>
#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <stdbool.h>
#include <assert.h>
#include <netdb.h>
#include <sys/time.h>
#include <string.h>
#include <uuid/uuid.h>
#include <time.h>
#include <vector>
#include <sstream>
#include <iterator>
#include <sqlite3.h>
//#include "../portaudio.h"

static int callback(void *NotUsed, int argc, char **argv, char **azColName);
static int callback_print(void *data, int argc, char **argv, char **azColName);
static int callback_login(void *data, int argc, char **argv, char **azColName);
static int callback_update(void *data, int argc, char **argv, char **azColName);
static int callback_check_name_contact(void *data, int argc, char **argv, char **azColName);
static int callback_check_contact_contact(void *data, int argc, char **argv, char **azColName);
static int callback_call(void *data, int argc, char **argv, char **azColName);
static int callback_callSetup(void *data, int argc, char **argv, char **azColName);

typedef struct user_s
{
    char *name;
    char *uuid;
} user_t;

// class user
// {
//     private:
//     protected:
//     public:
//         std::string name;
//         std::vector<std::vector<std::string> > tabOfName;
//         void setVectorFordata(std::vector<std::vector<std::string> >, std::string);
// }

class DataBase
{
private:
    /* data */
public:
    sqlite3 *_db;

    std::string _save;
    DataBase(sqlite3 *);
    ~DataBase();

    void open();
    void close();
    void create(char*);
    void insert(char*, std::string, std::string);
    //void insert_contact(std::string, std::string);
    int select(char*, const char*);
    int select_login(char *sql, const char *data);
    int update_contact(char *sql, std::string, const char *data, std::string);
    std::string get_name_for_call(char *q, const char* data);
    std::string get_contact(char *sql, const char *data);
    int update_call(char *sql);
    int CheckIfCall(char *sql);

};

class ftp_client_s
{
public:
    ftp_client_s(int clt_socket, unsigned int clt_ip, int n_por, char *ipchar);
    ~ftp_client_s();
    bool _call = false;
    unsigned int ip;
    char *_ipChar;
    std::string _name;
    bool is_logged;
    int fd;
    int dfd;
    int port;
    struct sockaddr_in *client_socket;
    user_t *user;
    int _id;
    DataBase *_data_bd;
    void client_process_command();
    void parser_recv_message(char *clt_message);
    void command(std::vector<std::string> tab_command);
    void cmd_register(std::vector<std::string>);
    void cmd_login(std::vector<std::string>);
    void cmd_get_contacts(std::vector<std::string>);
    void cmd_add_contacts(std::vector<std::string>);
    void cmd_start_call(std::vector<std::string>);
    void cmd_stop_call(std::vector<std::string>);
    void cmd_disconnect(std::vector<std::string>);
    void to_call(std::string);
    void to_no_call(std::string name);
    void setup_call();
    char *result(const char *data_1, const char *data_2, const char *_delim);
    struct command_s
    {
        char *command;
        void (ftp_client_s::*function)(std::vector<std::string>);
    } command_t;
    struct Person_s{
        int ip;
        std::string name;
        std::string mdp;
    }Person_t;
};
void sendToIpName(std::string ipName);

class Server
{
private:
    /* data */
public:
    struct sockaddr_in _server;
    int _srvSocket;
    std::vector<int> _cltSocket;
    Server(/* args */);
    ~Server();
    void createServSocket();
    void followServSocket();
    const char* GetAddress(const sockaddr_in& addr);
    void client_process(int clt_socket, struct sockaddr_in client_in, int n_port);
};

// class forTest
// {
// protected:
// private:
// public:
//     void createServSocket();
//     void followServSocket();

// }

#endif //BABEL__