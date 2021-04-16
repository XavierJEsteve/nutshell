%{
    #include "stdio.h"    
    #include <cassert>
    #include <string>
    #include <cstring>
    #include <iostream>
    #include "util.h"

    int yylex(void);

    int yyparse();

    void yyerror(const char *e){
        fprintf(stderr," ERROR: %s\n", e);
    }
%}

%union {
    char            *string;
    int             ival;
    arg_t*          arg_data;
    arglist_t*      arglist_data;
    //command_list_t* cmdlistval;
    //infile
    //outfile
}

%type <string> word
%type <arg_data> arg
%type <arglist_data> arg_list
%type <arglist_data> arg_list_empty

%token <string> WORD_tk
%token FILEIN_tk FILEOUT_tk PIPE_tk
%token STDOUT_tk STDERR_tk 
%token NEWLINE_tk
%token AMP_tk
%token BYE_tk

// Grammar sections
// word is the foundation of everything. Word -> argument [word_list] -> command [argument_list]
%% 





arg_list:
    arg_list arg        {
                            arglist_t *new_arglist = (arglist_t*)malloc(sizeof(arglist_t));
                            new_arglist->data = $2;
                            new_arglist->next = $1;
                            $$ = new_arglist;
                            printf("Chaining arguments \n"); 
                        }
    | arg               {   
                            arglist_t *new_arglist = (arglist_t*)malloc(sizeof(arglist_t));
                            new_arglist->data = $1;
                            new_arglist->next = NULL;
                            $$ = new_arglist;
                            printf("Standalone argument \n"); 
                        }
    ;

arg:
    word
        {
            /*Use malloc, or suffer segmentation faults*/
            arg_t *new_arg = (arg_t *)malloc(sizeof(arg_t));
            new_arg->arg = strdup($1);
            $$ = new_arg;
            printf("Don't you dare argue with me\n"); 
        }

word:
    WORD_tk
            {
                /*Use malloc, or suffer segmentation faults*/
                int strsize = strlen($1) + 1;
                char *w = (char *)malloc(sizeof(char) * strlen($1) + 1);
                assert(w != NULL);
                strncpy(w, $1, strsize);
                w[strsize] = 0;
                $$ = w;
                printf("%s is the word \n", w); 
            }
            ;
%%