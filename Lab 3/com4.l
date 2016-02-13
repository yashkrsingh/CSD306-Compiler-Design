/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Counting lines, characters and words
*/

%{
FILE *f;
int charcount=0, wordcount=0, linecount=0;
%}

%%
[a-zA-Z]+ {	
		 		charcount += yyleng;
				wordcount++;
		  }
\n {linecount++;}
%%

int yywrap(){
	return 1;
}
int main(){
	yyin = fopen("read.txt","r");
	yylex();
	printf("\nNumber of characters: %d", charcount);
	printf("\nNumber of words: %d", wordcount);
	printf("\nNumber of lines: %d", linecount);
	printf("\n");
	return 0;
}

