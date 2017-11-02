
ajout(X,L,[X|L]):-not(member(X,L)).
ajoutFin([],X,[X]).
ajoutFin([Y|L],X,[Y|L1]):- ajoutFin(L,X,L1).

