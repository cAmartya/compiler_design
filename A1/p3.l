%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int temp=0;
double result = 0;
int operation = 0; /* 1 = +, 2 = -, 3 = *, 4 = /, 5 = ^, 6 = % */
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
            result = pow(result, number);
            break;
        case 6:
            result = (int)result % (int)number;
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
"%"    { operation = 6; }

\n    { printf("%.2lf\n", result); }
.    { /* ignore everything else */; }

%%

int yywrap(){}

int main(int argc, char *argv[]) {
    yylex();
    return 0;
}