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
