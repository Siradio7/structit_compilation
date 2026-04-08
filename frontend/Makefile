.PHONY: all run clean test

all: frontend_compiler

frontend_compiler: main.c parser.tab.c lex.yy.c
	gcc -o frontend_compiler main.c parser.tab.c lex.yy.c -lfl

parser.tab.c parser.tab.h: parser.y
	bison -d -o parser.tab.c parser.y

lex.yy.c: lexer.l parser.tab.h
	flex -o lex.yy.c lexer.l

run: frontend_compiler
	./frontend_compiler

test: frontend_compiler
	@for file in ../tests/valid/*.txt; do \
		./frontend_compiler < $$file 2>&1 | grep -q "Fin parsing." || exit 1; \
	done
	@for file in ../tests/invalid/*.txt; do \
		./frontend_compiler < $$file 2>&1 | grep -Eq "Erreur syntaxique|Erreur lexicale" || exit 1; \
	done
	@echo "Tous les tests sont OK"

clean:
	rm -f frontend_compiler lex.yy.c parser.tab.c parser.tab.h