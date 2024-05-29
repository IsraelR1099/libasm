all: hello.o
	ld -macos_version_min 10.15.7 -static -o hello hello.o

hello.o: hello.s
	nasm -f macho64 hello.s -o hello.o
