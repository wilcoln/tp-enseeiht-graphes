open Zach;;
open Samplegraph;;
open Zachgraph;;

let initialisation_betweenness_score e = Zach.setscore 0. e;;



let rec betweenness_score_edge g ledge = 
match ledge with
| [] -> ()
| t::q -> 
  begin 
    let ledge2 =  List.flatten (List.map (fun t1 -> fst (Zach.shortest_path g t t1)) q) in
    List.iter (fun e -> Zach.incrscore 1. e) ledge2;
    betweenness_score_edge g q;
  end;;

let betweenness_score g = 
  Zach.iter_edges_e initialisation_betweenness_score g ;
  let ledge = Zach.fold_vertex (fun v l -> v::l) g [] in
  betweenness_score_edge g ledge;;

  let com_edge g = List.length (Zach.components g);;

let max_edge g = 
  Zach.fold_edges_e (
    fun e (m, emax) ->  
      begin 
        let score = (Zach.getscore e) in 
          if m >= score  then (m,emax) 
          else (score,e)
      end ) 
  g (0., Zach.choosee g);;

let girvan_newman g n_com = 
  let comm_init = com_edge g in
  let rec aux g n_actuelle = 
    if (Zach.nb_edges g != 0) && (n_actuelle < n_com) then
      begin 
        betweenness_score g;
        let (_, e) = max_edge g in
        Zach.remove_edge_e g e;
        let new_comm = com_edge g in 
        aux g new_comm
      end;
  in aux g comm_init;;

(* girvan_newman karate 2;; *)
(* betweenness_score g1;; *)
Zach.dot_output karate "graphs/karate.dot";;