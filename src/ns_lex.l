%{
    //#include "ns_token.h"
    #include "ns_parse.tab.h"
%}
extern char *yytext;

%option noyywrap

%x EXPECT_Q_WORD

QUOTE    ["]
NOTQUOTE [^"]

METAC    [<>|"\&"]
TILDE    [~]
%%

{QUOTE}                         {BEGIN(EXPECT_Q_WORD);}
<EXPECT_Q_WORD>{NOTQUOTE}*      {return Q_WORD;}
<EXPECT_Q_WORD>{QUOTE}          {BEGIN(INITIAL);}

[a-zA-Z0-9\.\-]+                {return WORD;}
[<]                             {return FILEIN;}
[>]                             {return FILEOUT;}
[&]                             {return AMP;}
setenv                          {return SETENV;}
printenv                        {return PRINTENV;}
unsetenv                        {return UNSETENV;}
cd                              {return CD;}
alias                           {return ALIAS;}
unalias                         {return UNALIAS;}
bye                             {return BYE;}



[.]                             {return (int) yytext[0];  /* In the future, make this increase CHAR count */}
[ \t\r\n]+                  	    { /* Whitespace - ignore */ }
<<EOF>>                         { return BYE;}

%%