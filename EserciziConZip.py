-- esame 09/02/2024
-- Definire una funzione removeElementsByIndices che prende in input una lista di
-- interi (indices) e una lista generica (list) e restituisce una nuova lista contenente
-- solo gli elementi di list che non si trovano nelle posizioni specificate dagli indici nella
-- lista indices nell’ordine in cui appaiono nella lista list.
-- removeElementsByIndices :: [Int] -> [a] -> [a]
-- Esempio:
-- removeElementsByIndices [1,4,2,1] [’a’, ’c’, ’3’, ’r’, ’3’] restituisce "ar"

remove :: [Int] -> [a] -> [a]
remove ind l = [x | (i,x)<-zip[0..] l, not (i `elem` ind)]

-- esercizi simili
-- Definisci una funzione che prende in input:
-- Una lista di interi (indici).
-- Un valore di sostituzione (valore).
-- La lista originale (lista).
-- La funzione deve restituire una nuova lista dove gli elementi che si trovano nelle posizioni specificate sono stati sostituiti dal valore fornito. Gli altri rimangono invariati.

sostituisciIndici :: Eq a => [Int] -> a -> [a] -> [a]
sostituisciIndici xs e l = [if i `elem` xs then e else x | (i,x)<-zip[0..] l]

-- Scrivi una funzione che prende in input un elemento x e una lista lista. La funzione deve restituire una lista di interi 
-- contenente tutti gli indici in cui compare x all'interno della lista.

trovaIndici :: Eq a => a -> [a] -> [Int]
trovaIndici z (x:l) = [i | (i,x) <-zip[1..] l, z==x]

-- Scrivi una funzione che prende una lista e restituisce solo gli elementi che si trovano agli indici 0, 2, 4, 6, ecc...
prendiPari :: [a] -> [a]
prendiPari xs = [x | (i,x)<-zip[0..] xs, even i]

-- Scrivi una funzione che prende in input due liste e restituisce gli indici in cui le due liste hanno lo stesso valore.
indiciCoincidenti :: Eq a => [a] -> [a] -> [Int]
indiciCoincidenti xs ys = [i | (i,x)<-zip[0..] xs, (i,y)<-zip[0..] ys, x==y]
