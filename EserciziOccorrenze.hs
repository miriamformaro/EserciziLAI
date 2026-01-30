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

removeFirst :: Int -> [Int] -> [Int]
removeFirst _ [] = []
removeFirst y (x:xs) = if y==x then xs else x : removeFirst y xs

countY :: Int -> [Int] -> Int
countY _ [] = 0
countY y (x:xs) = if x==y then 1 + countY y xs else countY y xs

keepFirst :: Int -> [Int] -> [Int]
keepFirst _ [] = []
keepFirst y (x:xs) = if y==x then x : filter (/=y) xs else x : keepFirst y xs

compress :: [Int] -> [Int]
compress [] = []
compress [x] = [x]
compress (x:y:xs) = if x==y then compress (y:xs) else x : compress (y:xs)

onlyUnique :: [Int] -> [Int]
onlyUnique xs = [x | x<-xs, countY x xs == 1]

onlyR :: [Int] -> [Int]
onlyR xs = [x | x<-xs, countY x xs /= 1]

removeLast :: Int -> [Int] -> [Int]
removeLast _ [] = []
removeLast y (x:xs) = if x==y && y `notElem` xs then xs else x : removeLast y xs
