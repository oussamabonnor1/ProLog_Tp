occurence([],_,0).
occurence([X|L],Y,N):-Y=X,occurence(L,Y,N1),N is N1+1.
occurence([X|L],Y,N):-Y\=X,occurence(L,Y,N).
