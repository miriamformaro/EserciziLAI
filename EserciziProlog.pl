% -----------------------------------------------------------
% 1. BASE DI FATTI (ORDINATA)
% -----------------------------------------------------------

% --- GENERE ---
maschio(luca).
maschio(marco).
maschio(paolo).
maschio(giovanni).
maschio(alessandro).
maschio(leo).        % Spostato qui per ordine!

femmina(anna).
femmina(maria).
femmina(chiara).
femmina(elena).
femmina(sofia).

% --- PERSONA(Nome, Età) ---
persona(luca, 22).
persona(marco, 25).
persona(paolo, 30).
persona(giovanni, 20).
persona(alessandro, 50).
persona(anna, 28).
persona(maria, 24).
persona(chiara, 35).
persona(elena, 31).
persona(sofia, 12).
persona(leo, 10).    % Spostato qui per ordine!

% --- AMICO(Chi, Chi) ---
% Amici di Luca
amico(luca, giovanni).
amico(luca, maria).
amico(luca, anna).

% Amici di Marco
amico(marco, alessandro).
amico(marco, elena).

% Amici di Anna (aggiunti per testare il fallimento di p1)
amico(anna, alessandro).
amico(anna, elena).

% Amici di Paolo (Caso Somma: 12 + 10 = 22)
amico(paolo, sofia).
amico(paolo, leo).
amico(paolo, luca).
% CASO 4: ANNA (Fail p1)
% Ha un amico maschio vecchio (Alessandro 50) e una femmina giovane (Elena 21).
% 21 NON è maggiore di 50. -> p1 Falso.
amico(anna, alessandro). % M, 50
amico(anna, elena).      % F, 21

% vero se e solo X tutte le amiche femmine di X sono pi`u grandi di
% almeno un amico maschio di X
p1(X):- amico(X,Y), maschio(Y), persona(Y,E), \+ (amico(X,Z), femmina(Z), persona(Z,A), A<E).

p2(X):- \+ (amico(X,Y), amico(X,Z), persona(Y,E1), persona(Z,E2), E1>E2, femmina(Y)).

p3(X):- amico(X,Y), persona(Y,E), findall(E1, (amico(X,A), A \= Y, persona(A,E1)), LA), sum_list(LA,E).

p4(X):- persona(X,E), \+ (amico(X,Y), persona(Y,E1), E1<E).

% cd(Id, Prezzo, Categoria).
cd(cd1, 15, pop).
cd(cd2, 20, rock).
cd(cd3, 12, jazz).
cd(cd4, 25, classica).
cd(cd5, 18, metal).

% cliente(Id, Nome, Età).
cliente(c1, alice, 25).
cliente(c2, bob, 35).
cliente(c3, carlo, 45).
cliente(c4, davide, 20).

% ordine(IdCD, IdCliente, Qta).

% --- CASO A: Il record del singolo scontrino ---
% CD1 ha un ordine enorme (100 copie), ma solo quello.
ordine(cd1, c1, 100). 

% --- CASO B: Il best seller totale ---
% CD2 viene comprato da tutti. 
% Ordini da 40, 40, 30. Totale = 110.
% 110 > 100. Quindi CD2 è il più venduto in totale, 
% anche se CD1 ha l'ordine singolo più grosso.
ordine(cd2, c1, 40).
ordine(cd2, c2, 40).
ordine(cd2, c3, 30).

% --- CASO C: Insiemi di Clienti (Sottoinsiemi) ---
% CD3 comprato da {c1, c2}.
ordine(cd3, c1, 5).
ordine(cd3, c2, 5).

% CD4 comprato solo da {c1}.
% {c1} è sottoinsieme stretto di {c1, c2} (clienti di CD3) 
% e di {c1, c2, c3} (clienti di CD2).
% Quindi CD4 NON è massimale.
ordine(cd4, c1, 1).

% CD5 comprato da {c4}.
% {c4} è disgiunto dagli altri. Nessuno lo contiene.
% Quindi CD5 è massimale (insieme a CD2).
ordine(cd5, c4, 10).

cdmaxacquisto(X):- ordine(X,_,Q), \+ (ordine(Y,_,Q1), X\=Y, Q1>Q).

cdpiuvenduto(X):- cd(X,_,_),findall(Q, ordine(X,_,Q), LQ), sum_list(LQ,S),
    \+ (cd(Y,_,_),Y\=X, findall(Q1, ordine(Y,_,Q1), LQ1), sum_list(LQ1,S1), S1 > S).

% film(Titolo, Regista, Genere).
film(pulp_fiction, tarantino, thriller).
film(kill_bill, tarantino, azione).
film(avatar, cameron, sci_fi).
film(titanic, cameron, drammatico).
film(inception, nolan, sci_fi).
film(tenet, nolan, sci_fi).
film(interstellar, nolan, sci_fi).

% attore(Nome, TitoloFilm).
attore(dicaprio, titanic).
attore(dicaprio, inception).
attore(dicaprio, shutter_island). % Film non in lista, va bene
attore(thurman, pulp_fiction).
attore(thurman, kill_bill).
attore(pitt, inglorious_basterds). % Tarantino ma non in lista film

attorefedele(X,R):- findall(F, (attore(X,F),film(F,R,_)), LF), length(LF,L), L>=2.

solouno(R):- \+ (film(F1,R,G1), film(F2,R,G2), F1\=F2, G1\=G2).

% tratta(Da, A, Costo).
tratta(milano, bologna, 20).
tratta(bologna, firenze, 15).
tratta(firenze, roma, 25).
tratta(milano, torino, 10).
tratta(torino, genova, 15).
tratta(genova, roma, 40).
tratta(roma, napoli, 20).

percorso(P,P,_,[P]).
percorso(P,A,B,[P|R]):-tratta(P,D,C), C =< B, Br is B - C, percorso(D,A,Br,R).

somma_pari([],0).
somma_pari([H|T],S):-H mod 2 =:= 0, somma_pari(T,S1), S is S1+H,!.
somma_pari([_|T],S):-somma_pari(T,S).

% ricetta(NomePiatto, ListaIngredienti).
ricetta(carbonara, [uova, guanciale, pecorino, pepe, pasta]).
ricetta(cacio_pepe, [pecorino, pepe, pasta]).
ricetta(frittata, [uova, sale, olio]).

% frigo(Ingrediente).
% Ho questi ingredienti in casa:
frigo(uova).
frigo(guanciale).
frigo(pecorino).
frigo(pasta).
frigo(sale).
frigo(olio).
% Nota: Manca il 'pepe'!

posso(P):- \+ (ricetta(P,L), member(I,L), \+ frigo(I)).

lista(P,R):- ricetta(P,L), findall(I, (member(I,L), \+ frigo(I)), R).

merge_sum([],_,[]).
merge_sum(_,[],[]).
merge_sum([H|L1],[X|L2],[s(H,X,S)|R]):-S is H+X, merge_sum(L1,L2,R).

% app(IdApp, Nome, Categoria).
app(a1, whatsapp, social).
app(a2, instagram, social).
app(a3, candy_crush, gioco).
app(a4, clash_royale, gioco).
app(a5, excel, produttivita).

% download(IdApp, IdUtente, MegaBytes).
% Quanti dati ha scaricato un utente per quell'app (es. aggiornamenti)
download(a1, u1, 50).
download(a1, u2, 50).
download(a2, u1, 100).
download(a2, u2, 200).
download(a2, u3, 100).
download(a3, u1, 500).  % Un download enorme singolo
download(a4, u4, 20).

% utente(IdUtente, Nome, Eta).
utente(u1, marco, 25).
utente(u2, luca, 16).
utente(u3, anna, 25).
utente(u4, elena, 40).

q1(X):-download(X,_,M), \+ (download(Y,_,B), X\=Y, B>M).

q2(X):- app(X,_,_), findall(M, download(X,_,M), LM), sum_list(LM,S1),
   	 \+ (app(Y,_,_), Y\=X, findall(M1, download(Y,_,M1), LM1), sum_list(LM1,S2), S2>S1).

categoria(C):- \+ (app(X,_,C), download(X,U,_), utente(U,_,E), E < 18).

rle([],[]).
rle([X],[c(X,1)]).
rle([H,H|T],[c(H,N)|R]):- rle([H|T],[c(H,N1)|R]), N is 1+N1.
rle([H,X|T],[c(H,1)|R]):-H\=X, rle([X|T],R).

interleave(L1,[],L1).
interleave([],L2,L2).
interleave([H|T],[X|R],[H,X|L]):- interleave(T,R,L).

% libro(IdLibro, Titolo, Genere).
libro(l1, dune, sci_fi).
libro(l2, fondazione, sci_fi).
libro(l3, it, horror).
libro(l4, shining, horror).
libro(l5, odissea, classico).

% prestito(IdLibro, IdUtente, GiorniPossesso).
% Indica per quanti giorni l'utente ha tenuto il libro prima di restituirlo.
prestito(l1, u1, 10).
prestito(l2, u1, 15).
prestito(l3, u1, 5).
prestito(l5, u1, 30). % u1 ha letto sci_fi, horror e classico.

prestito(l1, u2, 7).
prestito(l2, u2, 7).
prestito(l5, u2, 50). % u2 non ha letto horror.

prestito(l3, u3, 40). % u3 ha letto solo horror.

% utente(Id, Nome).
utente(u1, mario).
utente(u2, luca).
utente(u3, anna).

libro_lento(X):- libro(X,_,_), findall(G, prestito(X,_,G), LG), sum_list(LG,P), length(LG,L),L>0, M is P / L, M > 20.

unico(X):- utente(X,_), \+ ( libro(_,_,G), \+ (libro(L,_,G), prestito(L,X,_))).

genere(G):- \+ (prestito(L,U,_), libro(L,_,G),prestito(L1,U,_), libro(L1,_,G1), G\=G1, G1 == 'sci_fi').

merge_ordinato(L1,[],L1).
merge_ordinato([],L2,L2).
merge_ordinato([H|T],[X|R],[H|L]):-H=<X, merge(T,R,L).
merge_ordinato([H|T],[X|R],[X|L]):-H>X,merge(T,R,L).

% corso(NomeEsame, CFU).
corso(basi_di_dati, 9).
corso(algoritmi, 9).
corso(reti, 6).
corso(inglese, 3).

% studente(Matricola, Nome).
studente(101, mario).
studente(102, luca).
studente(103, anna).

% superato(Matricola, NomeEsame, Voto).
superato(101, basi_di_dati, 28).
superato(101, algoritmi, 30).
superato(101, reti, 25).
superato(101, inglese, 18). % Mario li ha fatti TUTTI

superato(102, basi_di_dati, 20).
superato(102, inglese, 30). % Luca ne ha fatti solo 2

superato(103, algoritmi, 30).
superato(103, reti, 30).
superato(103, inglese, 30). 
% Anna ha ottimi voti ma le manca "basi_di_dati".

studente_modello(X):- studente(X,_), \+ (corso(E,_), \+ superato(X,E,_)).

studente_specialista(N):- studente(X,N), findall(C, (corso(E,C), 
                             superato(X,E,_), E \= 'inglese'), LC), 
    sum_list(LC,L), L>=15.

% contatto(Spia, Spia). (Chi conosce chi)
contatto(bond, q).
contatto(q, m).
contatto(m, moneypenny).
contatto(bond, felix).
contatto(felix, le_chiffre).
contatto(le_chiffre, white).
contatto(white, blofeld).

% compromessa(Spia). (Spie catturate o doppiogiochisti)
compromessa(le_chiffre).
compromessa(m).

% propedeutico(Prima, Dopo).
propedeutico(analisi1, analisi2).
propedeutico(analisi1, fisica1).
propedeutico(analisi2, sistemi).
propedeutico(fisica1, elettronica).
propedeutico(programmazione, algoritmi).
propedeutico(algoritmi, intelligenza_artificiale).

serve_tutto(_,[]):-true.
serve_tutto(O,[H|P]):-propedeutico(H,O), serve_tutto(H,P).

sottolisten([],_,[]).
sottolisten([H|T],N,[H|R]):- length(R,Y), Y==N-1, sottolisten(T,N,R).

%  Data una lista L1, restituisce in L2 solo gli elementi che sono sottoliste 
%  di due interi positivi (1-9) la cui somma vale N.
domanda1([],_,[]).
domanda1([H|T],N,[H|R]):-is_list(H), length(H,2), H=[A,B], between(1,9,A), 
    between(1,9,B), sum_list(H,N), domanda1(T,N,R).
domanda1([_|T],N,R):-domanda1(T,N,R).

zipequals([],_,[]).
zipequals(_,[],[]).
zipequals([H|T],[X|R],[f(H,X)|L]):-H\=X,zipequals(T,R,L).
zipequals([H|T],[X|R],L):-H==X,zipequals(T,R,L).

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
