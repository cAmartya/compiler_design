%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    int yylex();
    void yyerror();

    int powm(int a, int b){
        if (b == 0) return 1;
        if (b == 1) return a;
        int orig = 1;

        while (b--) {
            orig *= a;
        }

        return orig;
    }

%}


%token I
%token V
%token X
%token L
%token C
%token BRS
%token BRE
%token POW
%token END
