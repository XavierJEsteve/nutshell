%{
    #include <stdio.h>
    //#include "ns_token.h"

    extern int yylex();

    int yyparse();

    void yyerror(const char *e){
        fprintf(stderr," ERROR: %s\n", e);
    }
%}

%union {
    char*           string;
    int             ival;
    //command_t*      cmdval;
    //command_list_t* cmdlistval;
}

%token WORD Q_WORD 
%token FILEIN FILEOUT PIPE
%token SETENV PRINTENV UNSETENV
%token CD
%token AMP
%token ALIAS UNALIAS
%token BYE


%% 

