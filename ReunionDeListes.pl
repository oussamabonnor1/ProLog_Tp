concat([],L,L).
concat([Y|L],L1,[Y|L2]):- not(member(Y,L1)),concat(L,L1,L2).
concat([Y|L],L1,L2):-member(Y,L1),concat(L,L1,L2).
