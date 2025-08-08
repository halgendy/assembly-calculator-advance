# Assembly Calculator Advance

`assembly-calculate-advance` was coded to cement my studies of assembly in my Computer Systems course at Northeastern University. I set the challenge to build this myself, first 
using concepts of Dyanamic Top-Down programming to handle more advanced features such as paranthesis before switching to Dijkstra's Rail Shunting algorithm which evaluates
a String calculation such as "1 + 1 * 2" into Reverse-Polish Notation [*, 1, 2, +, 1]

It is capable of correcting unbalanced parenthesis e.g. "1 / 3) + 2" into "(1 / 3) + 2". Additionally, the code supports easy implementation of custom operators.
