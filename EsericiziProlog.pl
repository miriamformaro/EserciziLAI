-- ESERCITAZIONE 11/12/2025
-- n°2
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


                                                                         
