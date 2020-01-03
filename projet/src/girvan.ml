open Zach;;
open Samplegraph;;
let betweenness_score g = ();;
(* 
let betweeness_score g edge = 
  (* Calculer le plus court chemin entre toutes les paires de noeuds  *)
  (* incrémenter le score de l'edge pour tous les plus courts chemins passant par edge *)

  let plus_courts_chemins = fun sommet score_autre_sommets -> List.fold_right (fun noeud chemin_autre_noeud -> )   in 
    (*Zach.iter_vertex (fun noeud -> List.map (Zach.shortest_path g noeud) (Zach.iter_vertex (fun autre_noeud -> autre_noeud) g)) g*)
  let rec incrementer_score_edge reste_plus_courts_chemins = 
    match reste_plus_courts_chemins with
    | [] -> 0
    | chemins::q -> List.fold_right (fun chemin tq -> if (List.mem edge chemin) then (tq + 1) else tq) chemins 0

  in incrementer_score_edge plus_courts_chemins *)

  let betweenness_score_edge g edge = 
    Zach.fold_vertex (fun sommet score_edge_autres_sommets -> 
    begin
      let cheminsSommetAutreSommets = Zach.fold_vertex (fun noeud cheminsSommetAutreNoeuds -> (Zach.shortest_path g sommet noeud)::cheminsSommetAutreNoeuds) g [] in 
      let rec aux reste_chemins = 
        match reste_chemins with
        | [] -> 0
        | cheminAvecCout::q -> if (List.mem edge (fst cheminAvecCout))
                        then 1 + (aux q)
                        else (aux q)
      in aux cheminsSommetAutreSommets
    end
    ) g 0;;

(* let max_edge g = 
  let v1_start  = Zach.choosev g in
  let v2_start = Zach.choosev g in 
  Zach.fold_edges (fun v1 v2 max_edge -> 
    begin
      let score = (betweenness_score_edge g (Zach.find_edge g v1 v2)) in if (score > (betweenness_score_edge g max_edge)) then (Zach.find_edge g v1 v2) else max_edge
    end
    ) g (Zach.find_edge g v1_start v2_start) *)

print_endline (string_of_int(betweenness_score_edge g1 ed1_1));;
let girvan_newman g n_com = ();;
