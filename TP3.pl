element(X,[X|_]):-!.
element(X,[Y|L]):-X \= Y,element(X,L).
























