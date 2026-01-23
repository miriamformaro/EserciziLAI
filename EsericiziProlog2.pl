% ESERCITAZIONE 11/12/2025
persona(marco, 30).    % Caso OK per p1 (Amiche > Amici)
persona(giovanni, 30). % Caso FAIL per p1
persona(paolo, 25).    % Caso OK per p2 (Max amici sono maschi)
persona(luca, 25).     % Caso FAIL per p2 (Max amici misti o femmine)
persona(roberto, 50).  % Caso OK per somma età (20 + 30 = 50)

persona(anna, 40).     % F, vecchia
persona(sara, 42).     % F, molto vecchia
persona(mario, 20).    % M, giovane
persona(luigi, 18).    % M, giovanissimo

persona(aldo, 50).     % M, vecchio
persona(bruno, 50).    % M, vecchio
persona(chiara, 30).   % F, media

persona(dario, 50).    % M, vecchio
persona(elisa, 50).    % F, vecchia (rompe la condizione p2)

persona(tizio, 20).
persona(caio, 30).

maschio(marco). maschio(giovanni). maschio(paolo). maschio(luca). 
maschio(roberto).
maschio(mario). maschio(luigi). maschio(aldo). maschio(bruno). 
maschio(dario). maschio(tizio). maschio(caio).

femmina(anna). femmina(sara). femmina(chiara). femmina(elisa).

% --- FATTI: amico(Persona, Amico) ---

% 1. Amici di MARCO: Donne (40, 42) > Uomini (20, 18). Deve dare TRUE a p1.
amico(marco, anna).
amico(marco, sara).
amico(marco, mario).
amico(marco, luigi).

% 2. Amici di GIOVANNI: Mista, ma Mario (20) non è minore di Chiara (30)? No aspetta, facciamo fallire.
% Mettiamo un amico maschio vecchio (Aldo 50) e amica giovane (Anna 40). 40 non è > 50. FAIL p1.
amico(giovanni, anna).
amico(giovanni, aldo).

% 3. Amici di PAOLO: I più vecchi sono Aldo(50) e Bruno(50). Sono entrambi Maschi. TRUE p2.
amico(paolo, aldo).
amico(paolo, bruno).
amico(paolo, chiara). % Chiara è 30 (più giovane dei max), quindi non conta.

% 4. Amici di LUCA: I più vecchi sono Dario(50) e Elisa(50). Elisa è femmina. FAIL p2.
amico(luca, dario).
amico(luca, elisa).

% 5. Amici di ROBERTO (50 anni): Tizio(20) + Caio(30) = 50. TRUE somma.
amico(roberto, tizio).
amico(roberto, caio).

% vero se tutte le amiche femmine di X sono più grandi degli amici maschi di X 
% --> non è vero che esiste un'amica femmina di X che è più piccola di un amico
% maschio di X
p1(X):- persona(X,_), \+ (femmina(Y), persona(Y,E1), amico(X,Y), maschio(J),
                             persona(J,E2), amico(X,J), E1<E2).

% vero se e solo se gli amici più anziani di X (che non sono più 
% piccoli di un altro amico di X) sono tutti maschi
p2(X):- findall(E, (amico(X,Y), persona(Y,E)), L), max_list(L,M), 
    \+ (amico(X,Y), persona(Y,M), femmina(Y)).

% vero se l'età di X è uguale alla somma dell'età degli amici di X
stessaetadegliamici(X):- findall(E, (amico(X,Y), persona(Y,E)), L), sum_list(L,LE),
    persona(X,A), A=:=LE.

% ESAME 14/06/2024
% --- FATTI: cd(Id, Prezzo, Categoria) ---
cd(1, 15, rock).
cd(2, 20, pop).
cd(3, 10, jazz).
cd(4, 12, rock).      % Altro CD rock (prezzo diverso)
cd(5, 50, classica).  % Molto costoso
cd(6, 5, pop).        % Molto economico (e invenduto)

% --- FATTI: cliente(Id, Nome, Eta) ---
cliente(101, 'Mario Rossi', 25).   % Giovane adulto
cliente(102, 'Luigi Verdi', 60).   % Anziano (Big spender)
cliente(103, 'Anna Bianchi', 16).  % Minorenne
cliente(104, 'Sara Neri', 30).     % Cliente che NON ha fatto ordini (Fantasma)

% --- FATTI: ordine(IdCD, IdCliente, Qta) ---
ordine(1, 101, 10).   % 1x CD Rock (15 euro)
ordine(2, 101, 2).   % 2x CD Pop  (20 euro l'uno)
ordine(3, 102, 10).  % 10x CD Jazz (10 euro l'uno)
ordine(1, 103, 1).   % 1x CD Rock
ordine(4, 103, 1).   % 1x Altro CD Rock

% vero se X è l'id del cd acquistato con la maggiore quantità in un unico 
% ordine -->  non è vero che esiste un cd che è stato acquistato con una 
% quantità maggiore
cdmaxaquisto(X):- \+ (ordine(C,_,Q1), ordine(X,_,Q), C \= X, Q1>Q).

% vero se X è il cd di cui sono state vendute il maggior numero di copie tra 
% tutti gli acquisti
cdpiuvenduto(X):- \+ (cd(X,_,_), findall(Q, ordine(X,_,Q), LX), cd(C,_,_), 
                     findall(Q1, ordine(C,_,Q1), LC), C \= X, sum_list(LX, L),
                         sum_list(LC, J), L < J).

                                                                         
% esercizi simili
% Esercizio 1 (Universale e Negazione)Definire p3(X): vero se e solo se tutti gli amici di X sono maggiorenni (età $\ge 18$)
% oppure se X non ha amici.
% Esercizio 2 (Il più giovane)Definire p4(X): vero se e solo se l'amico più giovane di X è una femmina.
% (Attenzione: ci possono essere più amici con la stessa età minima. Devono essere TUTTI femmine quelli che hanno l'età minima).
% Esercizio 3 (Confronto di Medie)Definire p5(X): vero se e solo se l'età media degli amici maschi di X è strettamente superiore 
% all'età media delle amiche femmine di X.

p3(X):- \+ (amico(X,Y), persona(Y,E), E=<18).

p4(X):- findall(E, (amico(X,Y), persona(Y,E)), LE), min_list(LE, M),
    \+ (amico(X,Y), persona(Y,M), maschio(Y)).

p5(X):- findall(E, (amico(X,Y), persona(Y,E), maschio(Y)), LE),
    findall(E1, (amico(X,Y), persona(Y,E1), femmina(Y)), LE1), media(LE,M1),
    media(LE1,M2), M1 > M2.

media([],0).
media(L1,M):-is_list(L1), sum_list(L1,S), length(L1,L), M is S / L.
