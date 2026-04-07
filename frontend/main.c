#include <stdio.h>

int yyparse();

int main() {
    printf("Début parsing...\n");
    yyparse();
    printf("Fin parsing.\n");
    return 0;
}