##
## Makefile for my_ftp
## 
## Bastien SCHEKTMAN
##

SERVER_SRCS	= 	server/server.cpp	\
				server/command.cpp	\
				server/dataBase.cpp

SERVER_OBJS	= $(SERVER_SRCS:.cpp=.o)

CFLAGS		= -W -Wextra -Wall -I./includes/

CC		= g++

RM		= rm -rf

SERVER_NAME	= babel_server
CLIENT_NAME	= babel_client

all:		$(SERVER_NAME) $(CLIENT_NAME)

$(SERVER_NAME): $(SERVER_OBJS)
		$(CC) -o $(SERVER_NAME) $(SERVER_OBJS) -l sqlite3

$(CLIENT_NAME): $(CLIENT_OBJS)
		cd client && $(MAKE)
		cd client/babel_client.app/Contents/MacOS && mv babel_client ../../../../

clean:
		$(RM) $(SERVER_OBJS)
		$(RM) $(PROGRAM)

fclean:		clean
		$(RM) $(SERVER_NAME)
		$(RM) $(CLIENT_NAME)

re:		fclean all

.PHONY:		all clean fclean re

all: $(PROGRAM)