(** Finite Automaton with `start` as starting/current state(s); `transition` which takes current state and one symbol and returns next state(s); `final` - set of final states; `check` which is a function that checks if any state in `start` is in `final` *)
type ('a, 'b) fa =
  { start: 'b
  ; transition: 'b -> 'a -> 'b option
  ; final: int list
  ; check: 'b -> int list -> bool }

(** Finite Automaton is in one of three results: Running, Accept, Reject *)
type ('a, 'b) result = Running of ('a, 'b) fa | Accept | Reject

let result_to_string = function
  | Accept -> "Accept"
  | Reject -> "Reject"
  | Running _ -> "Running"

(** Takes automata `a` and symbol `s` and performs one step. Returns either `Running` automata or `Rejects` if there is no transition. *)
let step a s =
  let next_state = a.transition a.start s in
  match next_state with Some q -> Running {a with start= q} | None -> Reject

(** Runs automaton `a` on an input (formatted as a list). Given than the input is finite, the automaton will either `Accept` or `Reject`. *)
let rec run a = function
  | [] -> if a.check a.start a.final then Accept else Reject
  | h :: t ->
      let r = step a h in
      match r with Running ds -> run ds t | _ -> r

(** Converts string to char list, useful for FA input *)
let string_to_char_list s =
  let rec aux n acc =
    match n with 0 -> acc | _ -> aux (n - 1) (s.[n - 1] :: acc)
  in
  aux (String.length s) []
