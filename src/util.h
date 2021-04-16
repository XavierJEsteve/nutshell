// quest_token.h
#ifndef UTIL_H_
#define UTIL_H_ "util.h"

#include <string>
#include <vector>
#include <array>
#include <list>




// a command includes the keyword (i.e. cat) and its associated arguments
typedef struct command_t {
    int num_args;
    char *data;
    std::vector<char*> arguemnts;
} command_t;

typedef struct command_list_t {
    struct command_t data;
    struct command_list_t* next;
} command_list_t;


typedef struct arg_t {
    char* arg;
} arg_t;

typedef struct arglist_t {
    struct arg_t* data;
    struct arglist_t* next; //this should allow recursively defined list
} arglist_t;

/* FUNCTION DEFINITIONS */
void show_arguments(arglist_t * arglist);



/************************/


// END UTIL_H_
#endif 