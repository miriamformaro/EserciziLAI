-- lascia solo la prima occorrenza
delete :: Int -> [Int] -> [Int]
delete _ [] = []
delete y (x:xs) = if y==x then x : filter (/=y) xs else x : delete y xs

-- lascia solo l'ultima occorrenza
keepL :: Int -> [Int] -> [Int]
keepL _ [] = []
keepL y (x:xs) = if x==y && y `elem` xs then keepL y xs else x : keepL y xs
