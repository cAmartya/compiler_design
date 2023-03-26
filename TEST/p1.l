%option noinput nounput noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

WS	[ \t]+

%%
   int sum=0;
   int check = 0;
   int lastsum=0;
   int temp = 1 ;

I  { sum+=1;}
IV { sum += 4;}
V  { sum += 5;}
IX {sum += 9;}
X  { sum += 10;}
XL { sum += 40;}
L  {sum += 50;}
XC { sum += 90;}
C  { sum += 100;}
P  {if(check==1){temp = 1; while(sum--){temp*=lastsum;}
lastsum=temp;}else{ lastsum = sum;} sum = 0; check=1; }
{WS} |
\n {if(check==1){temp = 1; while(sum--){temp*=lastsum;}
lastsum=temp;}else{lastsum = sum;} return lastsum;}
%%

int main (void) {
   int first;

   first = yylex ();

   printf ("%d \n", first);
   return 0;
}