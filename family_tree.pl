% Facts

% Male
male(abraham).
male(clancy).
male(homer).
male(bart).

% Female
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).


% Rules

% 1-Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% 2-Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% 3-Son
son(X, Y) :-
    parent(Y, X),
    male(X).

% 4-Daughter
daughter(X, Y) :-
    parent(Y, X),
    female(X).

% 5-Brother
brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

% 6-Sister
sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

% 7-Grandfather
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 8-Aunt
aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

% 9-Uncle
uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

% 10-Cousin
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    brother(P1, P2).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sister(P1, P2).

% 11-Ancestor
ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).


% Test queries and answers
% Father
% ?- father(homer, bart).
% true.
% ?- father(abraham, homer).
% true.

% Mother
% ?- mother(marge, lisa).
% true.
% ?- mother(mona, homer).
% true.

% Son
% ?- son(bart, homer).
% true.
% ?- son(homer, abraham).
% true.

% Daughter
% ?- daughter(lisa, marge).
% true.
% ?- daughter(marge, clancy).
% true.

% Brother
% ?- brother(bart, lisa).
% true.
% ?- brother(homer, bart).
% false.

% Sister
% ?- sister(lisa, bart).
% true.
% ?- sister(patty, marge).
% true.

% Grandfather
% ?- grandfather(abraham, bart).
% true.
% ?- grandfather(clancy, lisa).
% true.

% Aunt
% ?- aunt(patty, bart).
% true.
% ?- aunt(patty, lisa).
% true.

% Uncle
% ?- uncle(bart, lisa).
% false.
% ?- uncle(homer, bart).
% false.

% Cousin
% ?- cousin(bart, lisa).
% false.
% ?- cousin(lisa, maggie).
% false.

% Ancestor
% ?- ancestor(abraham, bart).
% true.
% ?- ancestor(clancy, maggie).
% true.
