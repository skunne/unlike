CC=g++
NAME=unlike
SRC=main.cpp ulk_init_end.cpp
OBJ=$(addprefix $(OBJDIR)/,$(SRC:.cpp=.o))
OBJDIR=build
SRCDIR=src
CFLAGS=-Wall -Wextra -Werror
INCLUDES=-I includes/
LIBPATHS=
LIBS=-lncurses

all: $(NAME)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp $(OBJDIR)
	$(CC) -c -o $@ $(CFLAGS) $< $(INCLUDES)

$(NAME): $(OBJ)
	$(CC) -o $(NAME) $(OBJ) $(LIBPATHS) $(LIBS)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -f -- $(OBJ)

fclean: clean
	rm -f -- $(NAME)

re: fclean all

.PHONY: all clean fclean re
