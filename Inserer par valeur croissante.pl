inserer([],X,[X],0).
inserer([Y|L],X,[X|L1],N):-X<Y,inserer(L,Y,L1,N),N is N + 1.
inserer([Y|L],X,[Y|L1],N):-X>Y,inserer(L,X,L1,N).
