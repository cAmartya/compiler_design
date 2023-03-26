%{

%}

%%

"if"            { return IF; }
"else"          { return ELSE; }
"for"           { return FOR; }
"("             { return OPEN_PAREN; }
")"             { return CLOSE_PAREN; }
";"             { return SEMICOLON; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIVIDE; }
"="             { return ASSIGN; }
"<"             { return LESS_THAN; }
">"             { return GREATER_THAN; }
"<="            { return LESS_THAN_OR_EQUAL; }
">="            { return GREATER_THAN_OR_EQUAL; }
"=="            { return EQUAL; }
"!="            { return NOT_EQUAL; }
"{"             { return OPEN_BRACE; }
"}"             { return CLOSE_BRACE; }
"printf"        { return PRINT; }
\"[ A-Za-z0-9_@./#&+-]*\" { return STRING; }

[0-9]+          {return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* {return IDENTIFIER; }
[ \t\n]         { /* ignore whitespace */ }
.               { printf("Unexpected character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}