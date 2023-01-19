%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double result = 0;
int operation = 0; /* 1 = +, 2 = -, 3 = *, 4 = /, 5 = ^ */
double number = 0;

%}

digit [0-9]
number {digit}+({\.}?{digit}+)?

%%

[0-9]+((\.)?[0-9]+)? {
    sscanf(yytext, "%lf", &number);
    switch(operation) {
        case 1:
            result += number;
            break;
        case 2:
            result -= number;
            break;
        case 3:
            result *= number;
            break;
        case 4:
            result /= number;
            break;
        case 5:
            for(int i=0; i<number; i++) result *= result;
            break;
        default:
            result = number;
            break;
    }
    operation = 0;
}

"+"    { operation = 1; }
"-"    { operation = 2; }
"*"    { operation = 3; }
"/"    { operation = 4; }
"^"    { operation = 5; }

\n    { printf("%.2lf\n", result); }
.    { /* ignore everything else */; }

%%

int yywrap(){}

int main(int argc, char *argv[]) {
    yylex();
    return 0;
}