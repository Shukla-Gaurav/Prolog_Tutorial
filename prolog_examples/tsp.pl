distance(a, b, 10).
distance(a, c, 15).
distance(a, d, 20).
distance(b, c, 35).
distance(b, d, 25).
distance(c, d, 30).
distance(X, Y, D) :- distance(Y, X, D).

% Predicate to compute all permutations of given list
permute([], []).
permute([X|Rest], L) :-
    permute(Rest, L1),
    select(X, L, L1).

min_distance([MinP], [MinD], MinP, MinD).
min_distance([P1,_|PT], [D1,D2|DT], MinP, MinD) :-
    D1 =< D2,
    min_distance([P1|PT], [D1|DT], MinP, MinD).
min_distance([_,P2|PT], [D1,D2|DT], MinP, MinD) :-
    D1 > D2,
    min_distance([P2|PT], [D2|DT], MinP, MinD).

% Predicate to calculate the total distance of a path
calculate_distance([_], 0).
calculate_distance([City1, City2 | Rest], Distance) :-
    distance(City1, City2, SegmentDistance),
    calculate_distance([City2 | Rest], RestDistance),
    !,
    Distance is SegmentDistance + RestDistance.

% Predicate to solve the Traveling Salesman Problem 
explore_all_paths(Cities, Path, Distance) :-
    % Generate all permutations of the cities
    permute(Cities, Path),
    % Calculate the total distance of the path
    calculate_distance(Path, Distance),
    write(Path), write('='), write(Distance),
    nl.

process([], [], []).
process([H|T], [P|RestP], [D|RestD]) :-
    H = [P, D | _],
    process(T, RestP, RestD). 

solve_tsp(Cities, MinP, MinD) :-
    findall([Path, Distance], explore_all_paths(Cities, Path, Distance), R),
    process(R, Paths, Distances),
    min_distance(Paths, Distances, MinP, MinD).


% To run the program
% ?- solve_tsp([a,b,c,d], MinP, MinD).

