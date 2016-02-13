/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : String operations on words starting with consonants
*/

%{
#include<stdio.h>
#include<string.h>
FILE *f;
char str[20];
char c[2];
int i=0;
%}

consonants b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z|B|C|D|F|G|H|J|K|L|M|N|P|Q|R|S|T|V|W|X|Y|Z
vowels a|e|i|o|u|A|E|I|O|U

%%
({consonants})[a-zA-Z]* {
							strcpy(str,yytext);
							c[0] = str[0];
							for(i=0;i<yyleng;i++){
								str[i] = str[i+1];
							}
							fprintf(f,"%s%say",str,c);
						 }

({vowels})[a-zA-Z]* {fprintf(f,"%say",yytext);}

[ \t\n\\.'] {fprintf(f,"%s",yytext);}
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
