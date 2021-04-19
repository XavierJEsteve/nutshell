%{
    #include "util.h"
    #include "ns_parse.tab.h"
    #include <string>

%}
extern char *yytext;

%option noyywrap
%option yylineno

%%


"<"  { return FILEIN_tk; }
">"  { return FILEOUT_tk; }
">>" { return STDOUT_tk; }
"2>" { return STDERR_tk; }
"|"  { return PIPE_tk; }
"&"  { return AMP_tk; }
"\\" { printf("(meta %s %u)\n", yytext, yylineno); }
\"   { printf("(meta %s %u)\n", yytext, yylineno); }

[a-zA-Z0-9\.\/-]+              { yylval.string = yytext; return WORD_tk; }
\"(\\.|[^"\n])*\"              {
                                    char sub[yyleng - 1];
                                    strncpy(sub, yytext + 1, (yyleng - 2));
                                    sub[yyleng - 2] = '\0';
                                    yylval.string=strdup(sub); 
                                    return WORD_tk; 
                                }

[ \t]                  	        { /* Whitespace - ignore */ }
\n                               {return NEWLINE_tk;}
.                               {return (int) yytext[0];}
<<EOF>>                         { return 0;}

%%