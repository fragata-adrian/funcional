---------------------------
-- Operaciones basicas
---------------------------

-- Obtener la cabeza de la lista
cabeza :: [a] -> a
cabeza [] = error "lista vacia"
cabeza (x:_) = x

-- Obtener la cola de la lista
cola :: [a] -> [a]
cola [] = []
cola (_:xs) = xs

-- Ejercitacion
inverso :: [a] -> [a]
inverso [] = []
inverso (x:xs) = reverse xs ++ [x]

-- Largo de una lista (length)
-- length :: [a] -> Int
-- length [] = 0 --(P1)
-- length (x:xs) = 1 + length xs --(P2)

-- Concatenar listas 
-- (++) :: [a] -> [a] -> [a]
-- [] ++ ys = ys (C1)
-- (x:xs) ++ ys = x: (xs ++ ys) (C2)

-- Probar por inducción estructural la siguiente propiedad:
-- length (xs ++ ys) == length xs + length ys.
{-
    P(xs): para toda lista ys, length (xs ++ ys) == length xs + length ys

    CB) P([]): para toda lista ys, length ([] ++ ys) == length [] + length ys
        1) length ([] ++ ys) == (C1) length ys
        2) length [] + length ys == (P1) 0 + length ys == length ys 
    
    PI) P(xs) => P(x:xs)
    
        (HI) Supongo que vale P(xs): para toda lista ys, length (xs ++ ys) == length xs + length ys
        Quiero probar que vale P(x:xs):  para toda lista ys, length ((x:xs) ++ ys) == length (x:xs) + length ys

        1) length ((x:xs) ++ ys) == (C2) lenght (x: (xs ++ ys)) == (P2) 1 + length (xs ++ ys) ==
            == (HI) 1 + length xs + length ys 
        
        2) length (x:xs) + length ys == (P2) 1 + length xs + length ys

        3) Por 1) y 2) vale la igualdad

        
-}


-- 1) Decir cuáles de las siguientes expresiones son válidas y dar un tipo válido para ellas.

-- [] :: [a] 

-- [3, 1.0, 2] :: Fractional a => [a]

-- [2 :: Int, 1.0 , 2] No es valida

-- [True, [False]] No es valida

-- 2) Implementar recursivamente las siguientes funciones.

sumaLista :: [Int] -> Int
sumaLista [] = 0 --(S1)
sumaLista (x:xs) = x + sumaLista xs --(S2)

{-
    Demostracion por induccion estructural: 
    P(xs): sumaLista (xs) == "la suma de todos los elementos de la lista xs"
    
    CB) P([]): sumaLista ([]) == "la suma de todos los elementos de la lista []"
        1) sumaLista ([]) == (S1) 0
        2) "la suma de todos los elementos de la lista []" == 0, ya que la suma de una lista sin elementos es 0
        3) Por 1) y 2) vale la igualdad.

    PI) Supongo que vale P(xs): sumaLista xs == "la suma de todos los elementos de la lista xs" (HI)
        Quiero probar P(x:xs): sumaLista (x:xs) == "la suma de todos los elementos de la lista (x:xs)"

        sumaLista (x:xs) == (S2) x + sumaLista xs
        == (HI) x + "la suma de todos los elementos de la lista xs"
-}

prodLista :: [Int] -> Int
prodLista [] = 1
prodLista (x:xs) = x * prodLista xs

todosPares :: [Int] -> Bool
todosPares [] = True
todosPares (x:xs) = esPar x && todosPares xs
    where   esPar 0 = True
            esPar 1 = False
            esPar n = esPar (n-2)


todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:xs) = todosIguales xs && x == head xs 

pertenece :: Eq a => a -> [a] -> Bool 
pertenece b [] = False
pertenece b (x:xs) = pertenece b xs || b == x


