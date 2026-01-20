data AlberoBInt = Vuoto | Nodo Int AlberoBInt AlberoBInt
alberoBil = Nodo 6 (Nodo 8 (Nodo (-10) Vuoto Vuoto) Vuoto) (Nodo 8 (Nodo 9 Vuoto Vuoto) Vuoto)

-- Scrivi una funzione che restituisce il numero di volte che x compare nell'albero.
contaOcc :: Int -> AlberoBInt -> Int
contaOcc _ Vuoto = 0
contaOcc x (Nodo v sx dx) 
    | x == v = 1 + contaOcc x sx + contaOcc x dx
    | otherwise = contaOcc x sx + contaOcc x dx

-- La funzione deve restituire True solo se tutti i nodi contengono numeri maggiori di 0. Se anche solo uno è negativo o zero, restituisce False.
tuttiPositivi :: AlberoBInt -> Bool
tuttiPositivi Vuoto = True
tuttiPositivi (Nodo v sx dx) = (v>0) && tuttiPositivi sx && tuttiPositivi dx

-- L'altezza è la lunghezza del cammino più lungo dalla radice a una foglia. Un albero vuoto ha altezza 0. Un albero con solo la radice ha altezza 1.
altezza :: AlberoBInt -> Int
altezza Vuoto = 0
altezza (Nodo v sx dx) = 1 + max (altezza sx) (altezza dx)

-- La struttura (chi è figlio di chi) rimane identica, ma ogni valore contenuto nei nodi deve essere moltiplicato per 2.
raddoppiaAlbero :: AlberoBInt -> AlberoBInt
raddoppiaAlbero Vuoto = Vuoto
raddoppiaAlbero (Nodo v sx dx) = Nodo (2*v) (raddoppiaAlbero sx) (raddoppiaAlbero dx)

-- Vogliamo trasformare l'albero in una Lista piatta che contiene tutti i valori. L'ordine deve essere: prima tutto il sottoalbero sinistro, poi il nodo corrente, poi tutto il sottoalbero destro. (Questa si chiama Visita Simmetrica o In-Order).
alberoInLista :: AlberoBInt -> [Int]
alberoInLista Vuoto = []
alberoInLista (Nodo v sx dx) = alberoInLista sx ++ [v] ++ alberoInLista dx

-- Devi invertire la destra con la sinistra per ogni nodo dell'albero.
specchio :: AlberoBInt -> AlberoBInt
specchio Vuoto = Vuoto
specchio (Nodo v sx dx) = Nodo v (specchio dx) (specchio dx)

-- Calcola la somma del valore dei nodi a un livello specifico k
sommaLivello :: Int -> AlberoBInt -> Int
sommaLivello _ Vuoto = 0
sommaLivello 0 (Nodo v _ _) = v
sommaLivello k (Nodo _ sx dx) = sommaLivello (k-1) sx + sommaLivello (k-1) dx

-- Conta le Foglie. Una "foglia" è un nodo che non ha figli (sia sinistro che destro sono Vuoto). Spesso agli esami si chiede di contare solo quelle, ignorando i nodi interni.
contaFoglie :: AlberoBInt -> Int
contaFoglie Vuoto = 0
contaFoglie (Nodo _ Vuoto Vuoto) = 1
contaFoglie (Nodo _ sx dx) = contaFoglie sx + contaFoglie dx

-- Il Massimo Elemento. Trova il valore più alto contenuto in tutto l'albero. (Assumiamo per semplicità che l'albero contenga solo numeri positivi, così se è Vuoto possiamo restituire 0 o un valore minimo).
massimoAlbero :: AlberoBInt -> Int
massimoAlbero Vuoto = 0
massimoAlbero (Nodo v sx dx) = max v (max (massimoAlbero sx) (massimoAlbero dx))

-- restituire True se esiste un cammino che parte dalla radice e arriva a una foglia tale che la somma di tutti i nodi nel percorso sia esattamente k.
pathSum :: Int -> AlberoBInt -> Bool
pathSum _ Vuoto = False
pathSum x (Nodo v sx dx) = x==v || pathSum (x-v) sx || pathSum (x-v) dx

-- Questa funzione prende in input due alberi e restituisce True se sono strutturalmente identici e contengono gli stessi valori nelle stesse posizioni.
uguali :: AlberoBInt -> AlberoBInt -> Bool
uguali Vuoto Vuoto = True
uguali _ Vuoto = False
uguali Vuoto _ = False
uguali (Nodo v sx dx) (Nodo x sx1 dx1) = v==x && uguali sx sx1 && uguali dx dx1
