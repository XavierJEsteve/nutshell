%{
    #include <iostream>
    #include "ns_token.h"
%}

%option noyywrap
%X EXPECT_Q_WORD

QUOTE    ["]
NOT_QUOTE [^"]

METAC    [<>|"\&"]
NOT_METAC

TILDE    [~]
%%

{QUOTE}                         {BEGIN(EXPECT_Q_WORD)}
<EXPECT_Q_WORD>{NOT_QUOTE}*      {yylval.string = new std::string(yytext); return Q_WORD;}
<EXPECT_Q_WORD>{QUOTE}          BEGIN(INITIAL);

[]

[ \t\r\n]+                  	{ /* Whitespace - ignore */ }

[.]                             {return -1;         /* Really lazy way of filtering out ANYTHING else */}
<<EOF>>                         { exit(0); }

%%