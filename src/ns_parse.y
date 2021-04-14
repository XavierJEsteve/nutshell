%{
    #include "ns_token.h"

    extern char *yytext;

    void yyerror(const char *s){
        fprintf(stderr," ERROR: %s", s);
    }
%}

%union {
    std::string *string_val;
    int          num_val;
}

%token WORD Q_WORD 