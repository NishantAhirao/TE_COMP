%{
#include "y.tab.h" 
%}

%%
int|float|char|double return DataType;
"," return Comma;
";" return SemiColon;
[a-zA-Z][a-zA-Z0-9_]* return Identifier;
[0-9]+ return Number;
"=" return AssignmentOperator;
%%

int yywrap()
{
	return 1;
}
