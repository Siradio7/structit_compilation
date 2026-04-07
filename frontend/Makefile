.PHONY: all run clean

all: frontend_compiler

frontend_compiler: main.c parser.tab.c lex.yy.c
	gcc -o frontend_compiler main.c parser.tab.c lex.yy.c -lfl

parser.tab.c parser.tab.h: parser.y
	bison -d -o parser.tab.c parser.y

lex.yy.c: lexer.l parser.tab.h
	flex -o lex.yy.c lexer.l

run: frontend_compiler
	./frontend_compiler

clean:
	rm -f frontend_compiler lex.yy.c parser.tab.c parser.tab.h