%{
#include "lab8.tab.h"
%}

%%
[0-9]+                 {yylval = atoi(yytext); return NUM;}
[+]					{return PLUS;}
[-]					{return MINUS;}
[*]					{return MUL;}
[/]					{return DIV;}
[\n]					{return NL;}
.                      {ECHO; yyerror ("unexpected character");}

%%