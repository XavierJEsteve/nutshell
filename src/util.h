// quest_token.h
#ifndef UTIL_H_
#define UTIL_H_ "util.h"

#include <string>
#include <vector>
#include <list>


//might not need this just yet
// std::vector<char*> built_ins = {
//     "setenv",
//     "printenv",
//     "unsetenv",
//     "cd"
// };

typedef struct arg_t {
    char* arg;
} arg_t;

typedef struct arglist_t {
    struct arg_t* data;
    struct arglist_t* next; //this should allow recursively defined list
} arglist_t;

// END UTIL_H_
#endif 