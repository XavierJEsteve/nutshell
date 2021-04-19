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
    int token;
    int status;
    while (1){
        print_line();
        status = yyparse();
        switch(status)
        {
            case 0:
                //normal operation
                break;
            
            case 1:
                printf("[ERROR] : Invalid syntaxt. Please try again.\n");
            
            default:
                break;
        }

    }
    return 0;
}