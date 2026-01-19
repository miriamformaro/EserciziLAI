-- esercitazione 11/12/2025
-- (\f x -> f (f (x*2)))
Num a => (a -> a) -> a -> a

-- esame 14/06/2024
-- filter (==1)
-- filter :: (a -> Bool) -> [a] -> [a]
-- == :: Eq a => a -> a -> Bool
-- per il numero 1 serve Num
(Num a, Eq a) => [a] -> [a]

-- esame 04/07/2025
-- twice f x = f (f x)
(a -> a) -> a -> a

-- esercizi
-- \x -> x > 10
(Num a, Ord a) => a -> Bool

-- \f -> f 5
-- f :: a -> b
Num a => (a -> b) -> b

-- map (+1)
-- map :: (a -> b) -> [a] -> [b]
Num a => [a] -> [a]

-- filter (\y -> mod y 2 == 0)
-- filter :: (a -> Bool) -> [a] -> [a]
-- mod :: Integral a => a -> a -> a
Integral a => [a] -> [a]

-- map (\x -> x>3)
-- map :: (a->b) -> [a] -> [b]
-- > :: Ord a => a -> a -> Bool
-- 3 :: Num a
(Num a, Ord a) => [a] -> [Bool]
