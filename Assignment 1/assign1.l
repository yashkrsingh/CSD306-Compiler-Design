/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Extracting function names and signature
*/

%{
FILE *f;
#include<stdio.h>
#include<stdlib.h>
char buffer[20];
int length,count;
%}

blanks 					[ \t]*
digit 					[0-9]
letter 					[a-zA-Z]
delimiter 				[;]
content 				[^\\{\\}]
newline 				[\n]*
identifier 				({letter}|_)({letter}|{digit}|_)*
datatypes 				"int"|"float"|"double"|"char"|"long"|"short"|"void"
functionsignature 		"("({blanks}|{functionparameters})")"
functionparameters 		({datatypes}{blanks}{identifier}{blanks}","{blanks})*{datatypes}{blanks}{identifier}
prototype 				{datatypes}{blanks}{identifier}{functionsignature}{delimiter}
definition 				{datatypes}{blanks}{identifier}{functionsignature}{newline}{blanks}"{"({content}|{newline})*"}"

%x FNAME ARGLIST IGNORE

%%
{prototype}             {	fprintf(f,"%s\n", yytext);}
{definition}            {	fprintf(f,"%s\n", yytext);}

<INITIAL>.|\n
^"//START" 				{   BEGIN(FNAME);}
<FNAME>{datatypes} 		{   strcpy(buffer,yytext); 
							length=yyleng;
						}
<FNAME>{blanks}
<FNAME>{identifier} 	{
							buffer[length]='\0'; 
							printf("\nFunction: %s\nReturn Type: %s\n",yytext,buffer);
							printf("Arguments: \n");
							count = 0;
						}
<FNAME>"(" 				{   BEGIN(ARGLIST);}
<ARGLIST>{datatypes} 	{   strcpy(buffer,yytext); 
							length=yyleng;
						}
<ARGLIST>{blanks}
<ARGLIST>{identifier} 	{
							buffer[length]='\0'; 
							printf("%s is of type %s\n",yytext,buffer);
							count++;
						}
<ARGLIST>","
<ARGLIST>")" 			{
							if(count==0){
								printf("No Arguments\n");
							}
						}
<ARGLIST>";"			{	BEGIN(FNAME);}
<ARGLIST>"{" 			{	BEGIN(IGNORE);}
<IGNORE>[^\\}]
<IGNORE>"}" 			{	BEGIN(FNAME);}       
<FNAME>.|\n	
%%

int yywrap(){
	return 1;
}

int main(){
	yyin = fopen("read.c","r");
	f = fopen("write.txt","w");
	fprintf(f,"//START\n");
	yylex();
	fclose(f);
	yyin = fopen("write.txt","r");
	yylex();
}
