-- FUNZIONE SOTTOLISTE DA IMPARARE
sub :: [a] -> [[a]]
sub [] = [[]]
sub (x:xs) = sub xs ++ map (x:) (sub xs)

sumSub :: Int -> [Int] -> [[Int]]
sumSub x s = filter(\subS -> sum subS == x) (sub s)

cardinalita :: Int -> [Int] -> [[Int]]
cardinalita x s = filter(\l -> length l == x) (sub s)
