-- Programación Funcional 2C 2021 - Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-- ¡¡¡IMPORTANTE!!!  Entregar 3 ejercicios de la parte A y 1 ejercicio de la parte B.

----------------------------------------
-------------- Parte A -----------------
----------------------------------------

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
f :: (Eq a, Ord b) => a -> a -> b -> b -> Bool -> a
--RESPUESTA
f z x c v bool
  | z == x && c == v && bool = z
  | otherwise = x

-------------- Ejercicio 2 -----------------

{-
todosTrue :: [Bool] -> Bool
todosTrue []     = True              (T1)
todosTrue (x:xs) = x && todosTrue xs (T2)

(++) :: [a] -> [a] -> [a]
(++) []     ys = ys         (C1)
(++) (x:xs) ys = x:(xs ++ ys) (C2)

(&&) :: Bool -> Bool -> Bool
(&&) False _   = False (A1)
(&&) True  x   = x     (A2)

Probar por inducción la siguiente propiedad:
Para toda lista xs :: [Bool] y toda lista ys :: [Bool], vale que
todosTrue (xs ++ ys) == todosTrue xs && todosTrue ys
-}
{-
RESPUESTA:
    P(xs): todosTrue (xs ++ ys) == todosTrue xs && todosTrue ys

    Caso Base:
    P([])
            todosTrue ( [] ++ ys)       ==      todosTrue [] && todosTrue ys
            todosTrue ((C1) ys)         ==      (T1) True && todosTrue ys
            todosTrue ys                ==      (A2) todosTrue ys

    P(x:xs):
            todosTrue (x:xs ++ ys)              ==      todosTrue x:xs && todosTrue ys
        (C2)todosTrue x:(xs ++ ys)              ==  (C2)x && todosTrue xs && todosTrue ys
        (T2)x && todosTrue (xs ++ ys)           ==      x && todosTrue xs && todosTrue ys
        (HI) x && todosTrue xs && todosTrue ys  ==      x && todosTrue xs && todosTrue ys

-}

-------------- Ejercicio 3 -----------------

-- Definir recursivamente una función "estaOrdenada" que dada una lista de enteros,
-- devuelve True si la lista está ordenada en orden creciente, y False en caso contrario.
-- Ej: estaOrdenada [-1,2,2,3] == True
--     estaOrdenada [3,2,1,0] == False

estaOrdenada :: [Int] -> Bool
estaOrdenada [] = True
estaOrdenada [_] = True
estaOrdenada (x : y : xs) = x <= y && estaOrdenada (y : xs)

----------------------------------------
-------------- Parte B -----------------
----------------------------------------

-------------- Ejercicio 5 -----------------

-- Reescribir la función aplicarEnLista como composición de funciones más simples y
-- con estilo point free.
-- Usar aplicación parcial y/o expresiones lambda.

aplicarEnLista :: ([Int] -> a) -> Int -> a
aplicarEnLista g x = g [x + 5, 0, 0]
aplicarEnLista g = \x -> g [x + 5, 0, 0]
aplicarEnLista = \g -> \x -> g [x + 5, 0, 0]
--hecho con lambda
aplicarEnLista = \g -> \x -> g [(x + 5), 0, 0]
