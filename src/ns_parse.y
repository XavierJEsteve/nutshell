%{
    #include "stdio.h"    
    #include <string>
    #include <cstring>
    #include <array>
    #include <vector>
    #include <algorithm>
    #include <iostream>
    #include "util.h"

    int yylex(void);
    
    int yyparse();

    void yyerror(const char *e){
        fprintf(stderr," ERROR: %s\n", e);
    }

    std::vector<char*> arg_vect_str;
%}

%union {
    char            *string;
    int             ival;
    arg_t*          arg_data;
    arglist_t*      arglist_data;
    command_t*      command_data;
    commandlist_t*  commandlist_data;
    //outfile
}

%type <string> word
%type <arg_data> arg
%type <arglist_data> arg_list
%type <arglist_data> arg_list_empty
%type <command_data> command
%type <commandlist_data> command_list
%type <commandlist_data> command_list_empty

%token <string> WORD_tk
%token FILEIN_tk FILEOUT_tk PIPE_tk
%token STDOUT_tk STDERR_tk 
%token NEWLINE_tk
%token AMP_tk
%token BYE_tk

// Grammar sections
// word is the foundation of everything. Word -> argument [word_list] -> command [argument_list]

/* NOTE : Use malloc, or suffer segmentation faults*/

%% 

command_list_empty:
                        {
                            commandlist_t *new_commandlist = (commandlist_t*)malloc(sizeof(commandlist_t));
                            new_commandlist->data = NULL;
                            new_commandlist->next = NULL;
                            $$ = new_commandlist;
                        }
        | command_list      {
                            $$ = $1;
                        }
        ;
    ;


 command_list:
     command_list PIPE_tk command   {
                                        commandlist_t *new_commandlist = (commandlist_t*)malloc(sizeof(commandlist_t));
                                        new_commandlist->data = $3;
                                        new_commandlist->next = $1;
                                        $$ = new_commandlist;
                                    }
     | command                      {
                                        commandlist_t *new_commandlist = (commandlist_t*)malloc(sizeof(commandlist_t));
                                        new_commandlist->data = $1;
                                        new_commandlist->next = NULL;
                                        $$ = new_commandlist;
                                    }
     ;


command:
    word arg_list_empty {
                            command_t *new_command = (command_t*)malloc(sizeof(command_t));
                            new_command->command = $1;
                            new_command->arguments = arglist_to_flip_str_vect($2);
                            new_command->num_args = new_command->arguments.size();
                            //std::cout << "Num args " << new_command->num_args;
                            $$ = new_command;
                            //WORKS!!
                            // for (auto x : new_command->arguments){
                            //     std::cout << ' ' << x << std::endl;
                            // }
                        }
    ;

arg_list_empty:   
                        {
                            arglist_t *new_arglist = (arglist_t*)malloc(sizeof(arglist_t));
                            new_arglist->data = NULL;
                            new_arglist->next = NULL;
                            $$ = new_arglist;
                        }
        | arg_list      {
                            $$ = $1;
                        }
        ;

arg_list:
    arg_list arg        {
                            arglist_t *new_arglist = (arglist_t*)malloc(sizeof(arglist_t)); 
                            new_arglist->data = $2;
                            new_arglist->next = $1;
                            $$ = new_arglist;
                            //show_arguments(new_arglist);
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
                strncpy(w, $1, strsize);
                w[strsize] = 0;
                $$ = w;
                printf("%s is the word \n", w); 
            }
            ;
%%