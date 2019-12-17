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
    let rec aux n g lsommets = 
      if n = 0 then 
        g
      else 
        let nsommet = (V.create n) in 
        let _ = add_vertex (aux (n-1) g (nsommet::lsommets) nsommet)  in 
        if n > 1 then
          let _ = List.map (add_edge g nsommet) lsommets in g
        else g

    in aux n g []




  let graphe = create_graphe_complet 5;;
  
  dot_output graphe "graph.dot";;



