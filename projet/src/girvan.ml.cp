open Zach;;


let betweenness_score g = 
  Zach.iter_edges_e (fun e -> Zach.setscore 0. e) g ;
  let lst_v = Zach.fold_vertex (fun v l -> v::l) g [] in
  let rec aux l1 =
    match l1 with
    | [] -> ()
    | t::q -> let l2 =  List.flatten (List.map (fun t1 -> fst (Zach.shortest_path g t t1)) q) in
            List.iter (fun e -> Zach.incrscore 1. e) l2;
            aux q
  in aux lst_v;;

let girvan_newman g n_com = 
  let comm_init = List.length (Zach.components g) in
  let rec aux g comm_actuelle = 
    if Zach.nb_edges g != 0 && comm_actuelle < n_com then
      (betweenness_score g;
      let (_, e) = Zach.fold_edges_e (fun e (m, emax) -> let score = (Zach.getscore e) in if m >= score  then (m,emax) else (score,e)) g (0., Zach.choosee g) in
      Zach.remove_edge_e g e;
      let new_comm = List.length (Zach.components g) in 
      aux g new_comm);
  in aux g comm_init;
