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

% ESAME 09/02/2024 DA CAPIRE
segmentList([], []).

% Passo Ricorsivo:
segmentList([H|T], [Gruppo | RestoOutput]) :-
    % 1. Chiama l'ausiliario per estrarre la sequenza che inizia con H
    estrai_sequenza(H, T, Gruppo, RestoLista),
    % 2. Continua ricorsivamente sul resto della lista che non abbiamo usato
    segmentList(RestoLista, RestoOutput).

% --- PREDICATO AUSILIARIO: estrai_sequenza(Corrente, ListaInput, GruppoCostruito, RestoLista) ---

% Caso 1: Il prossimo elemento (Next) è consecutivo a Corrente.
% Lo aggiungiamo al gruppo e continuiamo a cercare.
estrai_sequenza(Curr, [Next|T], [Curr|RestoGruppo], RestoLista) :-
    Next =:= Curr + 1,    % Verifica consecutivo
    !,                    % Cut: se è consecutivo, non considerare l'alternativa sotto
    estrai_sequenza(Next, T, RestoGruppo, RestoLista).

% Caso 2: Il prossimo elemento NON è consecutivo (o la lista è finita).
% Chiudiamo il gruppo corrente e restituiamo il resto della lista intatto.
estrai_sequenza(Curr, RestoInput, [Curr], RestoInput).

% ESAME 13/01/2023
% Data una lista L1 e un numero intero N, scrivere un predicato Prolog domanda1(L1,N,L2) che restituisca in L2 la lista
% degli elementi di L1 che sono liste contenenti al massimo due valori interi positivi compresi tra 1 e 9 la cui somma valga N.
% Esempio:
% :- domanda1([[3,1],5,[2,1,1],[3],[1,1,1],a, [2,2]], 4, L2).

domanda1([],_,[]).
domanda1([H|T],N,[H|L2]):-is_list(H), length(H,2), sum_list(H,N), H=[A,B], 
    between(1,9,A), between(1,9,B), !, domanda1(T,N,L2).
domanda1([_|T],N,L2):-domanda1(T,N,L2).

% Scrivi un predicato estremi_uguali(L1, L2) che, data una lista di liste L1, restituisce in L2 solo le sottoliste in cui il primo e l'ultimo elemento sono identici.
% ?- estremi_uguali([[1, 2, 1], [1, 2, 3], [a, b, a]], L).
estremi_uguali([],[]).
estremi_uguali([H|T],[H|R]):-H=[A|_], last(H,U), A==U,!, estremi_uguali(T,R).
estremi_uguali([_|T],R):-estremi_uguali(T,R).

% Scrivi un predicato prodotto_alto(L1, Soglia, L2) che tiene solo le sottoliste il cui prodotto degli elementi è strettamente maggiore della Soglia.
prodotto_alto([],_,[]).
prodotto_alto([H|T],S,[H|R]):- prodotto(H,P), P>S, !, prodotto_alto(T,S,R).
prodotto_alto([_|T],S,R):-prodotto_alto(T,S,R).

prodotto([],1).
prodotto([H|T],P):-prodotto(T,P1), P is H*P1.

% Scrivi un predicato filtra_pari(L1, L2) che tiene solo le sottoliste composte interamente da numeri pari.
filtra_pari([],[]).
filtra_pari([H|T],[H|R]):- tutti_pari(H), !, filtra_pari(T,R).
filtra_pari([_|T],R):-filtra_pari(T,R).
    
tutti_pari([]).
tutti_pari([H|T]):- H mod 2 =:= 0, tutti_pari(T).

merge(L1,[],L1).
merge([],L2,L2).
merge([H|T],[X|L2],[H|R]):- H < X,!, merge(T,[X|L2],R).
merge([H|T],[X|L2],[X|R]):-H>X, merge([H|T],L2,R).

% Scrivi un predicato comprimi(L1, L2) che elimina gli elementi duplicati adiacenti. Se ci sono più copie dello stesso elemento vicine, ne deve rimanere solo una.
% comprimi([a, a, a, b, c, c, a, a, d], L).
comprimi([],[]).
comprimi([X],[X]).
comprimi([H,H|T],R):-comprimi([H|T],R),!.
comprimi([H,X|T],[H|R]):- H\=X,comprimi([X|T],R).

% esercizi sottoliste
sottoliste_crescenti([],[]).
sottoliste_crescenti([X],[[X]]).
sottoliste_crescenti([H,X|T],[[H|L]|R]):-H=<X, sottoliste_crescenti([X|T],[L|R]).
sottoliste_crescenti([H,X|T],[[H]|R]):-H>X, sottoliste_crescenti([X|T],R).

raggruppa_segni([],[]).
raggruppa_segni([X],[[X]]).
raggruppa_segni([H,X|T],[[H|L]|R]):-stesso_segno(H,X),raggruppa_segni([X|T],[L|R]).
raggruppa_segni([H,X|T],[[H]|R]):- \+ stesso_segno(H,X), raggruppa_segni([X|T],R).

stesso_segno(A, B) :- A >= 0, B >= 0.
stesso_segno(A, B) :- A < 0, B < 0.

pack([],[]).
pack([X],[[X]]).
pack([H,H|T],[[H|L]|R]):-pack([H|T],[L|R]).
pack([H,X|T],[[H]|R]):-H\=X,pack([X|T],R).

consecutivi([],[]).
consecutivi([X],[[X]]).
consecutivi([H,X|T],[[H|L]|R]):-X is H+1, consecutivi([X|T],[L|R]).
consecutivi([H|T],[[H]|R]):- consecutivi(T,R).

elementin(N,L,R):-posizione(N,L,1,R).

posizione(_,[],_,[]).
posizione(N, [H|T], I, [H|R]):- I mod N =:= 0, I1 is I+1, posizione(N,T,I1,R).
posizione(N,[_|T],I,R):- I mod N =\= 0, I1 is I+1, posizione(N,T,I1,R).

segmentlist([],[]).
segmentlist([X],[[X]]).
segmentlist([H,X|T],[[H|Y]|R]):- X =:= H+1, segmentlist([X|T],[Y|R]).
segmentlist([H,X|T],[[H]|R]):- X =\= H+1, segmentlist([X|T],R).
