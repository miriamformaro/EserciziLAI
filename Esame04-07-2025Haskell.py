-- Definire in Haskell una funzione che riceve una lista di liste di numeri XSS e restituisce una lista YS che contiene per ogni lista XS che appare in XSS l'elemento maggiore YS. se XSS è vuota si dovrá restituire una lista vuota.
-- convertiLista:: [[Int]] -> [Int]
-- Esempio-- convertilista [[1,2,3],[4,5]] = [3,5]
convertiLista1 :: [[Int]] -> [Int]
convertiLista1 [[]] = []
convertiLista1 xs = [maximum x | x <- xs]

--esercizio simile
--Scrivi una funzione che prende in input una lista di liste di interi e restituisce una lista contenente la somma degli elementi di ciascuna sottolista.
sommaSub :: [[Int]] -> [Int]
sommaSub [[]] = []
sommaSub xs = [sum x | x<- xs]
