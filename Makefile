NAME := libasm.a
SRCS := ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS := $(SRCS:.s=.o)
CC := nasm
FLAGS := -f elf64 -g
RM := rm -f

all: $(NAME)

$(NAME): $(OBJS) libasm.h
	ar rcs $(NAME) $(OBJS)
	clang -Wall -Wextra -Werror -g -o testasm main.c -L. -lasm

%.o: %.s libasm.h
	$(CC) $(FLAGS) $<

clean:
	$(RM) $(OBJS) || true

fclean: clean
	$(RM) $(NAME) || true
	$(RM) testasm || true

re: fclean all

.PHONY: all clean fclean re
