
open Zach;;
open Zachgraph;;
open Nover;;

(**Affichage de la modularité initiale du graphe*)
nover_score karate;;
print_endline (string_of_float (modularity karate (Zach.components karate)));;
  
(**Application step_nover 1 *)
step_nover karate;;

(**Application step_nover 2 *)
step_nover karate;;

(**Application step_nover 3 *)
step_nover karate;;

(**Application step_nover 4 *)
step_nover karate;;
  
Zach.dot_output karate "graphs/karate.dot";;