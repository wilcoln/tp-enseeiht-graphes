open Graph.Pack.Graph;;

let g1 = create ();;
let v0=V.create 0;;
let v1=V.create 1;;
let v2=V.create 2;;
let v3=V.create 3;;
add_vertex g1 v0;;
add_vertex g1 v1;;
add_vertex g1 v2;;
add_vertex g1 v3;;
add_edge g1 v0 v1;;
add_edge g1 v1 v2;;
add_edge g1 v2 v0;;
add_edge g1 v2 v3;;

let create_graphe_complet n = 

  let g = create () in 

    let rec aux n g = 
      if n = 0 then 
        g
      else 
        let nsommet = (V.create n) in 
        let _ = add_vertex ((aux (n-1) g)) nsommet in 
        let _ = iter_vertex (fun sommet -> add_edge g sommet nsommet; add_edge g nsommet sommet) g in
        let _ = remove_edge g nsommet nsommet in g
    in aux n g


(* 
let graphe = create_graphe_complet 5;; 
dot_output graphe "graph.dot";; 
*)


let calcul_nombre_sommets graphe = fold_vertex (fun sommet tq -> 1 + tq) graphe 0


(* 
let nombre = calcul_nombre_sommets graphe;;
print_int nombre
*)


let create_graphe_with_sommets_aretes ls la = 
  let g = create() in  
  let _ = List.map (fun s -> add_vertex g s) ls in
  let _ = List.map (fun a -> add_edge g (fst a) (snd a)) la in
  g




let s1 = V.create 1;;
let s2 = V.create 2
let graphe = create_graphe_with_sommets_aretes [s1; s2] [(s1, s2)];;
dot_output graphe "graph.dot";;
