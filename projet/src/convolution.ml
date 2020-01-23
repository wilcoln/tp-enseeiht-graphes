 open Zach;;
open Samplegraph;;

let convolution g ver =
  let voisins = Zach.succ g ver in 
  let nbvoisins = List.length voisins in 
  let c = List.fold_right (fun voisin tq -> 
  begin 
    let paramvoisin = Zach.getparamv voisin in 
    List.map (fun (a,b) -> a +. b) (List.combine tq paramvoisin) 
  end)
   voisins (Zach.getparamv ver) in
   List.map (fun p -> p /. (float_of_int (nbvoisins + 1))) c 


let string_of_list l = "[ "^(List.fold_right (fun t tq -> (string_of_float t)^" "^tq) l "" )^"]";;


let print_param g = 
  Zach.iter_vertex (fun v -> 
    begin
      let labelv = string_of_int (Zach.getnumberv v) in 
      print_endline (labelv ^" : "^(string_of_list (Zach.getparamv v)))
    end) g;;


let getlabel v = string_of_int (Zach.getnumberv v);;

Zach.dot_output g4 "graphs/g4.dot";;
print_param g4;;
let c1 = convolution g4 v4_1;;
print_endline ("conv sur "^(getlabel v4_1)^" : "^(string_of_list c1));;