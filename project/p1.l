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

%x ML_COMMENT

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}+{alnum}*
ICONST    "0"|[0-9]{digit}*
FCONST    "0"|{digit}*"."{digit}+
SCONST    \"{print}*\"

%%

"//".*              { printf("Eat up comment at line %d\n", lineno); } 

"/*"                { printf("Eat up comment from line %d ", lineno); BEGIN(ML_COMMENT); }
<ML_COMMENT>"*/"    { printf("to line %d\n", lineno); BEGIN(INITIAL); }
<ML_COMMENT>[^*\n]+		
<ML_COMMENT>"*"			
<ML_COMMENT>"\n"    { lineno += 1; }


"int"               { return INT; }
"string"            { return STRING; }
"float"             { return FLOAT; }
"for"               { return FOR; }
"continue"          { return CONTINUE; }
"break"             { return BREAK; }
"void"              { return VOID; }
"return"            { return RETURN; }
"main"              { return MAIN; }


"+"                 { return ADDOP; }
"-"                 { return DIFOP; }
"\.gt\."|"\.lt\."|"\.le\."|"\.ge\."   { return RELOP; }


"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
";"       { return SEMI; }
","       { return COMMA; }
"="       { return ASSIGN; }


{ID}        {
                return ID;
            }
{ICONST}    { return ICONST; }
{FCONST}    { return FCONST; }
{SCONST}    { 
              return STRING; 
            }


"\n"        { lineno += 1; }
[ \t\r\f]+  /* eat up whitespace */

.           { yyerror("Unrecognized character"); }

%%