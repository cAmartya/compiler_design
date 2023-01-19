%{
%}

%%
[-]?[0-9]+ { printf("INTEGER MATCHED"); }
[-]?[0-9]+\.[0-9]+ { printf("DECIMAL MATCHED"); }
.* { printf("NOT MATCHED"); }
%%

int yywrap(){}

int main()  {
    yylex();
    return 0;   
}
