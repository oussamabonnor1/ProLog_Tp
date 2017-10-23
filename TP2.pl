arc(x1,x2).
arc(x2,x3).
arc(x3,x6).
arc(x6,x1).
arc(x3,x5).
arc(x3,x4).
arc(x5,x4).
chemin(X,Y):-arc(X,Y).
chemin(X,Y):-arc(X,Z),chemin(Z,Y).
longueur(X,Y,0):-not(chemin(X,Y)),!.
longueur(X,Y,1):-arc(X,Y).
longueur(X,Y,N):-arc(X,Z),longueur(Z,Y,N1),N is N1 + 1.


