% check all items in list are positive.
is_positive([]).
is_positive([H|T]):- H > 0, is_positive(T).
% Run: ?- is_positive([2,3,-4]). 


% Find union of two lists.
union([], L2, L2).
union([H|T], L2, [H|R1]):- not(member(H, L2)), union(T, L2, R1).
union([H|T], L2, R1):- member(H, L2), union(T, L2, R1).
% Run: ?- union([2,3,-4], [2,4,5,6], R). 

