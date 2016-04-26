/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Generating YACC Parser for Boolean Expressions
*/

%%
[ \t]       {  }
"true"      { 
			  yylval = 1;
			  return (TRUE);
			}
"false"     { 
			  yylval = 0;
			  return (FALSE);
			}	
"or"        { return (OR);}
"and"       { return (AND);}
"not"       { return (NOT);}
\n|.        { return yytext[0]; }
%%


