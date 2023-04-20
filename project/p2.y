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
}

/* token definition */

%token GET PUT DO WHILE IF ELSE INT FLOAT CHAR VOID RETURN

%token <str_val> IDENTIFIER
%token <int_val> INTEGER


/* precedencies and associativities */
%left '+' '-'
%left '*' '/'
%left UMINUS

%start program

%type <str_val> argument datatype condition relational_operator

%%

program: main_function {
            printf("Parsing Successful!\n");
        }
        ;

main_function: 'main' '(' arguments ')' '{' statements '}' {
                    printf("Main Function Found!\n");
                }
        ;

arguments: argument_list {
                printf("Arguments Found!\n");
            }
        | /* Empty */
        ;

argument_list: argument {
                    printf("Argument Found!\n");
                }
            | argument ',' argument_list {
                    printf("Argument Found!\n");
                }
            ;

argument: datatype IDENTIFIER {
                printf("Argument Type: %s, Identifier: %s\n", $1, $2);
            }
        ;

statements: statement statements {
                printf("Statement Found!\n");
            }
        | /* Empty */
        ;

statement: input_statement {
                printf("Input Statement Found!\n");
            }
        | output_statement {
                printf("Output Statement Found!\n");
            }
        | assignment_statement {
                printf("Assignment Statement Found!\n");
            }
        | loop_statement {
                printf("Loop Statement Found!\n");
            }
        ;

input_statement: GET IDENTIFIER {
                    printf("Input Variable: %s\n", $2);
                }
        ;

output_statement: PUT IDENTIFIER {
                    printf("Output Variable: %s\n", $2);
                }
        ;

assignment_statement: IDENTIFIER '=' expression {
                            printf("Assignment Statement Variable: %s\n", $1);
                        }
                    ;

expression: IDENTIFIER {
                printf("Expression Variable: %s\n", $1);
            }
        | INTEGER {
                printf("Expression Integer: %d\n", $1);
            }
        ;

loop_statement: DO loop_body WHILE '(' condition ')' {
                    printf("Loop Statement Found!\n");
                }
            ;

loop_body: '{' statements '}' {
                printf("Loop Body Found!\n");
            }
        ;

condition: IDENTIFIER relational_operator IDENTIFIER {
                printf("Condition Identifier: %s, Operator: %s, Identifier: %s\n", $1, $2, $3);
            }
        | IDENTIFIER relational_operator INTEGER {
                printf("Condition Identifier: %s, Operator: %s, Integer: %d\n", $1, $2, $3);
            }
        ;

relational_operator: '.gt.' {
                        printf("Greater Than Operator Found!\n");
                    }
                    | '.lt.' {
                        printf("Less Than Operator Found!\n");
                    }
                    | '.ge.' {
                        printf("Greater Than or Equal To Operator Found!\n");
                    }
                    | '.le.' {
                        printf("Less Than or Equal To Operator Found!\n");
                    }
                ;

datatype: CHAR {
                printf("Data Type: char\n");
            }
        | INT {
                printf("Data Type: int\n");
            }
        | FLOAT {
                printf("Data Type: float\n");
            }
        ;

%%

void yyerror(char *msg) {
    fprintf(stderr, "%s\n", msg);
}

int main(int argc, char **argv) {
    if(argc < 2) {
        printf("Please provide an input file!\n");
        return 1;
    }

    int flag = 0;
    yyin = fopen(argv[1], "r");
    flag = yyparse();
	fclose(yyin);

    printf("parsing finished!\n");
    return flag;
}
