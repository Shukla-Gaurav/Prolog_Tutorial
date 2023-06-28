% Predicate to solve 8-queens problem
solution_8Q(Queens):-
    permute([1,2,3,4,5,6,7,8], Queens),
    safe(Queens).

% Predicate to compute all permutations of given list
permute([], []).
permute([X|Rest], L) :-
    permute(Rest, L1),
    select(X, L, L1).

% Predicate to check all the queens in the board are safe.
safe([]).
safe([Queen|Others]):-
    safe(Others),
    noattack(Queen, Others, 1).

noattack(_, [], _).
noattack(Y, [Y1|Ylist], Xdist):-
    not(Xdist is Y1 - Y),
    not(Xdist is Y - Y1),
    Dist1 is Xdist + 1,
    noattack(Y, Ylist, Dist1).


% To run the program
% ?- solution_8Q(Queens).
