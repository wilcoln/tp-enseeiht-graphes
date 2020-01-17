open Zach;;
open Zachgraph;;
open Samplegraph;;


  let betweenness_score_edge g edge = 
    Zach.fold_vertex (fun sommet score_edge_autres_sommets -> 
    begin
      let cheminsSommetAutreSommets = Zach.fold_vertex (fun noeud cheminsSommetAutreNoeuds -> (Zach.shortest_path g sommet noeud)::cheminsSommetAutreNoeuds) g [] in 
      let rec aux reste_chemins = 
        match reste_chemins with
        | [] -> 0.
        | cheminAvecCout::q -> if (List.mem edge (fst cheminAvecCout)) then 1. +. (aux q) else (aux q)
      in (aux cheminsSommetAutreSommets) +. score_edge_autres_sommets
    end
    ) g 0.;;

let max g e1 e2 =
    let score_e1 = Zach.getscore e1 in
    let score_e2 = Zach.getscore e2 in
    if score_e1 >= score_e2 then e1 else e2;;

let get_max_edge g = print_endline "get_maxe"; Zach.fold_edges_e (max g) g (Zach.choosee g);;

let init_score_edge e = Zach.setscore 0. e;;
let maj_score_edge g e = 
  print_endline "maj score e";
  let score = (betweenness_score_edge g e) in
  print_endline (string_of_float score); Zach.incrscore score e;;

let betweenness_score g = 
  print_endline "be";
      Zach.iter_edges_e init_score_edge g;
      Zach.iter_edges_e (maj_score_edge g) g; print_endline "fin be" ;;

print_endline (string_of_float (betweenness_score_edge karate ed1));;


let girvan_newman g n_com = 
    let rec aux g n_com= 
      
      begin
        let nb_edges = Zach.nb_edges g in
        print_endline "pass nb_edge";
        let nb_compo_actuel = List.length (Zach.components g) in
        print_endline "pass nb comp";
        if (nb_edges != 0) && (n_com > nb_compo_actuel) then
          print_endline "entre if";

          betweenness_score g;   
          let max_edge = get_max_edge g in 
          print_endline (string_of_float (Zach.getscore max_edge));
          print_endline "av_rem";
          Zach.remove_edge_e g max_edge;
          print_endline "ap_rem";
          aux g n_com;
      end in aux g n_com;;

Zach.dot_output g1 "graphs/g1.dot";;
girvan_newman g1 1;;

Zach.dot_output g1 "graphs/g1.dot";;

