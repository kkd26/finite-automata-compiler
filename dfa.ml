include Fa

(** DFA must have only one starting/current state. *)
let dfa = {start= 0; transition= (fun x y -> None); final= []; check= List.mem}

(** Helper function which constructs a DFA from (int * ('a * int) list) list *)
let dfa_from_array array =
  let t q a =
    try
      let s = snd (List.find (fun x -> fst x = q) array) in
      Some (snd (List.find (fun x -> fst x = a) s))
    with Not_found -> None
  in
  {dfa with transition= t}
