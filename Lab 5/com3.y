/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Generating YACC Parser for Palindromes
*/

%{
#include <stdio.h>
int i;
%}

%token error
%glr-parser

%%
S		: 	palin '\n'			{ i=1; return 1; }
		| 	error '\n'			{ i=0; return 1; }
		;
palin   :   'a'    		 
        |   'b' 		            
        |   'a' palin 'a' 
        |   'b' palin 'b' 
		|
        ;
%%

#include "lex.yy.c"

int yyerror(char* s){
	return 0;
}

int main(){
	while(1){
		yyparse();
		if(i==1)
			printf("Matched\n");
		else
			printf("Not Matched\n");
	}
}
