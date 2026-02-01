-- FUNZIONE SOTTOLISTE DA IMPARARE
sub :: [a] -> [[a]]
sub [] = [[]]
sub (x:xs) = sub xs ++ map (x:) (sub xs)

sumSub :: Int -> [Int] -> [[Int]]
sumSub x s = filter(\subS -> sum subS == x) (sub s)

cardinalita :: Int -> [Int] -> [[Int]]
cardinalita x s = filter(\l -> length l == x) (sub s)

- consecutivi
consecutivi :: [Int] -> [[Int]]
consecutivi [] = [[]]
consecutivi [x] = [[x]]
consecutivi (x:y:xs) = if y == x+1 then (x : head (consecutivi (y:xs))) : tail (consecutivi (y:xs)) else [x] : consecutivi(y:xs)

estraiSott :: Int -> [Int] -> [[Int]]
estraiSott k xs = filter (\x -> length x <= k) (sub xs)
