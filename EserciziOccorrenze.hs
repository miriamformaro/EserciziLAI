-- lascia solo la prima occorrenza
delete :: Int -> [Int] -> [Int]
delete _ [] = []
delete y (x:xs) = if y==x then x : filter (/=y) xs else x : delete y xs

-- lascia solo l'ultima occorrenza
keepL :: Int -> [Int] -> [Int]
keepL _ [] = []
keepL y (x:xs) = if x==y && y `elem` xs then keepL y xs else x : keepL y xs

-- elimina tutte le occorrenze
eliminaOccorrenze :: Int -> [Int] -> [Int]
eliminaOccorrenze _ [] = []
eliminaOccorrenze y (x:xs) = if x==y then eliminaOccorrenze y xs else x : eliminaOccorrenze y xs

-- elimina solo la prima
deleteF :: Int -> [Int] -> [Int]
deleteF _ [] = []
deleteF k (x:xs) = if k == x then xs else x : deleteF k xs

-- elimina solo l'ultima
deleteL :: Int -> [Int] -> [Int]
deleteL _ [] = []
deleteL k (x:xs) = if x==k && k `notElem` xs then xs else x : deleteL k xs
