#include "util.h"
#include <iostream>

void show_arguments(arglist_t * arglist){
    int count = 0;
    //Note this will currently be "backwards"...arg[0] is the last one enterred 
    while(arglist != NULL){
        std::cout << "Arglist [" << count <<  "] data: " << arglist->data->arg  << std::endl;
        arglist = arglist->next;
        count++;
    }
}