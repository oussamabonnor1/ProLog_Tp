concat([],L,L).
concat([Y|L],L1,[Y|L2]):-concat(L,L1,L2).
