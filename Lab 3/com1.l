/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Removing whitespaces
*/

%{
FILE *f;
%}

%%
[ \t][ \t]+ {fprintf(f,"%s"," ");}
[^ \t]* {fprintf(f,"%s",yytext);}
%%

int yywrap(){
	return 1;
}

int main(){
	yyin = fopen("read.txt","r");
	f = fopen("write.txt","w");
	yylex();
	return 0;
}
