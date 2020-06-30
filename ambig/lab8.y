%{
void yyerror (char *s);
#include <stdio.h>     
#include <stdlib.h>
%}

%start E
%token NUM PLUS MUL DIV MINUS NL

%%
E: T NL		{printf("Printing %d\n", $1);exit(0);}
	;
T: T PLUS T	{$$=$1+$3; }
	|T MINUS T	{$$=$1-$3; }
	|T MUL T	{$$=$1*$3; }
	|T DIV T	{$$=$1/$3; }
	;
T: NUM	{$$=$1;}
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