all:
	ocamlbuild dfa_examples.byte

clear:
	rm -f *.cmi *.cmx *.o *.out *.cmo *.byte
	rm -r _build
