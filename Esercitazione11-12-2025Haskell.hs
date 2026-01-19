-- Definire in Haskell una funzione che riceve una lista di coppie di numeri interi e restituisce una lista di liste in cui ogni lista corripsondente ad una coppia (x,k) contiene la sequenza [x, 2*x, ..., k*x]
-- convertiLista:: [(Int,Int)] -> [[Int]] 
-- Esempio
-- convertilista [(1,3), (2,2)] = [[1,2,3],[2,4]]
convL :: [(Int,Int)] -> [[Int]]
convL xs = [ [x*i | i<-[1..k]] | (x,k)<-xs]

-- generare tutti i numeri compresi tra il primo e il secondo elemento della coppia.
-- esplodiIntervalli [(1, 4), (10, 12), (5, 5)]
esplodiIntervalli :: [(Int,Int)] -> [[Int]]
esplodiIntervalli xs = [ [i | i<-[x..k]] | (x,k)<-xs]

-- calcoliamo le potenze. La coppia è (base, esponente). Devi generare la lista [base^1, base^2, ..., base^esponente].
-- listaPotenze [(2, 4), (3, 2)]
listaPotenze :: [(Int,Int)] -> [[Int]]
listaPotenze xs = [ [x^i | i<-[1..k]] | (x,k)<-xs]

-- La coppia è (Carattere, Numero). Devi ripetere quel carattere Numero volte. Ricorda che il risultato sarà una lista di stringhe ([String]), che è tecnicamente una lista di liste di caratteri ([[Char]]).
-- creaEco [('a', 3), ('z', 1), ('!', 4)]
creaEco :: [(Char,Int)] -> [String]
creaEco xs = [ [x | i<-[0..n]] | (x,n)<-xs]
