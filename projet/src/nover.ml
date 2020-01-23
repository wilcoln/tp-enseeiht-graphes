
open Zach;;
open Zachgraph;;

let rec intersect l1 l2 = 
  match l1 with 
  |[]-> []
  |t1::q1-> if List.mem t1 l2 then t1::(intersect q1 l2) else intersect q1 l2

let nover_score_between v1 v2 g = 
  let voisins1 = Zach.succ g v1 in 
  let voisins2 = Zach.succ g v2 in 
  let voisins12 = intersect voisins1 voisins2 in 
  (float_of_int (List.length voisins12))/. (float_of_int ((List.length voisins1) + (List.length voisins2) - (List.length voisins12) - 2))
  
let nover_score g = Zach.iter_edges_e (fun e -> let score = (nover_score_between (Zach.getsrc e)  (Zach.getdst e) g) in Zach.setscore score e) g;;
  

let step_nover g = 
  let ncomp_init = List.length (Zach.components g) in 
  let rec aux g = 
    let ncomp = (List.length (Zach.components g)) in
    if ncomp = ncomp_init then 
      begin
        Zach.iter_edges_e (fun e -> Zach.setscore 0. e) g;
        nover_score g;
        let min_edge = Zach.fold_edges_e (fun e min_edge -> if (Zach.getscore e) > (Zach.getscore min_edge) then min_edge else e) g (Zach.choosee g) in
        Zach.remove_edge_e g min_edge;
        aux g;
      end
  in aux g;
;;

let get_mod_comps m g c = 
  (* let m = float_of_int (Zach.nb_edges g) in *)
  List.fold_right (fun v mod_courant -> (List.fold_right (+.) (List.map (fun v2 -> let a12 = if (Zach.mem_edge g v v2) then 1. else 0. in (a12 -. (float_of_int((Zach.in_degree g v)*(Zach.in_degree g v2)))/.(2.*.m)) ) c) 0.) +. mod_courant) c 0.;;

let modularity m g l = List.fold_right (+.) (List.map (get_mod_comps m g) l) 0.;;

(* let nover g seuil = 
  let gcopy = Zach.copy g in 
  let rec aux gcopy mod_and_comps = 
    if (Zach.nb_edges gcopy) != 0 || List.length (Zach.components gcopy) < seuil then
      begin 
        print_endline "ici";
        step_nover gcopy;
        let components = Zach.components gcopy in
        let mod_comp = modularity g components in
        (mod_comp, components)::mod_and_comps
      end
    else mod_and_comps
  in let mod_and_comps = (aux gcopy []) in
  print_endline "la";
  let max_mod = List.fold_right (fun t tq -> if t > tq then t else tq) (fst (List.split mod_and_comps)) 0. in
  let best_comps = List.assoc max_mod mod_and_comps in
  let rec build_best g = if (List.length (Zach.components g)) < (List.length best_comps) then begin step_nover g; build_best g; end in build_best g;; *)
let m = float_of_int (Zach.nb_edges karate);;

print_endline (string_of_float (modularity m karate (Zach.components karate)));;
step_nover karate;;
print_endline (string_of_float (modularity m karate (Zach.components karate)));;
step_nover karate;;
 print_endline (string_of_float (modularity m karate (Zach.components karate)));;
step_nover karate;;
print_endline (string_of_float (modularity m karate (Zach.components karate)));;
step_nover karate;;
print_endline (string_of_float (modularity m karate (Zach.components karate)));;

Zach.dot_output karate "graphs/karate.dot";;

