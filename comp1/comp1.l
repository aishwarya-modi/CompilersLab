%{

#include<stdio.h>
int Upper=0;
int Lower=0;
%}

%%
[A-Z] {printf("Uppercase   ");Upper++;}
[a-z] {printf("Lowercase   ");Lower++;}
%%

int yywrap()
{
return 1;
}

main()
{
printf("ENTER a string\n");
yylex();
printf("Uppercase=%d and Lowercase=%d",Upper,Lower);
}
