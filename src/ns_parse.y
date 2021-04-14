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
    WORD        {printf("Found a word\n");}
    | Q_WORD    {printf("Found a quoted word\n");}

IO_OBJ:
    FILEIN      {printf("Found FILEIN\n");}
    | FILEOUT   {printf("Found FILEOUT\n");}
    | PIPE      {printf("Found a PIPE\n");}

ENV_OBJ:
    SETENV      {printf("Found SETENV\n");}
    | PRINTENV  {printf("Found PRINTENV\n");}
    | UNSETENV  {printf("Found UNSETENV\n");}

DIR_OBJ:
    CD          {printf("Found CD\n");}

AMP_OBJ:
    AMP         {printf("Found an &\n");}

ALIAS_OBJ:
    ALIAS       {printf("Found an ALIAS\n");}
    | UNALIAS   {printf("Found UNALIAS\n");}

EXIT_CODE:
    BYE         {printf("Bye then\n");}
