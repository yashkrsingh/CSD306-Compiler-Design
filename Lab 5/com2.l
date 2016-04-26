/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Generating YACC Parser for Lists
*/

letter    [a-zA-Z]

%%
[ \t]       {}
{letter}    { 
			  yylval= yytext[0]; 
			  return ID; 
			}
\n|.        { return yytext[0]; }
%%

