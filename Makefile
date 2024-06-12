NAME := libasm.a
SRCS := ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS := $(SRCS:.s=.o)
ASM_CC := nasm
CC := clang
ASM_FLAGS := -f elf64 -g
CFLAGS := -Wall -Wextra -Werror -g
RM := rm -f

all: $(NAME) testasm

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

%.o: %.s libasm.h
	$(ASM_CC) $(ASM_FLAGS) $<

main.o: main.c libasm.h
	$(CC) $(CFLAGS) -c $< -o $@

testasm: $(NAME) main.o
	$(CC) $(CFLAGS) -o $@ main.o -L. -lasm

clean:
	$(RM) $(OBJS) main.o || true

fclean: clean
	$(RM) $(NAME) || true
	$(RM) testasm || true

re: fclean all

.PHONY: all clean fclean re
