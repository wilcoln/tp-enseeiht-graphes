open Zach;;
open Samplegraph;;


(* Fonction demandée 1/2 *)
(* Voir contrat dans convolution.mli *)
let convolution g ver =
  let voisins = Zach.succ g ver in 
  let nbvoisins = List.length voisins in 
  let c = List.fold_right 
    (fun voisin tq -> 
        begin 
          let paramvoisin = Zach.getparamv voisin in
          List.map (fun (a,b) -> a +. b) (List.combine tq paramvoisin) 
        end
    )
    voisins (Zach.getparamv ver) in 
    List.map (fun p -> p /. (float_of_int (nbvoisins + 1))) c 



(* Fonction utilitaire 1/2 *)
(* string_of_list : float list -> string *)
(* Paramètre l : une liste de float *)
(* Convertit la liste de nombre en chaines de caractères *)
let string_of_list l = "[ "^(List.fold_right (fun t tq -> (string_of_float t)^" "^tq) l "" )^"]";;

(* Fonction demandée 2/2 *)
(* Voir contrat dans convolution.mli *)
let print_param g = 
  Zach.iter_vertex 
    (fun v -> 
      begin
        let labelv = string_of_int (Zach.getnumberv v) in 
        print_endline (labelv ^" : "^(string_of_list (Zach.getparamv v)))
      end
    ) g;;



(* Fonction utilitaire 2/2 *)
(* compute_and_print_conv : Zach.t -> Zach.vertex -> unit *)
(* Paramètre g : un graphe *)
(* Paramètre v: un sommet *)
(* Calcul et affiche la convolution sur le sommet v du graphe g *)
let compute_and_print_conv g v = 
  let c = convolution g v in 
  print_endline ("conv sur "^(string_of_int (Zach.getnumberv v))^" : "^(string_of_list c));;
