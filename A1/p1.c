%{
%}

%%
1(1|0)*101 + {printf("MATCHED")}
%%

int main()  {
    yylex();
    return 0;   
}
