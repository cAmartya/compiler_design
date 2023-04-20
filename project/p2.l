%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "y.tab.h"
	extern FILE *yyin;
	extern FILE *yyout;
	
	int lineno = 1; // initialize to 1
	void ret_print(char *token_type);
	void yyerror();
%}


%%
"char"           { return CHAR; }
"int"            { return INT; }
"float"          { return FLOAT; }
"get"            { return GET; }
"put"            { return PUT; }
"do"             { return DO; }
"while"          { return WHILE; }
[0-9]+           { yylval.int_val = atoi(yytext); return INTEGER; }
[a-zA-Z][a-zA-Z0-9]* { yylval.str_val = strdup(yytext); return IDENTIFIER; }
[ \t\n]          /* ignore whitespace */
.                { yyerror("Unknown character"); }

%%
