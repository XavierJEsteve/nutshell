%{
    #include <stdio.h>
    //#include "ns_token.h"

    int yylex();

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

WORD_OBJ:
    WORD        {printf("Found a word");}
    | Q_WORD    {printf("Found a quoted word");}

IO_OBJ:
    FILEIN      {printf("Found FILEIN");}
    | FILEOUT   {printf("Found FILEOUT");}
    | PIPE      {printf("Found a PIPE");}

ENV_OBJ:
    SETENV      {printf("Found SETENV");}
    | PRINTENV  {printf("Found PRINTENV");}
    | UNSETENV  {printf("Found UNSETENV");}

DIR_OBJ:
    CD          {printf("Found CD");}

AMP_OBJ:
    AMP         {printf("Found an &");}

ALIAS_OBJ:
    ALIAS       {printf("Found an ALIAS");}
    | UNALIAS   {printf("Found UNALIAS");}

EXIT_CODE:
    BYE         {printf("Bye then");}
