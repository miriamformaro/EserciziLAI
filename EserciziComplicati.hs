-- Definire una funzione haskell che ricevuta in input una lista di interi restituisce una lista di liste contenente tutte le permutazioni
-- della lista in input
-- permutazioni:: [Int] ->[[Int]]
-- permutazioni [1,2,3] = [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
-- Funzione Principale
permutazioni :: [Int] -> [[Int]]
permutazioni [] = [[]]  -- Caso Base: la permutazione di una lista vuota è una lista contenente la lista vuota
permutazioni xs = [x : ys | x <- xs, ys <- permutazioni (rimuoviUno x xs)]

-- Funzione Helper: Rimuove la PRIMA occorrenza di un elemento
rimuoviUno :: Int -> [Int] -> [Int]
rimuoviUno _ [] = []
rimuoviUno target (y:ys)
    | target == y = ys                   -- Ho trovato l'elemento, restituisco il resto
    | otherwise   = y : rimuoviUno target ys -- Non è questo, continuo a cercare
