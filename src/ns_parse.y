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
    std::string *string_val;
    int          num_val;
}

%token WORD Q_WORD 