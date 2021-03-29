// quest.c
/* Meant to demonstrate a state machine, expecting properly formatted inputs in order
*
*/

#include "quest_token.h"
#include <stdio.h>
int yylex();
extern char *yytext;

void print_line(void) {
    printf("\n>> ");
}

//Will sacrifice the user via bridge of death
void banish(void){
    printf("\"AHHHHHHHhhhhhhhhhh\" *splash*..........the next knight shall step forward.\n\n");
}

//int token = yylex(); //prehaps change enumeration to char* instead of int values for legibility?
void state_machine(void) {
    int state = -2;
    int token;
    while (1){

        //made to match quest_token.h -> token_type enum, in addition to reset and banish states
        // Might not need break statements to allow fall through. Re-evaluation should work for now.
        switch(state){

            case -2: //reset state...0 can be problematic since that is the return value of E0F for lex
                printf("STOP!\n");  
                printf("First you must answer my THREE questions....\n");
                state = 1;
                break;

            case -1: //banish state, ANYTHING unexpected should go here, good practice for making a robust scanner
                banish();
                state = -2;
                break;

            //  No case 0 since that is the E0F return of yylex()

            case 1: //Name state... 
                printf("WHAT is your name?");
                print_line();
                token = yylex();
                (token == state) ? state++ : (state = -1); //either advance or banish
                printf("Enterred text was %s\n", yytext);
                break;

            case 2:
                printf("WHAT is your quest?");
                print_line();
                token = yylex();
                (token == state) ? state++ : (state = -1); //either advance or banish
                printf("Enterred text was %s\n", yytext);
                break;

            case 3:
                printf("WHAT is your favorite color?");
                print_line();
                token = yylex();
                (token == state) ? state++ : (state = -1); //either advance or banish
                printf("Enterred text was %s\n", yytext);
                break;

            case 4: //winner
                printf("YOU.....may pass...........the next knight shall step forward.\n\n");
                state = -2; //reset 
                break;

            default:
                state = -2;
                break;

        }//end switch
    }//end while
}

int main(void){
    //Enter state machine
    state_machine();
    return 0;
}