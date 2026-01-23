% ESAME 14/06/2024
% n°1
% Definire un predicato prolog zip(L1,L2,L3) tale che L1 e L2 sono due 
% liste ed L3 una lista di lunghezza pari alla lunghezza minima fra L1 e L2
% contente per ogni posizione i il termine c(Xi, Yi) dove Xi (risp. Yi) `e il
% termine in posizione i-esima di L1 (risp. L2)
% il predicato deve funzionare in modalit´a (+,+, -) e (-, -, +)
% Esempi:
% zip([g, a, t, t, o], [g, o, t], [c(g,g), c(a,o), c(t, t)]) `e vero

zip([],[],[]).
zip([],_,[]).
zip(_,[],[]).
zip([H|T],[J|R],[c(H,J)|K]):-zip(T,R,K), !.
