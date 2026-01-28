nodo(a, 10).  nodo(b, 20).  nodo(c, 50).
nodo(d, 0).   nodo(e, 10).  nodo(f, 5).
arco(a, b).   arco(a, d).   arco(b, c).
arco(d, e).   arco(e, c).

valoreraggiungibile(X, V) :- nodo(X, V).
valoreraggiungibile(X,V):-arco(X,Y), valoreraggiungibile(Y,V).

maxVRaggiungibile(X,V):-findall(P,valoreraggiungibile(X,P),LP), LP\=[], max_list(LP,V).

sommaraggiungibile(X,S):-findall(V,valoreraggiungibile(X,V),LV), sum_list(LV,S).

contaRicchi(X,S,C):-findall(V,(valoreraggiungibile(X,V),V>S),LV), length(LV,C).

% persona(Nome, Lavoro).
persona(luca, studente).
persona(marco, idraulico).
persona(anna, avvocato).
persona(giulia, medico).
persona(paolo, disoccupato).

% amico(Persona, Amico).
amico(luca, marco).
amico(marco, anna).
amico(anna, giulia).
amico(luca, paolo).

cerca_lavoro(P,L):-persona(P,L).
cerca_lavoro(P,L):-amico(P,A),cerca_lavoro(A,L).

% meteo(Citta, Previsione).
meteo(roma, sole).
meteo(parigi, pioggia).
meteo(londra, nebbia).
meteo(new_york, neve).
meteo(tokyo, sole).

% volo(Da, A).
volo(roma, parigi).
volo(parigi, londra).
volo(parigi, new_york).
volo(roma, tokyo).

previsione_raggiungibile(C,P):-meteo(C,P).
previsione_raggiungibile(C,P):-volo(C,V),previsione_raggiungibile(V,P).

% tossicita(Organismo, Livello).
tossicita(alghe, 10).
tossicita(gamberetto, 0).
tossicita(tonno, 2).
tossicita(squalo, 5).
tossicita(uomo, 0).

% mangia(Predatore, Preda).
mangia(gamberetto, alghe).
mangia(tonno, gamberetto).
mangia(squalo, tonno).
mangia(uomo, tonno).

contaminazione(P,L):-tossicita(P,L).
contaminazione(P,L):-mangia(P,O),contaminazione(O,L).
