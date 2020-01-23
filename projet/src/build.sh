ocamlfind ocamlc -c -linkpkg -package ocamlgraph zach.ml
ocamlc -c $1.mli
ocamlc -c $1.ml

# ocamlfind ocamlopt -linkpkg -package ocamlgraph zach.ml zachgraph.ml samplegraph.ml girvan.ml nover.ml convolution.ml
 ocamlfind ocamlopt -linkpkg -package ocamlgraph zach.ml zachgraph.ml samplegraph.ml $1.ml

# Script de test partie 2

./a.out
dot graphs/$2.dot -Tps -o graphs/$2.ps && evince graphs/$2.ps