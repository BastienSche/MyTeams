#include "Client.hpp"

std::vector<std::string> StrToVector(std::string str)
{
    std::vector<std::string> res;
    std::string segment;
    std::stringstream stream(str);
    while(std::getline(stream, segment, ';')) 
        res.push_back(segment);
    return res;
}

ResponseHandler::ResponseHandler(Client *client): _cli(client)
{

}

ResponseHandler::~ResponseHandler()
{

}

bool ResponseHandler::Apply(BabelProtocol::Response response)
{
    return _handleResponse[response.cmd-100](response);
}