%{
#include<stdio.h>
#include<stdlib.h>
%}

%token Identifier DataType SemiColon Comma Number AssignmentOperator

%%
start1 : DataType varlist SemiColon {
					printf("Valid\n");
					exit(0);
					};
varlist : Identifier AssignmentOperator Number
       |Identifier
       |varlist Comma Identifier AssignmentOperator Number
       |varlist Comma Identifier
       ;
%%

int main()
{
	
	printf("Enter the expression: ");
	yyparse();
return 0;
}
int yyerror(char *s)
{
printf("Invalid Expression\n");
exit(0);
}
