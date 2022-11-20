%{
 
%}

%%
public|class|static|void|String|Args|System.out.println {printf("\n%s its a keyword\n\n",yytext);} 
[;|,] {printf("\n%s its a deliminators\n",yytext);}
main[()] {printf("\n%s : Main function\n\n",yytext);}
[a-zA-Z]+|[a-zA-Z]+[0-9]+ {printf(" %s its a identifier....\n",yytext);}
[{] {printf("%s :code block begin");}
[}] {printf("%s :code block end");} 
%%

main()
{
yyin=fopen("name.java","r");
yylex();
}
int yywrap()
{
return 1;
}

