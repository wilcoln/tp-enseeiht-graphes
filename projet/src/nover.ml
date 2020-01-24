
open Zach;;
open Zachgraph;;
open Samplegraph;;


(*******************************
  *   Fonctions utilitaires    *
  ******************************)

(* Fonction utilitaire 1/4 *)
(* intersect : 'a list 'a list -> 'a list *)
(* Paramètres l1, l2 : deux listes *)
(* Renvoie la liste des éléments qui se trouvent à la fois dans l1 et dans l2 *)
let rec intersect l1 l2 = 
  match l1 with 
  | []-> []
  | t1::q1-> if List.mem t1 l2 then t1::(intersect q1 l2) else intersect q1 l2


(* Fonction utilitaire 2/4 *)
(* nover_score_between : Zach.vertex -> Zach.vertex -> Zach.t -> float *)
(* Paramètres v1, v2, g : deux sommets et un graphe *)
(* Calcul le nover_score de l'edge (v1,v2) dans g *)
let nover_score_between v1 v2 g = 
  let voisins1 = Zach.succ g v1 in 
  let voisins2 = Zach.succ g v2 in 
  let voisins12 = intersect voisins1 voisins2 in 
  let numerateur = float_of_int (List.length voisins12) in
  let denominateur = float_of_int ((List.length voisins1) + (List.length voisins2) - (List.length voisins12) - 2) in 
  if numerateur = 0. then 0. else numerateur /. denominateur;;


(* Fonction utilitaire 3/4 *)
(* vertex_contribution : Zach.t -> Zach.vertex list -> Zach.vertex -> float *)
(* Paramètres g c v1 : un graphe, une composante connexe, un sommet *)
(* Calcul la contribution de v1 dans la modularité de la composante connexe c de g *)
let vertex_contribution g c v1 = 
    let m = float_of_int (Zach.nb_edges g) in
    let contribs = List.map 
    (fun v2 -> 
      begin 
        if v1 != v2 then
          let a12 = if (Zach.mem_edge g v1 v2) then 1. else 0. in 
          let d1 = Zach.in_degree g v1 in
          let d2 = Zach.in_degree g v2 in
          a12 -. (float_of_int(d1*d2)/.(2.*.m))
        else 0.
      end
    ) c in
    (List.fold_right (+.) contribs 0.) /. 2.;;


(* Fonction utilitaire 4/4 *)
(* component_modularity : Zach.t -> Zach.vertex list -> float *)
(* Paramètres g c : un graphe, une composante connexe *)
(* Calcul la modularité de la composante connexe c de g *)
let component_modularity g c = List.fold_right (fun v modularity -> (vertex_contribution g c v) +. modularity) c 0.;;



(*******************************
  *    Fonctions demandées     *
  ******************************)

(* Fonction demandée 1/3 *)
(* Voir contrat dans nover.mli *)
let nover_score g = 
  Zach.iter_edges_e 
    (fun e -> 
      begin 
        let score = (nover_score_between (Zach.getsrc e) (Zach.getdst e) g) in 
        Zach.setscore score e
      end
    ) g;;
  

(* Fonction demandée 2/3 *)
(* Voir contrat dans nover.mli *)
let step_nover g = 
  let ncomp_init = List.length (Zach.components g) in 
  let rec aux g = 
    let ncomp = (List.length (Zach.components g)) in
    if ncomp = ncomp_init then 
      begin
        Zach.iter_edges_e (fun e -> Zach.setscore 0. e) g;
        nover_score g;
        let one_min_edge = Zach.fold_edges_e (fun e min_edge -> if (Zach.getscore e) > (Zach.getscore min_edge) then min_edge else e) g (Zach.choosee g) in
        let all_min_edges = Zach.fold_edges_e (fun e min_edges -> if (Zach.getscore e) = (Zach.getscore one_min_edge) then e::min_edges else min_edges) g [] in
        List.iter (fun e -> Zach.remove_edge_e g e) all_min_edges;
        aux g;
      end
  in aux g;
;;


(* Fonction demandée 3/3 *)
(* Voir contrat dans nover.mli *)
let modularity g l = List.fold_right (+.) (List.map (component_modularity g) l) 0.;;


