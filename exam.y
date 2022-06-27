%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>

#if YYBISON
int yylex();
int yyerror();
#endif

#define YEL "\e[0;33m"
#define WHT "\e[0;37m"

%}

%%

%%