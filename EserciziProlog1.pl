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
