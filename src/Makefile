# Simple Makefile

CC=/usr/bin/g++

all:  bison-config flex-config nutshell
#all:   flex-config nutshell

bison-config:
	bison -d ns_parse.y

flex-config:
	flex ns_lex.l

nutshell:
	$(CC) nutshell.cpp ns_parse.tab.c lex.yy.c -o nutshell.o
#	$(CC) nutshell.cpp lex.yy.c -o Nutshell

clean:
#	rm ns_parse.tab.c ns_parse.tab.h lex.yy.c
	rm lex.yy.c