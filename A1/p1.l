%{
%}

%%
[0-9]+\.[0-9]+ { printf("MATCHED"); }
.* { printf("NOT MATCHED"); }
%%

int main()  {
    yylex();
    return 0;   
}
