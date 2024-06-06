NAME := libasm.a
SRCS := ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s
OBJS := $(SRCS:.s=.o)
CC := nasm
FLAGS := -f elf64
RM := rm -f

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)
	gcc -o test main.c -L. -lasm

%.o: %.s
	$(CC) $(FLAGS) $<

clean:
	$(RM) $(OBJS) || true

fclean: clean
	$(RM) $(NAME) || true
	$(RM) test || true

re: fclean all

.PHONY: all clean fclean re
