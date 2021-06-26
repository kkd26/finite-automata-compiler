open Fa

(** NFA can have multiple current states. *)
let nfa =
  { start= [0]
  ; transition= (fun x y -> None)
  ; final= []
  ; check= (fun y -> List.exists (fun x -> List.mem x y)) }
