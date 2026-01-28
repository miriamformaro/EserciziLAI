% Definire un predicato prolog zip(L1,L2,L3) tale che L1 e L2 sono due liste ed L3 una lista di lunghezza pari alla lunghezza minima fra L1 e 
% L2 contente per ogni posizione i il termine c(Xi, Yi) dove Xi (risp. Yi) è il termine in posizione i-esima di L1 (risp. L2)
% il predicato deve funzionare in modalitá (+,+, -) e (-, -, +)
% Esempi:
% zip([g, a, t, t, o], [g, o, t], [c(g,g), c(a,o), c(t, t)]) è vero

zip([],_,[]).
zip(_,[],[]).
zip([H|T],[X|R],[c(H,X)|L]):-zip(T,R,L).

% Si considerino i seguenti predicati
%studente(nome, cognome, matricola)
% esame(idcorso, matricola, voto)
% corso(idcorso, nome)
% si definisca il seguente predicato prolog:
% media(matricola, valore) # che restituisce vero se la media degli esami sostenuti dallo studente avente come matricola il primo termine è 
% uguale a valore (si assuma che ogni corso sia caratterizzato dallo stesso numero di crediti)

media(M,V):-studente(_,_,M), avg(M,V).
avg(M,V):- studente(_,_,M),findall(V,esame(_,M,V), LV), sum_list(LV, Voti), length(LV,L),L>0, V is Voti/L.

