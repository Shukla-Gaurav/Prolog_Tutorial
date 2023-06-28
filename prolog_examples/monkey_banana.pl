% Predicate to move from one state to another state
% state is (MH, MV, BoxP, H)
% MH is horizontal position of monkey
% MV is vertical position of monkey
% BoxP is position of box
% H is whether money has banana or not
move(state(middle, onbox, middle, hasnot),
   grasp,
   state(middle, onbox, middle, has)).
move(state(P, onfloor, P, H),
   climb,
   state(P, onbox, P, H)).
move(state(P1, onfloor, P1, H),
   drag(P1, P2),
   state(P2, onfloor, P2, H)).
move(state(P1, onfloor, B, H),
   walk(P1, P2),
   state(P2, onfloor, B, H)).

canget(state(_, _, _, has)).
canget(State1) :-
   move(State1, _, State2),
   canget(State2).


% To run the program
% ?- canget(state(atdoor, onfloor, atwindow, hasnot)).

