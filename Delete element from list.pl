delete(_,[],[]).
delete(X,[Y|L],L):- X==Y,!.
delete(X,[Y|L],[Y|L1]):- X\==Y,delete(X,L,L1).

