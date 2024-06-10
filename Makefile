NAME := libasm.a
SRCS := ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS := $(SRCS:.s=.o)
CC := nasm
FLAGS := -f elf64 -g
RM := rm -f

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)
	clang -Wall -Wextra -Werror -g -o test main.c -L. -lasm

%.o: %.s
	$(CC) $(FLAGS) $<

clean:
	$(RM) $(OBJS) || true

fclean: clean
	$(RM) $(NAME) || true
	$(RM) test || true

re: fclean all

.PHONY: all clean fclean re
