-- Definire una funzione removeElementsByValues che prende in input due liste di interi: values e filters e  restituisce una nuova lista contenente solo gli elementi di values che non appaiono nella lista filters  nell'ordine in cui appaiono nella lista values. 
-- removeElementsByValues :: [Int] -> [Int] -> [Int]
-- Esempio:
-- removeElementsByIndices [1,4,2,1] [2,1] restituisce [4]
removeIndices :: [Int] -> [Int] -> [Int]
removeIndices xs ys = [x | x<-xs, x `notElem` ys]

-- Scrivi una funzione che prende due liste e restituisce una lista contenente gli elementi della prima che sono presenti anche nella seconda. L'ordine deve essere quello della prima lista.
-- keepCommon [1, 4, 2, 5, 1] [2, 1, 9]
keepCommon :: [Int] -> [Int] -> [Int]
keepCommon [] _ = []
keepCommon _ [] = []
keepCommon xs ys = [x | x<-xs, x `elem` ys]

-- Scrivi una funzione che prende una lista di valori e una lista di indici (interi). Devi rimuovere dalla prima lista gli elementi che si trovano alle posizioni specificate nella seconda lista. (Assumiamo indici base-0).
-- removeByIndices [10, 20, 30, 40, 50] [0, 2]
removeByIndices :: [Int] -> [Int] -> [Int]
removeByIndices [] _ = []
removeByIndices _ [] = []
removeByIndices xs ys = [x | (i,x)<-zip[0..]xs, i `notElem` ys]

-- Prendi una lista di valori e una lista di Booleani della stessa lunghezza. Tieni l'elemento solo se il booleano corrispondente è True.
-- filterByMask [1, 2, 3, 4] [True, False, False, True]
filterByMask :: [Int] -> [Bool] -> [Int]
filterByMask xs ys = [x | (i,x)<-zip[0..]xs, (j,y)<-zip[0..]ys, i==j, y==True]
