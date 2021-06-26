open Dfa

(* Dfa accepting (a|b)*abb *)
let edges =
  [ (0, [('a', 1); ('b', 3)])
  ; (1, [('a', 1); ('b', 2)])
  ; (2, [('a', 1); ('b', 4)])
  ; (3, [('a', 1); ('b', 3)])
  ; (4, [('a', 1); ('b', 3)]) ]

let dfa1 = {(dfa_from_array edges) with start= 0; final= [4]}

let input = string_to_char_list Sys.argv.(1)

let w = run dfa1 input

let _ = print_endline (result_to_string w)
