/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Generating YACC Parser for Boolean Expressions
*/

%{
#include <stdio.h>
%}

%token TRUE FALSE AND OR NOT

%%
lines   :    lines bexpr '\n'  { printf("%d\n", $2); }
        |    lines '\n'
        |    /* empty */
        |    error '\n'    	   { yyerror("\nError!! Enter again:"); yyerrok;}
		;
        ;
bexpr   :    bexpr OR bterm    { $$ = $1 || $3; }         
		|    bterm         
		; 
bterm   :    bterm AND bfactor { $$ = $1 && $3; }
        |    bfactor
        ;
bfactor :    NOT bfactor 	   { $$ = !($2); }         
		|   '(' bexpr ')'      { $$ = $2; }
        |    TRUE              { $$ = 1; }
        |    FALSE        
        ;
%%
#include "lex.yy.c"
