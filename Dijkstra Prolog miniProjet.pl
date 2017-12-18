
arc(a,b,1).
arc(b,e,2).
arc(a,c,3).
arc(c,d,2).
arc(e,d,3).
arc(d,f,2).
arc(d,g,3).
arc(f,g,2).

/*Testing if there is a path*/
way(P1,P2):- arc(P1,P2,_),!.
way(P1,P2):- arc(P1,Pi,_),way(Pi,P2).


%Testing if there is a circuit: (same points on the edges found).
circuitTest(P):- way(P,P), write('Graph containing circuit'),!.
circuitTest(P):- write('Graph does not contain circuit'),fail.


%Testing if a Graph is connexe (there is a way back and forth between two nodes).
isConnexe(P1,P2):- way(P1,P2), way(P2,P1), write('Graph is connexe '),!.
isConnexe(P1,P2):- write('Graph is not connexe '),fail.

/*dijkstra defines shortest Path between two nodes,
  Start: starting node,
  Finish: finishing node,
  ShortestPath: main goal,
  Dist: distance of the ShortestPath.
  */
dijkstra(Start, Finish) :-
  core( [0-[Start]], Finish, RvsShotPath, Dist),
  reverse(RvsShotPath, ShortestPath),
  output(Start,Finish,ShortestPath,Dist).


/*Core is the main function that contains Dijkstra algorithme
  Visited: all  the nodes that have been visited so far,
  Last: the node that the user wants to go to,
  RShortestPath: reversed shortest path so far,
  Dist: distance of the path so far.
  */
core( [ Dist-[Last|RPath] |_], Last, [Last|RPath], Dist) :- !. % when we get to the final node, we stop the reccursivity.

core( Visited, Last, RShortestPath, Dist) :-
  bestCandidate(Visited, BestCandidate),
  core( [BestCandidate|Visited], Last, RShortestPath, Dist).


/*bestCandidate: finds the next best node to go to,
  Visited: path that has been visited so far,
  BestCandidate: the node with the smallest weight,
  findall(): pre-defined function that gives all possible values,
  NextNode: the node that we chose to go to from our current position,
  CurrentDist: the distance we ran so far,
  Length: holds the distance that we may use as best Candidate.
*/
bestCandidate(Visited, BestCandidate) :-
  findall(
     NextNode,
    (
      member( CurrentDist-[P1|Path], Visited),
      arc(P1,P2,Dist),
      \+isVisited(Visited, P2),
      Length is CurrentDist + Dist,
      NextNode = Length-[P2,P1|Path]
      ),
    Candidates
  ),
  minimum(Candidates, BestCandidate).


/*minimum: uses all condidates and selects the lowest weighted condidate.
  keysort(): pre-defined function that sorts the condidates in an increasing way.
*/
minimum(Candidates, BestCandidate) :- keysort(Candidates, [BestCandidate|_]).


/* isVisited: tests if the node has been visited before,
  memberchk(): pre-defined function that tests if a node is included in the visited Path.
*/
isVisited(Visited, P) :- memberchk(_-[P|_], Visited).

output(A,B,L,D):-
 format('the path between ~w and ~w is ~w with cost of ~w ',[A,B,L,D]).
