%{

#include "exam.tab.h"

%}

%%
","           { return ADD; }
[A-Z]+[a-z]*  { yylval.chaine = strdup(yytext); return NOM; }
[0-9]+[0-9]*   { yylval.val = atoi(yytext); return NOTE; }
[ \t]	        {;}
\n		        { return FDL; }
.             { return yytext[0]; }
%%
