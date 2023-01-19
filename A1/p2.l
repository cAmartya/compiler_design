%{
%}

%%
1[1|0]*101 { printf("MATCHED"); }
.* { printf("NOT MATCHED"); }
%%

int yywrap(){}

int main()  {
    yylex();
    return 0;   
}
