(arrow_function
  body: (statement_block) @fold)

(function_declaration  body: (statement_block) @fold)
(function_expression   body: (statement_block) @fold)
(method_definition     body: (statement_block) @fold)

(if_statement)        @fold
(for_statement)       @fold
(for_in_statement)    @fold
(for_of_statement)    @fold
(while_statement)     @fold
(switch_statement)    @fold
(try_statement)       @fold
(class_declaration)   @fold

