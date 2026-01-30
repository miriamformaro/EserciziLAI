cricca :: [Node] -> Graph -> Bool
cricca n g = all verifica n
    where
        verifica :: Node -> Bool
        verifica v = case Map.lookup v g of
            Nothing -> False
            Just vs ->
                let nodi = filter (/=v) n
                in all (\v -> v `elem` vs) nodi

isIndipendent :: [Node] -> Graph -> Bool
isIndipendent n g = all verifica n
    where 
        verifica :: Node -> Bool
        verifica v = case Map.lookup v g of
            Nothing -> False
            Just vs ->
                let nodi = filter (/=v) n
                in all (\v -> v `notElem` vs) nodi

esisteNodo :: Node -> Graph -> Bool
esisteNodo v g = case Map.lookup v g of
                    Nothing -> False
                    Just x -> True

quantiVicini :: Node -> Graph -> Int
quantiVicini v g = case Map.lookup v g of
                    Nothing -> 0
                    Just vs -> length vs

hasEdge :: Node -> Node -> Graph -> Bool
hasEdge s e g = case Map.lookup s g of
                    Nothing -> False
                    Just vs -> e `elem` vs

haCappio :: Node -> Graph -> Bool
haCappio n g = case Map.lookup n g of
                    Nothing -> False
                    Just vs -> n `elem` vs

amiciVeri :: Node -> Node -> Graph -> Bool
amiciVeri a b g =
    let 
        ab =case Map.lookup a g of
                    Nothing -> False
                    Just vs -> b `elem` vs
        ba = case Map.lookup b g of
                    Nothing -> False
                    Just vs -> a `elem` vs
    in
        ab && ba

tuttiPuntanoA :: Node -> [Node] -> Graph -> Bool
tuttiPuntanoA v n g = all verifica n
    where
        verifica :: Node -> Bool
        verifica x = case Map.lookup x g of
                        Nothing -> False
                        Just vs -> v `elem` vs

nodiConKVicini :: Int -> [Node] -> Graph -> [Node]
nodiConKVicini k n g = filter verifica n
    where
        verifica :: Node -> Bool
        verifica x = case Map.lookup x g of
                        Nothing -> False
                        Just vs -> length vs == k

viciniInComune :: Node -> Node -> Graph -> [Node]
viciniInComune a b g = 
    case Map.lookup a g of
        Nothing -> []
        Just va -> 
            case Map.lookup b g of
                Nothing -> []
                Just vb -> [x | x<-va, x `elem` vb]

tuttiIVicini :: Node -> Node -> Graph -> [Node]
tuttiIVicini a b g =
    let
        va = case Map.lookup a g of
                Nothing -> []
                Just vs -> vs
        vb = case Map.lookup b g of
                Nothing -> []
                Just vs -> vs
    in
        va ++ vb

haAmicoIsolato :: Node -> Graph -> Bool
haAmicoIsolato v g = case Map.lookup v g of
                        Nothing -> False
                        Just vs -> any verifica vs
                                where
                                    verifica :: Node -> Bool
                                    verifica x = case Map.lookup x g of
                                                    Nothing -> False
                                                    Just vs -> null vs

haAmicoVip :: Int -> Node -> Graph -> Bool
haAmicoVip k v g = case Map.lookup v g of
                        Nothing -> False
                        Just vs -> any verifica vs
                            where 
                                verifica :: Node -> Bool
                                verifica x = case Map.lookup x g of
                                        Nothing -> False
                                        Just vs -> length vs > k
nonVicino :: Node -> Graph -> Bool
nonVicino v g = case Map.lookup v g of
                    Nothing -> False
                    Just vs -> any verifica vs
                        where
                            verifica :: Node -> Bool
                            verifica x = case Map.lookup x g of
                                Nothing -> False
                                Just xs -> v `notElem` xs

-- cammino da nodo s a nodo e
connessi :: Node -> Node -> Graph -> Bool
connessi s e g = cerca s [] 
    where
        cerca :: Node -> [Node] -> Bool
        cerca u visitati
            | u == e = True
            | u `elem` visitati = False
            | otherwise = case Map.lookup u g of
                            Nothing -> False
                            Just vs -> any (\x -> cerca x (u:visitati)) vs

ampiezzaSociale :: Node -> Graph -> Int
ampiezzaSociale v g = case Map.lookup v g of
                        Nothing -> 0
                        Just vs -> if null vs then 0 else maximum vs - minimum vs


listaArchi :: Graph -> [(Node, Node)]
listaArchi g = [(u,v) | (u,vs) <- Map.toList g, v <- vs]

-- percorso tra i nodi
isPath :: [Node] -> Graph -> Bool
-- Caso Base 1: Lista vuota è un percorso valido (o False, a seconda della specifica, ma solitamente True)
isPath [] _ = True
-- Caso Base 2: Un solo nodo è sempre un percorso valido (non deve andare da nessuna parte)
isPath [_] _ = True
-- Caso Ricorsivo: Abbiamo almeno due nodi (x1 e x2)
isPath (x1:x2:xs) g = 
    case Map.lookup x1 g of
        Nothing -> False  -- Se il nodo x1 non esiste nel grafo, percorso impossibile
        Just vicini -> 
            if x2 `elem` vicini 
            then isPath (x2:xs) g  -- x1 è collegato a x2? Bene, controlliamo il resto (da x2 in poi)
            else False
