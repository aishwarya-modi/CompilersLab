%{
void yyerror (char *s);
#include <stdio.h>     
#include <stdlib.h>
%}

%start E
%token NUM PLUS MUL DIV MINUS NL

%%
E: F NL		{printf("Printing %d\n", $1);exit(0);}
	;
F: F PLUS G	{$$=$1+$3; }
	|G	{$$=$1;}
	;
G: G MINUS M	{$$=$1-$3; }
	|M	{$$=$1;}
	;
M: M MUL A	{$$=$1*$3; }
	|A	{$$=$1;}
	;
A: A DIV C	{$$=$1/$3; }
	|C	{$$=$1;}
	;
C: NUM	{$$=$1;}
	;
%%
int main(){
yyparse();
return 0;


}

int yywrap(){
return 1;
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 