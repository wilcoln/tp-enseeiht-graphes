ocamlfind ocamlc -c -linkpkg -package ocamlgraph zach.ml
# ocamlc -c nover.mli
ocamlc -c girvan.mli
# ocamlc -c convolution.mli

# ocamlfind ocamlopt -linkpkg -package ocamlgraph zach.ml zachgraph.ml samplegraph.ml girvan.ml nover.ml convolution.ml
 ocamlfind ocamlopt -linkpkg -package ocamlgraph zach.ml zachgraph.ml samplegraph.ml girvan.ml

 # Script de test partie 1

 ./a.out && dot graphs/$1.dot -Tps -o $1.ps && evince graphs/$1.ps