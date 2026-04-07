%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>

int line = 1;
%}

%option noyywrap

DIGIT      [0-9]
LETTER     [a-zA-Z_]
ID         {LETTER}({LETTER}|{DIGIT})*

%%

"int"           { return INT; }
"void"          { return VOID; }
"if"            { return IF; }
"else"          { return ELSE; }
"while"         { return WHILE; }
"for"           { return FOR; }
"struct"        { return STRUCT; }
"extern"        { return EXTERN; }
"sizeof"        { return SIZEOF; }
"return"        { return RETURN; }

"=="            { return EQ_OP; }
"!="            { return NE_OP; }
"<="            { return LE_OP; }
">="            { return GE_OP; }
"->"            { return PTR_OP; }
"&&"            { return AND_OP; }
"||"            { return OR_OP; }

"="             { return '='; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
";"             { return ';'; }
","             { return ','; }
"("             { return '('; }
")"             { return ')'; }
"{"             { return '{'; }
"}"             { return '}'; }
"."             { return '.'; }
"<"             { return '<'; }
">"             { return '>'; }
"&"             { return '&'; }


{DIGIT}+ {
    return CONSTANT;
}


{ID} {
    return IDENTIFIER;
}


"//".*          {  }
"/*"([^*]|\*+[^*/]|\n)*\*+"/"   {  }


[ \t\r]+        {  }


\n              { line++; }


. {
    printf("Erreur lexicale ligne %d: caractère inattendu '%s'\n", line, yytext);
}

%%