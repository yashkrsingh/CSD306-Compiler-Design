/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Replacing 'float' with 'double'
*/

%{ 
#include<stdio.h>
#include<string.h>
FILE *f;
%}

%%
[a-zA-Z]+ {
			  if(strcmp("float",yytext) == 0){
				fprintf(f,"%s","double");
			  }
			  else{
				fprintf(f,"%s",yytext);		
			  }
		  }

[^a-zA-Z]* {fprintf(f,"%s",yytext);}
%%

int yywrap(){
	return 1;
}

int main(){
	yyin = fopen("read.c","r");
	f = fopen("write.c","w");
	yylex();
	return 0;
}
