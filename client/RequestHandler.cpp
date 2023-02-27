#include "Client.hpp"

RequestHandler::RequestHandler(Client *client): _cli(client)
{
    f_req login = [this](BabelProtocol::Request request)
    {
        return true;
    };
    _sendRequest.push_back(login);

    f_req def = [this](BabelProtocol::Request request)
    {
        return true;
    };
    _sendRequest.push_back(def);
    _sendRequest.push_back(def);
}

RequestHandler::~RequestHandler()
{

}

bool RequestHandler::Send(BabelProtocol::Request request)
{
    return _sendRequest[request.cmd](request);
}