--Definir la función negarTodos :: [Bool] -> [Bool] de forma
--recursiva y usando esqMap.
--Ej: negarTodos [True,False,True] ~> [False,True,False].

negarTodos :: [Bool] -> [Bool]
negarTodos [] = []
negarTodos (x:xs) = not x : negarTodos xs


map :: (a -> b) -> [a] -> [b]
not :: Bool -> Bool

a = Bool
b = Bool

map not :: [Bool] -> [Bool]

negarTodos' = map not


--Definir la función porTresMasUno :: [Int] -> [Int] de forma
--recursiva y usando esqMap.
--Ej: porTresMasUno [1,2,3] ~> [4,7,10].

porTresMasUno :: [Int] -> [Int]
porTresMasUno [] = []
porTresMasUno (x:xs) = (x*3+1) : porTresMasUno xs

porTresMasUno' = map (\x -> (x*3+1))

-- porTresMasUno = map ((+1).(*3))

((*3).(+1)) x ~> (*3) ((+1) x) ~> (*3) (x+1) ~> (x+1) * 3

porTresMasUno'' = map f
  where f x = x*3+1

porTresMasUno''' = map porTresMasUnoAux

porTresMasUnoAux x = x*3 + 1

-- Definir la función enCeroValenCero :: [Int -> Int] -> [Int -> Int] de forma
-- recursiva y usando esqFilter.
-- Ej: enCeroValenCero [\x -> 2*x, \x -> x-2, \x -> x*x] ~> [\x -> 2*x, \x -> x*x].

enCeroValenCero :: [Int -> Int] -> [Int -> Int]
enCeroValenCero [] = []
enCeroValenCero (f:fs) | f 0 == 0  = f : enCeroValenCero fs
                       | otherwise = enCeroValenCero fs

filter :: (a -> Bool) -> [a] -> [a]

enCeroValenCero = filter (\f -> f 0 == 0)

enCeroValenCero' = filter ((==0).evaluarEn0)
  where evaluarEn0 f = f 0

evaluar f x = f x

-- ($) f x == f x
-- evaluarEn0 = ($0)

--Definir sin usar recursión la función cabezasDeNoVacias :: [[a]] -> [a] que, dada una lista de
--listas, devuelve las cabezas de las listas no vacías.
--Ej: cabezasDeNoVacias [[1,2], [], [3]] ~> [1,3].

cabezasDeNoVacias :: [[a]] -> [a]
cabezasDeNoVacias = map head . filter (\= [])

-- cabezasDeNoVacias xs = map head (filter (\= []) xs)

-- cabezasDeNoVacias = map head . filter (\xs -> length xs > 0)

-- Definir sin usar recursión la función
-- paresCuadrados :: [Int] -> [Int] que, dada una lista de
-- enteros, devuelve una lista con los cuadrados de los números pares.
-- Ej: paresCuadrados [2,3,4] ~> [4,16].

paresCuadrados :: [Int] -> [Int]
paresCuadrados = map (^2) . filter ((== 0).(`mod`2))
-- paresCuadrados = map (^2) . filter (\x -> x `mod` 2 == 0)

-- a) Definir, sin usar recursión, la función filter2 :: (a -> Bool) -> (a -> Bool) -> [a] -> [a],
-- que filtra los elementos de la lista que cumplen ambos predicados.

filter2 :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filter2 f g = filter f . filter g
-- filter2 f g = filter (x -> f x && g x)

-- b) usar filter2 para definir la función filtrarEnPositivos :: (Int -> Bool) -> [Int] -> [Int]
-- que filtra los numeros positivos que cumplen el predicado.
-- Ej: filtrarEnPositivos (\x -> x*x == 4) [-2, 2] ~> [2]

filtrarEnPositivos :: (Int -> Bool) -> [Int] -> [Int]
filtrarEnPositivos f = filter2 f (>0)