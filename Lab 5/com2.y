/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Generating YACC Parser for Lists
*/

%{
#include <stdio.h>
%}

%token ID

%%
lines   	:    lines list '\n' { printf("\n"); }
        	|    lines '\n'
        	|    /* empty */
        	|    error '\n'    { yyerror("\nError!! Enter again:"); yyerrok;}
        	;
list    	:    list ',' { printf(","); } section 
        	|    section    
        	;
section     :    '(' { printf("("); } list ')' { printf(")"); }
        	|    ID { printf("%c", yylval); }
        	;
%%
#include "lex.yy.c"


