%{

	#include<stdio.h>
	#include<string.h>
	struct st
	{
		char LEXeme[100];
		char name[25];
	}ST[100];

	int cnt=0;

%}

ID [a-zA-Z][a-zA-Z0-9]*
DIGIT [0-9]
Keywords abstract|assert|boolean|break|byte|switch|case|try|catch|finally|char|continue|default|do|double|if|else|enum|extends|final|float|for|implements|import|instanceOf|int|interface|long|native|new|package|private|protected|public|return|short|static|strictfp|super|synchronized|throw|throws|transient|void|volatile|while|goto|cons
%%
"import java.io.*;" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"All header files");}cnt++;

"System.out.println"|"public static void main(String[]args)" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"System Function");}cnt++;

{Keywords} {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Keyword");}cnt++;

{DIGIT}+ {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"const integer literal");}cnt++;

{DIGIT}+"."{DIGIT}+ {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"const float literal");}cnt++;

"\""[a-zA-Z ]+"\"" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"string literal");}cnt++;

{ID} {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"identifier");}cnt++;

"+"|"-"|"*"|"/"|"%" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Arithmetic OP");}cnt++;

"&"|"|"|"^"|"+"|"~" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Bitwise OP");}cnt++;

"<<"|">>" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Bitwise Shift OP");}cnt++;

"&&"|"||"|"!" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Logical OP");}cnt++;

"<"|">"|"<="|">=" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Relational OP");}cnt++;

"=="|"!=" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Equality OP");}cnt++;

"[" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"OSB");}cnt++;

"]" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"CSB");}cnt++;

"{" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"OCB");}cnt++;

"}" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"CCB");}cnt++;

"(" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"ORB");}cnt++;

")" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"CRB");}cnt++;

"," {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Comma");}cnt++;

";" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Semicolon");}cnt++;

"++" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Inc OP");}cnt++;

"--" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Dec OP");}cnt++;

"?" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Ternary OP");}cnt++;

"=" {strcpy(ST[cnt].LEXeme,yytext);strcpy(ST[cnt].name,"Assignment OP");}cnt++;

%%

int main()
{
	int i=0;
	char fnm[20];
	printf("Enter the File name:");
	scanf("%s",&fnm);
	yyin=fopen(fnm,"r");
	if(yyin==NULL)
	{
		printf("File not found.....");
	}
	yylex();
	printf("\t\t    TOKEN TABLE\n");
	printf("\n\t   LEXeme\t\t\tNAME\n");
	printf("\t____________\t\t___________________\n");
	for(i=0;i<cnt;i++)
	{
		printf("\n\t%s",ST[i].LEXeme);
		printf("\t\t\t%s",ST[i].name);
	}
	printf("\n");
}
int yywrap()
{ 
  return 1;
}





