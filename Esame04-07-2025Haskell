-- Definire in Haskell una funzione che riceve una lista di liste di numeri XSS e restituisce una lista YS che contiene per ogni lista XS che appare in XSS l'elemento maggiore YS. se XSS è vuota si dovrá restituire una lista vuota.
-- convertiLista:: [[Int]] -> [Int]
-- Esempio-- convertilista [[1,2,3],[4,5]] = [3,5]
convertiLista1 :: [[Int]] -> [Int]
convertiLista1 [[]] = []
convertiLista1 xs = [maximum x | x <- xs]
