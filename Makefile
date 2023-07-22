NAME_SERVER = server
NAME_CLIENT = client

SERVER = server.c
CLIENT = client.c

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: $(NAME_SERVER) $(NAME_CLIENT)

$(NAME_SERVER): 
	$(CC) $(CFLAGS) $(SERVER) -o $(NAME_SERVER)

$(NAME_CLIENT):
	$(CC) $(CFLAGS) $(CLIENT) -o $(NAME_CLIENT)

clean:
	rm -f $(NAME_SERVER) $(NAME_CLIENT)

fclean: clean

re: fclean all
