#include "util.h"
#include <iostream>

void show_arguments(arglist_t * arglist){
    int count = 0;

    while(arglist != NULL){
        std::cout << "Arglist [" << count <<  "] data: " << arglist->data  << std::endl;
        arglist = arglist->next;
        count++;
    }
}