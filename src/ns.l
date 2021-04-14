%{
    #include "ns_token.h"
%}

%%

[A-Z][a-z]*                     {return NAME;}
To|to[ ][a-z]+.*                {return QUEST;    /*Quest should be of form "To ...."*/}
red|Red|blue|Blue|green|Green   {return COLOR;    /*Becasue all colors are just a combination of these*/}
.+                              {return -1; /* Really lazy way of filtering out ANYTHING else */}
%%