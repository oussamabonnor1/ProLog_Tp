inserer([],X,[X]).
inserer([Y|L],X,[X|L1]):-X<Y,inserer(L,Y,L1).
inserer([Y|L],X,[Y|L1]):-X>Y,inserer(L,X,L1).
