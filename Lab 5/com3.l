%option noyywrap

%%
[ab\n] 		{ return yytext[0]; }
. 	   		{ 
			  fprintf(stderr, "Lexical Error\n"); 
			  exit(1); 
			}
%%
