-- Definire una funzione removeElementsByValues che prende in input due liste di interi: values e filters e  restituisce una nuova lista contenente solo gli elementi di values che non appaiono nella lista filters  nell'ordine in cui appaiono nella lista values. 
-- removeElementsByValues :: [Int] -> [Int] -> [Int]
-- Esempio:
-- removeElementsByIndices [1,4,2,1] [2,1] restituisce [4]
removeIndices :: [Int] -> [Int] -> [Int]
removeIndices xs ys = [x | x<-xs, x `notElem` ys]
