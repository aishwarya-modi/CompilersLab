%{
void yyerror (char *s);
#include <stdio.h>     
#include <stdlib.h>
%}

%union 
{
        int number;
	char *string;
}

%start E
%token <string> NUM
%token <string> ID
%token <string> UNDER
%token NL
%type <string> E
%type <string> T



%%
E: ID T NL	{printf("string valid");exit(0);}
	;
T: NUM T 
	|ID T
	|UNDER T
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