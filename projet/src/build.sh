ocamlfind ocamlc -c -linkpkg -package ocamlgraph zach.ml
ocamlc -c girvan.mli
ocamlc -c girvan.ml
ocamlc -c convolution.mli
ocamlc -c convolution.ml
ocamlc -c nover.mli
ocamlc -c nover.ml

ocamlfind ocamlopt -linkpkg -package ocamlgraph zach.ml zachgraph.ml samplegraph.ml girvan.ml nover.ml convolution.ml

ocamlfind ocamlopt -linkpkg -package ocamlgraph zach.ml zachgraph.ml samplegraph.ml girvan.ml nover.ml convolution.ml $1.ml

./a.out