open Zach;;
open Samplegraph;;
open Convolution;;


let string_of_list l = "[ "^(List.fold_right (fun t tq -> (string_of_float t)^" "^tq) l "" )^"]";;

let compute_and_print_conv g v = 
  let c = convolution g v in 
  print_endline ("conv sur "^(string_of_int (Zach.getnumberv v))^" : "^(string_of_list c));;


(*******************************
  * Partie Programme Principal *
  ******************************)

(**Affichage des paramètres du graphe g4*)
print_endline "Paramètres du graphe g4";;
print_param g4;;


(**Calcul et affichage les convolutions aux sommets du  graphe g4*)
print_endline "Calcul et affichages des convolutions";;
Zach.iter_vertex (compute_and_print_conv g4) g4;;


(**Output du graphe g4*)
Zach.dot_output g4 "graphs/g4.dot";;