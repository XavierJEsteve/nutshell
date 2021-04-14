%{
    #include "ns_parse.tab.h"
%}

%option noyywrap

%x EXPECT_Q_WORD

QUOTE    ["]
NOT_QUOTE [^"]

METAC    [<>|"\&"]
NOT_METAC

TILDE    [~]
%%

{QUOTE}                         {BEGIN(EXPECT_Q_WORD)}
<EXPECT_Q_WORD>{NOT_QUOTE}*     {yylval.string_val = new std::string(yytext); return Q_WORD;}
<EXPECT_Q_WORD>{QUOTE}          BEGIN(INITIAL);

[a-zA-Z0-9\.\-]+                {yylval.string_val = new std::string(yytext); return WORD;}
"<"                             {return LT;}
">"                             {return GT;}
"&"                             {return AMP;}
                                
    {/*Built-in commands*/}
setenv                          {return SETENV;}
printenv                        {return PRINTENV;}
unsetenv                        {return UNSETENV;}
cd                              {return CD;}
alias                           {return ALIAS;}
unalias                         {return UNALIAS;}
bye                             {return BYE;}



[.]                             {return (int) yytext[0];  /* In the future, make this increase CHAR count */}
[\n]                            {return -1;               /* In the future, make this increase LINE count */}
[ \t\r]+                  	    { /* Whitespace - ignore */ }
<<EOF>>                         { return BYE;}

%%