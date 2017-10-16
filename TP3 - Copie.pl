element(X,[X|_]):-!.
element(X,[Y|L]):-X \= Y,element(X,L).
commain(L,M):-element(X,L),element(X,M).
disjoint(L,M):-not(commain(L,M)).
disjoint(L,M):- element(X,L),element(X,M),fail,!.
 (-.(-.(-.-).-).-)
/( /( /(   )\ )\ )\
  |  |  | |  |  |
 -  -  -   -  -  -

















