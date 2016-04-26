/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Identify reserved keywords and identifiers
*/

%{
#include<stdio.h>
#include<stdlib.h>
#include<strings.h>
int identifier,sel,from,where;
%}

alphabet [a-zA-Z]

%%
({alphabet})[a-zA-z0-9]+ {
						  if(strcasecmp("select",yytext) == 0){
						  	sel++;
						  }
						  else if(strcasecmp("from",yytext) == 0){
						  	from++;
						  }
						  else if(strcasecmp("where",yytext) == 0){
						  	where++;
						  }
						  else{
							identifier++;		
						  }
					 }
[\\*=";\n\t ]  		 ;
[0-9] 				 ;
%%

int yywrap(){
	return 1;
}

int main(){
	yyin = fopen("read.sql","r");
	yylex();
	printf("\nNumber of 'SELECT' keywords : %d",sel);
	printf("\nNumber of 'FROM' keywords   : %d",from);
	printf("\nNumber of 'WHERE' keywords  : %d",where);
	printf("\nNumber of identifiers       : %d",identifier);
	printf("\n");
}
