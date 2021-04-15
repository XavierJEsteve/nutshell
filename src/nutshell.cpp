// quest.c
/* Meant to demonstrate a state machine, expecting properly formatted inputs in order
*
*/

//#include "ns_token.h"
#include <stdio.h>
int yylex();
extern int yyparse();
extern char *yytext;

void print_line(void) {
    printf("\n>> ");
}



int main(void){
    //Enter state machine
    //state_machine();
    while (1){
        print_line();
        yyparse();
    }
    return 0;
}