
open Zach;;
open Samplegraph;;

let rec intersect l1 l2 = 
  match l1 with 
  |[]-> []
  |t1::q1-> if List.mem t1 l2 then t1::(intersect q1 l2) else intersect q1 l2

let nover_score_between v1 v2 g = 
  let voisins1 = Zach.succ g v1 in 
  let voisins2 = Zach.succ g v2 in 
  let voisins12 = intersect voisins1 voisins2 in 
  (List.length voisins12)/((List.length voisins1) + (List.length voisins2) - (List.length voisins12))
  
let nover_score g = ();;
  Zach.fold_edges (fun v1 v2  tq -> (nover_score_between v1 v2 g)::tq) g []
  

let step_nover g = ();;

let modularity g l = 0;;

