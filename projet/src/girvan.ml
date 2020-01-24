open Zach;;
open Samplegraph;;
open Zachgraph;;


(*******************************
  *   Fonctions utilitaires    *
  ******************************)


(* Fonction utilitaire 1/4 *)
(* init_score_edge : Zach.vertex -> unit *)
(* Paramètres e : un arc *)
(* Initialise le score de l'edge à 0 *)
let init_score_edge e = Zach.setscore 0. e;;


(* Fonction utilitaire 2/4 *)
(* betweenness_score_edges : Zach.t -> Zach.edge list -> unit *)
(* Paramètres g et le : un graphe, une liste d'edge du graphe*)
(* Calcule le betweeness scores des arcs de la liste *)
let rec betweenness_score_edges g le = 
match le with
| [] -> ()
| t::q -> 
  begin 
    let le2 =  List.flatten (List.map (fun t1 -> fst (Zach.shortest_path g t t1)) q) in
    List.iter (fun e -> Zach.incrscore 1. e) le2;
    betweenness_score_edges g q;
  end;;


(* Fonction utilitaire 3/4 *)
(* max_edge : Zach.t -> Zach.edge *)
(* Paramètres g : un graphe *)
(* Détermine et renvoie un edge de betweeness score maximal dans le graphe *)
let max_edge g = 
  Zach.fold_edges_e (
    fun e (m, emax) ->  
      begin 
        let score = (Zach.getscore e) in 
          if m >= score  then (m,emax) 
          else (score,e)
      end ) 
  g (0., Zach.choosee g);;


(* Fonction utilitaire 4/4 *)
(* nb_components : Zach.t -> int *)
(* Paramètres g : un graphe *)
(* Renvoie le nombre de composantes connexes du graphe *)
let nb_components g = List.length (Zach.components g);;



(*******************************
  *    Fonctions demandées     *
  ******************************)

(* Fonction demandée 1/2 *)
(* Voir contrat dans girvan.mli *)
let betweenness_score g = 
  Zach.iter_edges_e init_score_edge g ;
  let le = Zach.fold_vertex (fun v l -> v::l) g [] in
  betweenness_score_edges g le;;

  
(* Fonction demandée 2/2 *)
(* Voir contrat dans girvan.mli *)
let girvan_newman g n_com = 
  let comm_init = nb_components g in
  let rec aux g n_actuelle = 
    if (Zach.nb_edges g != 0) && (n_actuelle < n_com) then
      begin 
        betweenness_score g;
        let (_, e) = max_edge g in
        Zach.remove_edge_e g e;
        let new_comm = nb_components g in 
        aux g new_comm
      end;
  in aux g comm_init;;