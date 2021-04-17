#include "util.h"
#include <iostream>
#include <vector>
#include <algorithm>

void show_arguments(arglist_t * arglist){
    int count = 0;
    std::vector<char*> arg_vector;
    auto it = arg_vector.begin();

    //Note this will currently be "backwards"...arg[0] is the last one enterred 
    while(arglist){
        std::cout << "Arglist [" << count <<  "] data: " << arglist->data->arg  << std::endl;

        arglist = arglist->next;
        count++;
    }

    // for (auto x: arg_vector) {
    //      std::cout << ' ' << x;
    // }
    
}

std::vector<char*> arglist_to_flip_str_vect(arglist_t * arglist){
    /* This Function will take an argumeny list and flip the order to match that of entry. 
        The flipped vector only has the raw char* value...really want to change that to arg_t but it hasn't been working*/
    
    std::vector<char*> arg_vector;
    auto it = arg_vector.begin();

    //iterate from right-most argument to left-most arg..weird I know so let's flip it
     while(arglist){
         arg_vector.insert(it, arglist->data->arg); //by using argluist->data, we place the arg object 
         it = arg_vector.begin();
         arglist = arglist->next;
     }
    // for (auto x: arg_vector) {
    //      std::cout << ' ' << x;
    // }

    return arg_vector;
}

