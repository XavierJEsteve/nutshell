#include "util.h"
#include <iostream>
#include <vector>
#include <algorithm>
#include <map>
#include <stdlib.h>

/* Bison Fucntions */
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

// /* Initialization functions */
// void build_environment(int num_vars){
//     //Mandatory environment variables include HOME and PATH
    
//     std::map<char*,char*> environment_map   { 
//                                                 {"PATH" : getenv("PATH"}, 
//                                                 {"HOME" : getenv("HOME"} 
//                                             };

// }

/* Check Builtin
* This is a quick logic check to determine if the command is a built in so it can be handled accordingly.
*/
int check_builtin(command_t* command){
    // Early testing would show checking every word is the DUMBEST idea I've ever had
    //  Check first word of a command instead, duh
    // Next write up a function, prob called from parse.y, that will send commands to be verified and executed
    if (strcmp(command->command, "setenv") == 0) 
        return 1;
    if (strcmp(command->command, "printenv") == 0) 
        return 1;
    if (strcmp(command->command, "unsetenv") == 0) 
        return 1;
    if (strcmp(command->command, "cd") == 0) 
        return 1;
    if (strcmp(command->command, "alias") == 0) 
        return 1;
    if (strcmp(command->command, "unalias") == 0) 
        return 1;
    if (strcmp(command->command, "bye") == 0) 
        return 1;
    return 0;
}

void run(commandlist_t* command) {
    //Base command structure on rubric...if I get that far
    
    //Command_list->data->command...works
    // std::cout << "Looks like you are trying to execute " << command->data->command <<std::endl;
    // std::cout << "With arguments: ";
    // for (auto x: command->data->arguments){
    //     std::cout << x << ' ';
    // }
    //check if is a built in command
    if (check_builtin(command->data))
    {
        run_builtin(command->data);
    } 


} 

void run_builtin(command_t* command){
    char* cmd;
    cmd = command->command; //get command value
    int err_code;
    //guess where I had this stored 
    if (strcmp(command->command, "setenv") == 0) 
    {
        std::cout << "Setting environment variable " << 
        (command->arguments.at(0)) << " == " << (command->arguments.at(1)) << std::endl;
        //check that command is of form "setenv"
        if (command->arguments.size() != 2)
        {
            handle_error();
        } 

        else //returns zero on success, or -1 on error,
        {
            err_code = setenv(command->arguments.at(0), command->arguments.at(1), 1);
        }
    }
        
    else if (strcmp(command->command, "printenv") == 0) 
        
        printf("Need to figure out printing environment");
        //return 1;
        

    else if (strcmp(command->command, "unsetenv") == 0) 
    {
        err_code = unsetenv(command->arguments.at(0)); //don't feel like using some fancy errno.h
    }        //returns zero on success, or -1 on error,
       
    else if (strcmp(command->command, "cd") == 0) 
    {
        change_directory(command);
    }
        
    else if (strcmp(command->command, "alias") == 0)
    {
        if (command->num_args == 0) 
            printf("Need to figure out printing Aliases");
        else if (command->num_args == 2){
            printf("Need to figure out seting Aliases");
        }
        else{ 
            handle_error();
        }
    }    

    else if (strcmp(command->command, "unalias") == 0) 
    {  
        if (command->num_args == 1)
            printf("Need to figure out removing Aliases");
        else
            handle_error();
    }    
    else if (strcmp(command->command, "bye") == 0) 
    {
        printf("I want to exit more gracefully");
        exit(0);
    }   
    else
        handle_error();
}

void change_directory(command_t *command)
{
    char *dir;
    if (command->num_args == 0) 
        dir = getenv("HOME");
    else
        dir = command->arguments.at(0);
    //int result = chdir(dir);
    if (chdir(dir) == 0)
        printf("Need to figure out changing ddirectory");
        //char buff[1024];
        //getcwd(buff, 1023);
        //setenv("PWD", buff, 1);
}

void handle_error(){
    printf("uh something went wrong");
}