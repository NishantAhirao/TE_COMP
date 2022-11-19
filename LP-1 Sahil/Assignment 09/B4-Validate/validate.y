%{
#include<stdio.h>
%}

%token ID DT SC COMMA NUM EQ
%%
start1:DT varlist SC {printf("valid\n");exit(0);};
varlist:ID EQ NUM
       |ID
       |varlist COMMA ID EQ NUM
       |varlist COMMA ID
       ;
%%
main()
{
	printf("Enter the exp: ");
	yyparse();
}
int yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
}


