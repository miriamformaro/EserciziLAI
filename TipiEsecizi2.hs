-- ESAME 14/01/2023
-- Si consideri il tipo di dati
data Expr = Val Bool | App Op Expr Expr
data Op = And | Or | Not
-- Si definisca la funzione
-- eval :: Expr → Bool
-- che restisca il valore Bool derivante dalla valutazione dell’espressione
eval :: Expr -> Bool
eval (Val b) = b
eval (App And e1 e2) = eval e1 && eval e2
eval (App Or e1 e2) = eval e1 || eval e2
eval (App Not e1 _) = not (eval e1)

-- esercizio simile
data Expr = Val Int | App Op Expr Expr
data Op = Add | Sub | Mul

eval :: Expr -> Int
eval (Val b) = b
eval (App Add e1 e2) = eval e1 + eval e2
eval (App Sub e1 e2) = eval e1 - eval e2
eval (App Mul e1 e2) eval e1 * eval e2

