#---------------------------------------------------#
#                   MINITALK MAKEFILE               #
#---------------------------------------------------#

# Library Name #
NAME	=	minitalk.a

# Define some color codes for pretty printing
RED = \033[91m
YELLOW = \033[93m
WHITE = \033[97m
GREEN = \033[92m
DEF_CL = \033[m
RESET  = \e[0m
CYAN = \033[96m

#---------------------------------------------------#
#                   COMPILER SETTINGS               #
#---------------------------------------------------#

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -Werror

# Command to remove files
RM = rm -f

# Command to run norminette
NORM = norminette -R CheckForbiddenSourceHeader .

#---------------------------------------------------#
#                   SOURCE FILES                    #
#---------------------------------------------------#

# Executable Names
CLIENT	=	client
SERVER	=	server

# libft Variables
LIBFT		=	./libft/libft.a
LIBFT_DIR	=	./libft

# ft_printf Variables
FT_PRINTF = ./ft_printf/libftprintf.a
FT_PRINTF_DIR = ./ft_printf

# Mandatory Variables
SRC_C	=	client.c
SRC_S	=	server.c
INC		=	-I. -I$(LIBFT_DIR) -I$(LIBFT_DIR)/stack -I$(LIBFT_DIR)/GNL -I$(FT_PRINTF_DIR)

_SUCCESS	=	[$(GREEN)SUCCESS$(RESET)]
_INFO		=	[$(YELLOW)INFO$(RESET)]
_READY 		= 	$(GREEN)ready.$(RESET)
_REMOVED    =   $(YELLOW)removed.$(RESET)

# Debugger
ifeq ($(DEBUG), 1)
	D_FLAG	=	-g
endif

# Fsanitize
ifeq ($(SANITIZE), 1)
	D_FLAG	=	-fsanitize=leak -g
endif

#---------------------------------------------------#
#                   MAIN TARGET                     #
#---------------------------------------------------#

all: $(SERVER) $(CLIENT)

$(NAME): all

$(SERVER): $(LIBFT) $(FT_PRINTF)
	@ $(CC) $(D_FLAG) $(CFLAGS) $(SRC_S) $(LIBFT) $(FT_PRINTF) $(INC) -o $(SERVER)
	@printf "$(_SUCCESS) server $(_READY)\n"

$(CLIENT): $(LIBFT) $(FT_PRINTF)
	@ $(CC) $(D_FLAG) $(CFLAGS) $(SRC_C) $(LIBFT) $(FT_PRINTF) $(INC) -o $(CLIENT)
	@printf "$(_SUCCESS) client $(_READY)\n"

$(LIBFT):
	@ $(MAKE) DEBUG=$(DEBUG) -C $(LIBFT_DIR)

$(FT_PRINTF):
	@ $(MAKE) -C $(FT_PRINTF_DIR)

# Rule to clean up object files and dependencies
clean:
	@ $(RM) $(CLIENT) $(SERVER)
	@printf "$(_INFO) client $(_REMOVED)\n"
	@printf "$(_INFO) server $(_REMOVED)\n"

# Rule to remove the compiled library file and cleaned object files
fclean:
	@ $(MAKE) fclean -C $(LIBFT_DIR)
	@ $(MAKE) fclean -C $(FT_PRINTF_DIR)
	@ $(RM) $(CLIENT) $(SERVER)
	@printf "$(_INFO) client $(_REMOVED)\n"
	@printf "$(_INFO) server $(_REMOVED)\n"

# Rule to completely rebuild the program from scratch
re: fclean all

mandatory:	$(CLIENT) $(SERVER)

m : mandatory

# Rule to tell make that the listed targets do not correspond to actual files.
.PHONY: all clean fclean re mandatory m bonus b $(NAME) $(LIBFT) $(FT_PRINTF)
