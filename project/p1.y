%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	extern FILE *yyin;
	extern FILE *yyout;
	extern int lineno;
	extern int yylex();
	void yyerror();
%}

%define lr.type canonical-lr
%locations
/* YYSTYPE union */
%union{
    char char_val;
	int int_val;
	double double_val;
	char* str_val;
	char* symtab_item;
}

/* token definition */
%token<int_val>  INT FLOAT STRING FOR CONTINUE BREAK VOID RETURN MAIN
%token<int_val> ADDOP DIFOP RELOP
%token<int_val> LPAREN RPAREN LBRACE RBRACE SEMI COMMA ASSIGN
%token <symtab_item>   ID
%token <int_val>       ICONST
%token <double_val>    FCONST
%token <str_val>       SCONST

/* precedencies and associativities */
%left LPAREN RPAREN
%left ADDOP DIFOP
%left RELOP
%left COMMA

%start program

/* expression rules */

%%

program: main_type MAIN LPAREN parameters_optional RPAREN LBRACE declarations_optional statements_optional main_return RBRACE ;

/* declarations */
declarations: declarations declaration | declaration;

declaration: type names SEMI ;

type: INT | FLOAT | VOID | STRING ;

names: names COMMA variable | names COMMA init | variable | init ;

variable: ID 
;

init: var_init ;

var_init : ID ASSIGN constant

/* statements */
statements: statements statement | statement ;

statement:
	for_statement | assigment SEMI |
	CONTINUE SEMI | BREAK SEMI 
;


for_statement: FOR LPAREN assigment SEMI expression SEMI expression RPAREN tail ;

tail: LBRACE statements RBRACE ;

expression:
    expression ADDOP expression |
    expression DIFOP expression |
    expression RELOP expression |
    LPAREN expression RPAREN |
    variable |
    sign constant 
;

sign: ADDOP | DIFOP | /* empty */ ; 

constant: ICONST | FCONST | SCONST ;

assigment: variable ASSIGN expression ;

/* functions */
main_type: INT | VOID ;

parameters_optional: parameters | /* empty */ ;

parameters: parameters COMMA parameter | parameter ;

parameter : type variable ;

declarations_optional: declarations | /* empty */ ;

statements_optional: statements | /* empty */ ;

main_return: RETURN ICONST SEMI | RETURN SEMI | /*Empty*/ ;

%%

void yyerror ()
{
  fprintf(stderr, "Syntax error at line %d\n", lineno);
  exit(1);
}

int main (int argc, char *argv[]){

	// initialize symbol table
	// init_hash_table();

	// parsing
	int flag;
	yyin = fopen(argv[1], "r");
	flag = yyparse();
	fclose(yyin);
	
	printf("Parsing finished!");
	
	// symbol table dump
	
	return flag;
}
