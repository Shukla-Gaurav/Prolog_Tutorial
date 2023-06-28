start(jug(0,0)).

% Define the goal state
goal(jug(_,2)).

% Define the actions that can be taken
action(fill1, jug(_,Y), jug(4,Y)).
action(fill2, jug(X,_), jug(X,3)).
action(empty1, jug(_,Y), jug(0,Y)).
action(empty2, jug(X,_), jug(X,0)).
action(pour1to2, jug(X,Y), jug(X1,Y1)) :- X > 0, Y < 3, X1 is X-min(X,(3-Y)), Y1 is Y+min(X, (3-Y)).
action(pour2to1, jug(X,Y), jug(X1,Y1)) :- Y > 0, X < 4, Y1 is Y-min(Y, (4-X)), X1 is X+min(Y, (4-X)).

% Define the DFS algorithm
dfs(State, [], _) :- goal(State).
dfs(State, [Action|Actions], Visited):-
    action(Action, State, State1),  
    State1 \= State, not(member(State1, Visited)), 
    write(Action), write(' : '), write(State1), nl, 
    dfs(State1, Actions, [State1|Visited]).


% To run the program
% ?- start(State), dfs(State, Actions, [State]).
