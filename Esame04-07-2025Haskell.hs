-- Definire in Haskell una funzione che riceve una lista di liste di numeri XSS e restituisce una lista YS che contiene per ogni lista XS che appare in XSS l'elemento maggiore YS. se XSS è vuota si dovrá restituire una lista vuota.
-- convertiLista:: [[Int]] -> [Int]
-- Esempio-- convertilista [[1,2,3],[4,5]] = [3,5]
convertiLista1 :: [[Int]] -> [Int]
convertiLista1 [[]] = []
convertiLista1 xs = [maximum x | x <- xs]

--esercizi simili
--Scrivi una funzione che prende in input una lista di liste di interi e restituisce una lista contenente la somma degli elementi di ciascuna sottolista.
sommaSub :: [[Int]] -> [Int]
sommaSub [[]] = []
sommaSub xs = [sum x | x<- xs]

sommaPari :: [[Int]] -> [Int]
sommaPari [[]] = []
sommaPari xs =  [length (filter even x) | x<-xs]

-- Data una lista di liste, restituisci una lista contenente la somma soltanto dei numeri maggiori di 5 per ogni sottolista.
sommaGrandi :: [[Int]] -> [Int]
sommaGrandi [[]] = []
sommaGrandi xs = [sum (filter (>5) x) | x<-xs]

-- Data una lista di liste, tieni nel risultato solo le sottoliste che hanno una lunghezza maggiore di 2. Le altre devono sparire.
soloLun :: [[Int]] -> [[Int]]
soloLun [[]] = [[]]
soloLun xs = [x | x<-xs, length x > 2]

-- Data una lista di liste, restituisci una lista di booleani. True se tutti i numeri di quella sottolista sono pari, False altrimenti.
-- sonoTuttiPari [[2, 4], [2, 3], []]
sonoTuttiPari :: [[Int]] -> [Bool]
sonoTuttiPari [[]] = []
sonoTuttiPari xs = [all even x | x<-xs]

-- Scrivi una funzione che prende una lista di parole e restituisce una stringa composta solo dalle prime lettere di ogni parola.
iniziali :: [String] -> String
iniziali [] = ""
iniziali xs = [head x | x <- xs]

-- Per ogni sottolista, calcola la differenza tra il massimo e il minimo (ovvero quanto "spazia" la lista).
-- calcolaRange [[1, 10], [5, 5, 5], [0, 20, 2]]
calcolaRange :: [[Int]] -> [Int]
calcolaRange xs = [maximum x - minimum x | x<-xs]

-- Data una lista di liste di interi, restituisci una lista di booleani. True se la sottolista contiene il numero 0, False altrimenti.
-- contieneZero [[1, 2, 3], [0, 5], [], [10, 0]]
contieneZero :: [[Int]] -> [Bool]
contieneZero xs = [0 `elem` x | x<-xs]

-- Scrivi una funzione contaMaggioriDi che prende un numero intero k e una lista di liste xss. Restituisce una lista che dice, per ogni sottolista, quanti numeri sono strettamente maggiori di k.
contaMaggioriDi :: Int -> [[Int]] -> [Int]
contaMaggioriDi k xss = [ length [x | x<-xs, x > k] | xs <- xss]

-- Scrivi una funzione tuttiPositivi che prende una lista di liste di interi. Restituisce una lista di Booleani: True se tutti i numeri in quella sottolista sono maggiori di 0, False altrimenti.
tuttiPositivi1 :: [[Int]] -> [Bool]
tuttiPositivi1 xs = [all (>0) x | x<-xs]

-- ALL SINTASSI: all pred lista
