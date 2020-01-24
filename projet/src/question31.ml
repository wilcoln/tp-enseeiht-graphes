
open Zach;;
open Samplegraph;;
open Nover;;

(**Affichage de la modularité initiale du graphe*)
nover_score g3;;
print_endline (string_of_float (modularity g3 (Zach.components g3)));;
  
(**Application step_nover 1 *)
step_nover g3;;

(**Application step_nover 2 *)
step_nover g3;;

(**Application step_nover 3 *)
step_nover g3;;

(**Application step_nover 4 *)
step_nover g3;;
  
Zach.dot_output g3 "graphs/g3.dot";;