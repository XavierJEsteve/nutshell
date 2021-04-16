%{
    #include "stdio.h"    
    #include <cassert>
    #include <string>
    #include <cstring>
    #include <iostream>
    //#include "ns_token.h"

    int yylex(void);

    int yyparse();

    void yyerror(const char *e){
        fprintf(stderr," ERROR: %s\n", e);
    }
%}

%union {
    char            *string;
    int             ival;
    //command_t*      cmdval;
    //command_list_t* cmdlistval;
}

%type <string> word
%token <string> WORD_tk
%token FILEIN_tk FILEOUT_tk PIPE_tk
%token STDOUT_tk STDERR_tk 
%token NEWLINE_tk
%token AMP_tk
%token BYE_tk

// Grammar sections
%% 

word:
    WORD_tk
            {
                printf("You entered a string - %s", $1);
            }
    | WORD_tk NEWLINE_tk
            {
                printf("You entered a string with newline\n");
            }
    | WORD_tk AMP_tk
            {
                printf("You entered a statement\n");
            }
    | WORD_tk AMP_tk NEWLINE_tk
        {
            printf("You entered a statement with a newline\n");
        }
            ;