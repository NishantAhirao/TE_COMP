/*Write a program using Lex specification to implement lexical analysis phase of compiler to count no.of words, lines, characters of a given input file.*/

%{
	int tab=0,ws=0,words=0,c=0,nl=0,n=0,d=0,sp=0;
%}
%%
[\t] {tab++;}
[\n] {nl++;}
[ ] {ws++;}
[0-9]+ {n++;d+=yyleng;}
[a-zA-Z]+ {words++;c+=yyleng;}
[^ \t\n] {sp++;} 

%%

int main()
{
	char fnm[20];
	printf("Enter the File name:");
	scanf("%s",&fnm);
	yyin=fopen(fnm,"r");
	
	if(yyin==NULL)
	{
		printf("File not found.....");
	}
	yylex();
	printf("\nNumbers=%d\nDigits=%d\ntab=%d\nCharacter=%d\nWords=%d\nspace=%d\nNo of lines=%d\nNo of special symbols=%d",n,d,tab,c,words,ws,nl,sp);
	return 0;
}
int yywrap()
{
	return 1;
}
