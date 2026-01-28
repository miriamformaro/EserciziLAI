-- Definire in Haskell una funzione che riceve una lista di liste di numeri XSS e restituisce una lista YS che contiene per ogni lista XS che appare in XSS l'elemento maggiore YS. se XSS è vuota si dovrá restituire una lista vuota.
-- convertiLista:: Int -> [[Num]] -> [Num]
-- Esempio
-- convertilista [[1,2,3],[4,5]] = [3,5]
convertiL :: [[Int]] -> [Int]
convertiL xs = [maximum x | x<-xs, not (null x)]

-- Definire una funzione haskell che ricevuta in input una lista di interi restituisce una lista di liste contenente tutte le permutazioni della lista in input
-- permutazioni:: [Int] ->[[Int]]
-- permutazioni [1,2,3] = [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
permutazioni :: [Int] -> [[Int]]
permutazioni [] = [[]]
permutazioni xs = [x : ys| x<-xs, ys <- permutazioni (rimuoviUno x xs)]

rimuoviUno :: Int -> [Int] -> [Int]
rimuoviUno y (x:xs)
    | x == y = xs
    |otherwise = x : rimuoviUno y xs

-- Descrivere il meccanismo di valutazione delle espressioni adottato da Haskell
-- Il meccanismo di valutazione delle espressioni utilizzato da Haskell viene chiamato lazy evaluation. 
-- Lazy in inglese vuol dire pigro e haskell così si comporta nei confronti del codice, cioè esegue le parti di codice solo quando è 
-- strettamente necessario per continuare il calcolo, quindi non esgue tutte le espressioni nel momento in cui le incontra. Il meccanismo di
-- divide in due parti: outemost che indica il fatto che le espressioni, definite redex, vengono eseguite a partire da quella più esterna, 
-- e sharing of arguments, cioò per evitare di ricalcolare più volte gli stessi argomenti, haskell crea dei puntatori, dopo aver eseguito il 
-- primo calcolo di questi argomenti, a delle locazioni di memoria. Questo meccanismo è efficiente, in quanto i calcoli vengono svolti solo 
-- nel momento in cui sono necessari, permette di lavorare con liste infinite e di separare la gestione dei dati dalla logica di controllo.
