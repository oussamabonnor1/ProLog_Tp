palendrome([]):-write("true").
palendrome([y]):-write("true").

remplir([],L):-palendrome(,L).
remplir([Y|L],[Y|L1]):-remplir(L,L1).

palendrome([Y|L],
