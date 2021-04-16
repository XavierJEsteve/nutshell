#include "util.h"
#include <iostream>
#include <vector>
#include <algorithm>

void show_arguments(arglist_t * arglist){
    int count = 0;
    //Note this will currently be "backwards"...arg[0] is the last one enterred 
    while(arglist != NULL){
        std::cout << "Arglist [" << count <<  "] data: " << arglist->data->arg  << std::endl;
        arglist = arglist->next;
        count++;
    }
}

//make a function that will return our arguments from arglist as an ez2use vector
std::vector<arg_t> arglist_to_vect(arglist_t * arglist){
    std::vector<arg_t> arg_vector;
    auto it = arg_vector.begin();

    //iterate from right-most argument to left-most arg..weird I know so let's flip it
    while(arglist != NULL){
        arg_vector.insert(it, *arglist->data); //by using argluist->data, we place the arg object 
        arglist = arglist->next;
    }

    for (auto x: arg_vector) {
         std::cout << ' ' << x.arg;
    }

    return arg_vector;
}