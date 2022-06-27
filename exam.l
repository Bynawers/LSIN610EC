%{

#include "exam.tab.h"

%}

%%
[ \t]	{;} /* Ignore les espaces */
\n		{ ; } /* fin de traitement par yylex */
. 		{return yytext[0];}
%%
