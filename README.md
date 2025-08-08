# Assembly Calculator Advance

`assembly-calculate-advance` was coded to cement my studies of assembly in my Computer Systems course at Northeastern University. This came from my curiosity of how more advanced features, like paranthesis, work. I brainstormed my own Dyanamic Top-Down approach before switching to Dijkstra's Rail Shunting algorithm. It converts
a String calculation such as "1 + 1 * 2" into Reverse-Polish Notation [*, 1, 2, +, 1] which is much easier to process.

Sometimes I forgot paranthesis (or was lazy), so I made it capable of correcting unbalanced parenthesis e.g. "1 / 3) + 2" into "(1 / 3) + 2". Additionally, I made it easy to add custom operators, for example I can now live out my dreams where 2@3 would be the same as 2 ^ (2 * 3). At least I think it's useful...
