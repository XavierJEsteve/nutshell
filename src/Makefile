# Simple Makefile

CC=/usr/bin/cc

#all:  bison-config flex-config nutshell
all:   flex-config questshell

#bison-config:
#	bison -d nutshparser.y

flex-config:
	flex quest.l

questshell: 
	#$(CC) nutshell.c nutshparser.tab.c lex.yy.c -o nutshell.o
	$(CC) quest.c lex.yy.c -o questshell.o -lfl

clean:
	#rm nutshparser.tab.c nutshparser.tab.h lex.yy.c
	rm lex.yy.c