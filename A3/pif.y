%{
    #include <stdio.h>
    #include <string.h>
%}


%token IF ELSE EXP STMT NBS NBE CBS CBE END


%%
start: cstmt END    { printf("Valid Expression ..."); exit(0); }
cstmt: STMT cstmt       { printf("--> Rule 2\n"); }
     | ifstmt cstmt     { printf("--> Rule 3\n"); }
     | STMT             { printf("--> Rule 4a\n"); }
     | ifstmt           { printf("--> Rule 4b\n"); }
ifstmt: IF NBS EXP NBE cstmt                                { printf("--> Rule 5\n"); }
      | IF NBS EXP NBE CBS cstmt CBE                        { printf("--> Rule 6\n"); }
      | IF NBS EXP NBE cstmt ELSE cstmt                     { printf("--> Rule 7\n"); }
      | IF NBS EXP NBE CBS cstmt CBE ELSE CBS cstmt CBE     { printf("--> Rule 8\n"); }
%%


int yyerror(char *msg)
{
    printf("Invalid String\n");
}


int main()
{
    printf("Enter your code (can be in multiple lines) -->\n");
    return yyparse();
}
