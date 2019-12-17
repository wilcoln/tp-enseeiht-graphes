open Graph.Pack.Graph
(* graphe non orienté g1 *)
(* les sommets de label 0,1,2 forment une clique *)
(* et {2,3} est une arête *)

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

dot_output g1 "graph.dot";;

(* Graphe non orienté g2 *)
(* avec trois composantes connexes K_1 K_2 et K_3 *)
let g2 = create ();;
let k00=V.create 0;;
let k10=V.create 1;;
let k11=V.create 2;;
let k20=V.create 3;;
let k21=V.create 4;;
let k22=V.create 5;;
add_vertex g2 k00;;
add_vertex g2 k10;;
add_vertex g2 k11;;
add_vertex g2 k20;;
add_vertex g2 k21;;
add_vertex g2 k22;;
add_edge g2 k10 k11;;
add_edge g2 k20 k21;;
add_edge g2 k21 k22;;
add_edge g2 k22 k20;;

(* graphe ge eulérien K_3 *)
let ge = create ();;
let k0=V.create 0;;
let k1=V.create 1;;
let k2=V.create 2;;
add_vertex ge k0;;
add_vertex ge k1;;
add_vertex ge k2;;
add_edge ge k0 k1;;
add_edge ge k2 k1;;
add_edge ge k0 k2;;

(* un poisson *)
(* /\/| *)
(* \/\| *)
let gp = create ();;
let v0=V.create 0;;
let v1=V.create 1;;
let v2=V.create 2;;
let v3=V.create 3;;
let v4=V.create 4;;
let v5=V.create 5;;
add_vertex gp v0;;
add_vertex gp v1;;
add_vertex gp v2;;
add_vertex gp v3;;
add_vertex gp v4;;
add_vertex gp v5;;
add_edge gp v0 v1;;
add_edge gp v0 v2;;
add_edge gp v1 v3;;
add_edge gp v2 v3;;
add_edge gp v3 v4;;
add_edge gp v3 v5;;
add_edge gp v4 v5;;

(* la petite maison semi eulerienne *)
let gm = create ();;
let v0=V.create 0;;
let v1=V.create 1;;
let v2=V.create 2;;
let v3=V.create 3;;
let v4=V.create 4;;
add_vertex gm v0;;
add_vertex gm v1;;
add_vertex gm v2;;
add_vertex gm v3;;
add_vertex gm v4;;
add_edge gm v0 v1;;
add_edge gm v0 v2;;
add_edge gm v1 v2;;
add_edge gm v1 v3;;
add_edge gm v1 v4;;
add_edge gm v2 v3;;
add_edge gm v2 v4;;
add_edge gm v3 v4;;



(* un graphe semi-eulérien *)
let g_euler = create ();;

let v4 = V.create 1;;
let v5 = V.create 2;;
let v6 = V.create 3;;
let v1 = V.create 4;;
let v7 = V.create 5;;
let v8 = V.create 6;;
let v2 = V.create 7;;
let v3 = V.create 8;;

add_vertex g_euler v5;;
add_vertex g_euler v6;;
add_vertex g_euler v1;;
add_vertex g_euler v8;;
add_vertex g_euler v2;;
add_vertex g_euler v3;;
add_vertex g_euler v7;;
add_vertex g_euler v4;;

add_edge g_euler v5 v6;;
add_edge g_euler v8 v4;;
add_edge g_euler v4 v5;;
add_edge g_euler v1 v2;;
add_edge g_euler v8 v1;;
add_edge g_euler v3 v8;;
add_edge g_euler v3 v7;;
add_edge g_euler v7 v4;;
add_edge g_euler v2 v3;;
add_edge g_euler v6 v8;;