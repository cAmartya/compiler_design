%{
    #include "y.tab.h"
%}


%%
if      { return IF; }
else    { return ELSE; }
exp     { return EXP; }
stmt    { return STMT; }
\(      { return NBS; }
\)      { return NBE; }
\{      { return CBS; }
\}      { return CBE; }
[\n\t ] { }
;       { return END; }
.       { return yytext[0]; }
%%


int yywrap(){ return 1; }
