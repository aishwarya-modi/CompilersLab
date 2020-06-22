%{
#include "lab7.tab.h"
%}

%%
[0-9]           {yylval.number = atoi(yytext); return NUM;}
[a-zA-Z]	{yylval.string=strdup(yytext);return ID;}
[_]		{yylval.string=strdup(yytext);return UNDER;}
[\n]					{return NL;}
.                      {ECHO; yyerror ("unexpected character");}

%%