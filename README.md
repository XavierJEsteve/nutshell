# nutshell
This is a cli meant to immitate a common bash shell. Uses Flex and Bison for lex &amp; parsing heavy lifting.


Acknowledgemnts:
All of the code written in each commit (https://github.com/XavierJEsteve/nutshell/tree/dev/src , branch==dev) was authored by that contributer. 
In hindsight, this project should have been started much, **much** earlier. It seems it was well underestimated. The scope only becomming more obvious as the code continued to flow.

## What works?

Nothing, no features in the rubruc actually work. The lexxing and parsing provided by flex and bison is functional though it of course has some bugs. One such example is the way single word entries seem to crash the entire shell with a segmentation fault I could no longer bring myself to cry over.

## Build Instructions
To observe this trainwreck of a program one would pull all of the existing code and execute make in the /src/ directory. This should run flex and bison on their respective input files I created (ns_lex.l and ns_parse.y). Following this, the C/C++ code is copmiled againsts the fl library.
