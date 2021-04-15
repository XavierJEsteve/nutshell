%{
    //#include "ns_token.h"
    #include "ns_parse.tab.h"
%}
extern char *yytext;

%option noyywrap
%option yylineno


QUOTE    ["]
NOTQUOTE [^"]

METAC    [<>|"\&"]
TILDE    [~]

%%

">>" { return STDOUT_tk; }
"2>" { return STDERR_tk; }
"<"  { return FILEIN_tk; }
">"  { return FILEOUT_tk; }
"|"  { return PIPE_tk; }
"&"  { return AMP_tk; }
"\\" { printf("(meta %s %u)\n", yytext, yylineno); }
\"   { printf("(meta %s %u)\n", yytext, yylineno); }

\"([^\\\"]|\\.)*\"              {return WORD_tk;}
[ \t]                  	        { /* Whitespace - ignore */ }
\n                              {return NEWLINE_tk;}
.                               {return (int) yytext[0];}




<<EOF>>                         { return BYE;}

%%