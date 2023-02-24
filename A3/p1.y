%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *);
int yylex();
%}

%token IF ELSE FOR OPEN_BRACE CLOSE_BRACE
%token OPEN_PAREN CLOSE_PAREN SEMICOLON
%token PLUS MINUS TIMES DIVIDE
%token ASSIGN
%token LESS_THAN GREATER_THAN LESS_THAN_OR_EQUAL GREATER_THAN_OR_EQUAL
%token EQUAL NOT_EQUAL
%token NUMBER
%token IDENTIFIER
%token PRINT STRING

%start statement

%%
statement:
    if_statement {printf("IF statement encountered\n");}
    | if_else_statement {printf("IF-ELSE statement encountered\n");}
    | for_statement {printf("FOR loop encountered\n");}
    | expression SEMICOLON statement
    | expression SEMICOLON
    | print_statement SEMICOLON statement
    | print_statement SEMICOLON
    ;

if_else_statement:
    IF OPEN_PAREN expression CLOSE_PAREN OPEN_BRACE statement CLOSE_BRACE ELSE OPEN_BRACE statement CLOSE_BRACE
    ;

if_statement:
    IF OPEN_PAREN expression CLOSE_PAREN OPEN_BRACE statement CLOSE_BRACE
    ;

for_statement:
    FOR OPEN_PAREN expression SEMICOLON expression SEMICOLON expression CLOSE_PAREN OPEN_BRACE statement CLOSE_BRACE
    ;

expression:
    NUMBER
    | IDENTIFIER
    | expression PLUS expression
    | expression MINUS expression
    | expression TIMES expression
    | expression DIVIDE expression
    | expression LESS_THAN expression
    | expression GREATER_THAN expression
    | expression LESS_THAN_OR_EQUAL expression
    | expression GREATER_THAN_OR_EQUAL expression
    | expression EQUAL expression
    | expression NOT_EQUAL expression
    | IDENTIFIER ASSIGN expression
    | OPEN_PAREN expression CLOSE_PAREN
    | PLUS PLUS IDENTIFIER
    | MINUS MINUS IDENTIFIER
    ;

print_statement: PRINT OPEN_PAREN STRING CLOSE_PAREN;
%%

void yyerror(const char *s) {
    printf("%s\n", s);
}

#include "lex.yy.c"
int main() {
    yyin = fopen("input.txt", "r");
    yyparse();
    return 0;
}
