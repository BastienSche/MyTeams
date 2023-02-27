#include "server.hpp"

static int ERROR = -1;
static std::string SAVE("");

DataBase::DataBase(sqlite3 *db)
{
    _db = db;
}

DataBase::~DataBase()
{
}

static int callback(void *NotUsed, int argc, char **argv, char **azColName) {
   int i;
   for(i = 0; i<argc; i++) {
      printf("IXI :%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
   }
   printf("\n");
   return 0;
}

static int callback_call(void *data, int argc, char **argv, char **azColName) {
   int i;

   for(i = 0; i<argc; i++) {
        std::string sve(argv[i]);
        SAVE = sve;
   }
   return 0;
}

static int callback_check(void *data, int argc, char **argv, char **azColName){
   int i;

    for(i = 0; i<argc; i++){
        // std::cout << "AAA == " <<i<<" "<< argv[i] << std::endl;
        if (!std::strcmp((char*)data,argv[i])) {
            ERROR = 7;
        }
    }
   return 0;
}

static int callback_login(void *data, int argc, char **argv, char **azColName){
    int i;
    std::string s((char*)data);
    std::stringstream ss(s);
    std::istream_iterator<std::string> begin(ss);
    std::istream_iterator<std::string> end;
    std::vector<std::string> vstrings(begin, end);
    for(i = 0; i<argc; i++){
        // std::cout << "ICI :: " <<argv[i]<< " et "<<vstrings.at(1)<<std::endl;
        for (int aa = 0; aa < vstrings.size(); aa++) {
            // std::cout << " VSTRING =  " << vstrings.at(aa)<<std::endl;
        }
        if (!std::strcmp(vstrings.at(1).c_str(),argv[i])) {
            ERROR = 0;
        } else {
            ERROR = 4;
        }
        // std::cout << "ERROR = " << ERROR << std::endl;
    }
   return 0;
}

static int callback_update(void *data, int argc, char **argv, char **azColName){
    int i;
    // std::cout << "ICIss :: " <<argc<< std::endl;
    for(i = 0; i<argc; i++){
        // std::cout << "ICIss  :: " <<argv[i]<< std::endl;
        std::string sve(argv[i]);
        SAVE = sve;
    }
    return 0;
}

static int callback_check_name_contact(void *data, int argc, char **argv, char **azColName) {
    int i;

    for(i = 0; i<argc; i++){
        // std::cout << "HER : " << (char*)data << " et " << argv[i] << std::endl;
        if (!std::strcmp((char*)data,argv[i])) {
            ERROR = 0;
            return (0);
        }
    }
   return 0;
}

static int callback_callSetup(void *data, int argc, char **argv, char **azColName) {
    int i;

    for(i = 0; i<argc; i++){
        // std::cout << "HER NB : " <<  argv[i] << std::endl;
        if (!std::strcmp("1",argv[i])) {
            ERROR = 1;
            return (0);
        } else if (!std::strcmp("0",argv[i])) {
            ERROR = 0;
            return (0);
        } else {
            ERROR = 84;
            return (0);
        }
    }
   return 0;
}

static int callback_check_contact_contact(void *data, int argc, char **argv, char **azColName) {
    int i;
    
    for(i = 0; i<argc; i++){
        std::string s(argv[i]);
        std::stringstream ss(s);
        std::istream_iterator<std::string> begin(ss);
        std::istream_iterator<std::string> end;
        std::vector<std::string> vstrings(begin, end);
        std::copy(vstrings.begin(), vstrings.end(), std::ostream_iterator<std::string>(std::cout, "\n"));
        // std::cout << "HOOR : " << (char*)data << " et " << argv[i] << std::endl;
        for (int a = 0; a < vstrings.size(); a++) {
            if (!std::strcmp((char*)data,vstrings.at(a).c_str())) {
                ERROR = 3;
                return (0);
            }
        }
    }
   return 0;
}

void DataBase::open()
{
    int rc;

    rc = sqlite3_open ( "test.db", &_db);
    if (rc) {
        fprintf (stderr, "Impossible d'ouvrir la base de données:%s \n", sqlite3_errmsg (_db));
        exit (84);
    } else {
        fprintf (stderr, "base de données ouverte avec succès\n");
    }
}

void DataBase::close()
{
    sqlite3_close(_db);
}

void DataBase::create(char *sql)
{
    int rc;
    char * zErrMsg = 0;

    rc = sqlite3_exec(_db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else {
        fprintf(stdout, "Table created successfully\n");
    }
}

void DataBase::insert(char *ip, std::string name, std::string mdp)
{
    std::string pi(ip);
    int rc;
    std::string contacts("");
    const char* data = "Callback function called :\n";
    std::string insert("INSERT INTO USER (ip, name, contact, mdp, call) VALUES(?,?,?,?,?)");
    sqlite3_stmt * insertStmt = nullptr;
    char * zErrMsg = 0;
    int call = 0;

    std::cout << "sqlite3_prepare()" << std::endl;
    rc = sqlite3_prepare_v2(_db, insert.data(), insert.size(), &insertStmt, nullptr);
    /* Et, comme on a un code de vérification, autant l'utiliser */
    if(rc!= SQLITE_OK){
         /* n'oublions pas de fermer la base de données */
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }
    std::cout << "sqlite3_bind_text()" << pi << std::endl;
    rc = sqlite3_bind_text(insertStmt,1, const_cast<char*>(pi.c_str()), pi.size(), SQLITE_TRANSIENT); 
    if(rc != SQLITE_OK){
        /* il faut libérer la mémoire de insertStmt */
        sqlite3_finalize(insertStmt);
        /* on ferme la db */
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }
    std::cout << "sqlite3_bind_text()" << name << std::endl;
    rc = sqlite3_bind_text(insertStmt,2, const_cast<char*>(name.c_str()), name.size(), SQLITE_TRANSIENT); 
    if(rc != SQLITE_OK){
        /* il faut libérer la mémoire de insertStmt */
        sqlite3_finalize(insertStmt);
        /* on ferme la db */
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }
    std::cout << "sqlite3_bind_text()" << contacts << std::endl;
    rc = sqlite3_bind_text(insertStmt,3, const_cast<char*>(contacts.c_str()), contacts.size(), SQLITE_TRANSIENT); 
    if(rc != SQLITE_OK){
        /* il faut libérer la mémoire de insertStmt */
        sqlite3_finalize(insertStmt);
        /* on ferme la db */
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }
    std::cout << "sqlite3_bind_text()" << mdp << std::endl;
    rc = sqlite3_bind_text(insertStmt,4, const_cast<char*>(mdp.c_str()), mdp.size(), SQLITE_TRANSIENT); 
    if(rc != SQLITE_OK){
        /* il faut libérer la mémoire de insertStmt */
        sqlite3_finalize(insertStmt);
        /* on ferme la db */
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }
    std::cout << "sqlite3_bind_int() : " << call << std::endl;
    rc = sqlite3_bind_int(insertStmt,5, call);
    if(rc != SQLITE_OK) {
       /* il faut libérer la mémoire de insertStmt */
      sqlite3_finalize(insertStmt);
       /* on ferme la db */
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }
    std::cout << "sqlite3_step()" << std::endl;
    rc = sqlite3_step(insertStmt);
    if(rc != SQLITE_DONE){ // si la requete ne renvoie pas DONE, y a eu un problème
        /* créons un message d'erreur explicite */
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        /* il faut fermer la base de donnée malgré tout */
        sqlite3_close(_db);
   }
}

// void DataBase::insert_contact(std::string contacts, std::string name)
// {
//     int rc;
//     const char* data = "Callback function called :\n";
//     std::string insert("INSERT contact INTO USER VALUES(?) WHERE NAME = '%s'",name.c_str());
//     sqlite3_stmt * insertStmt = nullptr;
//     char * zErrMsg = 0;

//     std::cout << "sqlite3_prepare()" << std::endl;
//     rc = sqlite3_prepare_v2(_db, insert.data(), insert.size(), &insertStmt, nullptr);
//     /* Et, comme on a un code de vérification, autant l'utiliser */
//     if(rc!= SQLITE_OK){
//          /* n'oublions pas de fermer la base de données */
//         fprintf(stderr, "SQL error: %s\n", zErrMsg);
//         sqlite3_free(zErrMsg);
//     }
//     std::cout << "sqlite3_bind_text()" << contacts << std::endl;
//     rc = sqlite3_bind_text(insertStmt,4, const_cast<char*>(contacts.c_str()), contacts.size(), SQLITE_TRANSIENT); 
//     if(rc != SQLITE_OK){
//         /* il faut libérer la mémoire de insertStmt */
//         sqlite3_finalize(insertStmt);
//         /* on ferme la db */
//         fprintf(stderr, "SQL error: %s\n", zErrMsg);
//         sqlite3_free(zErrMsg);
//     }
//     std::cout << "sqlite3_step()" << std::endl;
//     rc = sqlite3_step(insertStmt);
//     if(rc != SQLITE_DONE){ // si la requete ne renvoie pas DONE, y a eu un problème
//         /* créons un message d'erreur explicite */
//         fprintf(stderr, "SQL error: %s\n", zErrMsg);
//         sqlite3_free(zErrMsg);
//         /* il faut fermer la base de donnée malgré tout */
//         sqlite3_close(_db);
//    }
// }

int DataBase::update_call(char *sql) {
    int rc;
    char * zErrMsg = 0;
    std::cout << "sqlite3_execs()" << std::endl;
    rc = sqlite3_exec(_db, sql, 0, 0, &zErrMsg);

    if( rc != SQLITE_OK ) {
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else {
        fprintf(stdout, "Operation done successfully\n");
    }
    return (0);
}

int DataBase::CheckIfCall(char *sql)
{
    int rc;
    char * zErrMsg = 0;
    std::cout << "sqlite3_exec()" << std::endl;
    rc = sqlite3_exec(_db, sql, callback_callSetup, 0,&zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else {
        fprintf(stdout, "Operation done successfullsy\n");
    }
    if (ERROR == 0) {
        std::cout << "Call = 0" << std::endl;
        ERROR = -1;
        return (0);
    } else if (ERROR == 1) {
        std::cout << "call = 1" << std::endl;
        ERROR = -1;
        return (1);
    } else if (ERROR == 84) {
        std::cout << "call = EROR 84" << std::endl;
        ERROR = -1;
        return (84);
    }
    else
        return (-1);
}

int DataBase::update_contact(char *sql, std::string cmd, const char *data, std::string name)
{
    std::string sve;
    int rc;
    char q2[999];
    char q3[999];
    char q4[999];
    std::string qq2;
    char * zErrMsg = 0;

    q3[sizeof q3 - 1] = '\0';
    snprintf(q3,sizeof q3 - 1,"SELECT name FROM USER");

    std::cout << "sqlite3_exec()" << std::endl;
    rc = sqlite3_exec(_db, q3, callback_check_name_contact, (void*)data, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else {
        fprintf(stdout, "Operation done successfullsy\n");
    }

    q4[sizeof q3 - 1] = '\0';
    snprintf(q4,sizeof q4 - 1,"SELECT contact FROM USER WHERE NAME = '%s'",name.c_str());

    std::cout << "sqlite3_exec()" << std::endl;
    rc = sqlite3_exec(_db, q4, callback_check_contact_contact, (void*)data, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else {
        fprintf(stdout, "Operation done successfullsy\n");
    }

    std::cout << "sqlite3_exec()" << std::endl;
    rc = sqlite3_exec(_db, sql, callback_update, (void*)data, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else {
        fprintf(stdout, "Operation done successfullsy\n");
    }
    if (ERROR == 0) {
        sve = SAVE;
        SAVE.clear();
        qq2 = sve + ' ' + cmd;
        q2[sizeof q2 - 1] = '\0';
        snprintf(q2,sizeof q2 - 1,"UPDATE USER set contact = '%s' where NAME = '%s'",qq2.c_str(),name.c_str());
        // std::cout << "SAVE = "<< sve << std::endl;

        std::cout << "sqlite3_execs()" << std::endl;
        rc = sqlite3_exec(_db, q2, 0, 0, &zErrMsg);
    
        if( rc != SQLITE_OK ) {
            fprintf(stderr, "SQL error: %s\n", zErrMsg);
            sqlite3_free(zErrMsg);
        } else {
            fprintf(stdout, "Operation done successfully\n");
        }
        ERROR = - 1;
        return (0);
    } else if (ERROR == -1) {
        ERROR = - 1;
        return (3);
    } else if (ERROR == 3) {
        ERROR = - 1;
        return (3);
    }
}

std::string DataBase::get_contact(char *sql, const char *data)
{
    std::string sve("");
    int rc;
    char * zErrMsg = 0;
    std::cout << "sqlite3_exec()" << std::endl;
    rc = sqlite3_exec(_db, sql, callback_update, (void*)data, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else {
        fprintf(stdout, "Operation done successfullsy\n");
    }
    sve = SAVE;
    SAVE.clear();
    // std::cout << "ici  : " << sve << std::endl;
    return (sve);
}

std::string DataBase::get_name_for_call(char* sql, const char *data) {
    std::string sve("");
    int rc;
    char * zErrMsg = 0;
    std::cout << "sqlite3_exec()" << std::endl;
    rc = sqlite3_exec(_db, sql, callback_call, (void*)data, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else {
        fprintf(stdout, "Operation done successfullsy\n");
    }
    sve = SAVE;
    SAVE.clear();
    // std::cout << "IP : " << sve << std::endl;
    return (sve);
}

int DataBase::select(char *sql, const char *data)
{
    int rc;
    char * zErrMsg = 0;

    std::cout << "sqlite3_exec()" << std::endl;
    rc = sqlite3_exec(_db, sql, callback_check, (void*)data, &zErrMsg);

    if( rc != SQLITE_OK ) {
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else {
        fprintf(stdout, "Operation done successfully\n");
    }
    if (ERROR == 7) {
        ERROR = -1;
        return (7);
    } else {
        ERROR = -1;
        return (0);
    }
}

int DataBase::select_login(char *sql, const char *data)
{
    int rc;
    char * zErrMsg = 0;
    std::cout << "sqlite3_exec_login() ET " << sql << std::endl;
    rc = sqlite3_exec(_db, sql, callback_login, (void*)data, &zErrMsg);
    if( rc != SQLITE_OK ) {
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    } else
        fprintf(stdout, "Operation done successfully\n");
    if (ERROR == 0) {
        ERROR = -1;
        return (0);
    } else if (ERROR == 4) {
        ERROR = -1;
        return (4);
    } else {
        ERROR = -1;
        return (1);
    }
}