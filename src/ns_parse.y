%{
    #include "ns_token.h"

    int yylex();

    int yyparse();

    void yyerror(const char *e){
        fprintf(stderr," ERROR: %s\n", e);
    }
%}

%code requires {
    #include "ns_token.h"
}

%define api.value.type union

%union {
    char*           string;
    int             ival;
    command_t*      cmdval;
    command_list_t* cmdlistval;
}

%token WORD Q_WORD 
%token FILEIN FILEOUT PIPE
%token SETENV PRINTENV UNSETENV
%token CD
%token ALIAS UNALIAS
%token BYE

WORD_OBJ:
    WORD
    | Q_WORD

IO_OBJ:
    FILEIN
    | FILEOUT
    | PIPE

ENV_OBJ:
    SETENV
    | PRINTENV
    | UNSETENV

DIR_OBJ:
    CD

ALIAS_OBJ:
    ALIAS
    | UNALIAS

EXIT_CODE:
    BYE
