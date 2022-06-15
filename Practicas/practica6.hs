-------------------------------------------------------------------
--------------------------- Esquema MAP ---------------------------
-------------------------------------------------------------------

esqMap :: ( a -> b ) -> [ a ] -> [ b ]
esqMap f = g
    where g [] = []
          g ( x : xs ) = f x : g xs


-- 1) Definir la función negarTodos :: [Bool] -> [Bool] de forma recursiva y usando esqMap.

negarTodos :: [Bool] -> [Bool]
negarTodos [] = []
negarTodos (x:xs) = not x : negarTodos xs

negarTodos' :: [Bool] -> [Bool]
negarTodos' = esqMap not

-- 2) Definir la función porTresMasUno :: [Int] -> [Int] de forma recursiva y usando esqMap.

porTresMasUno :: [Int] -> [Int]
porTresMasUno [] = []
porTresMasUno (x:xs) = x * 3 + 1 : porTresMasUno xs

porTresMasUno' :: [Int] -> [Int]
porTresMasUno' = esqMap ((+1).(*3))
porTresMasUno'' = esqMap (\x -> x * 3 + 1)

-------------------------------------------------------------------
------------------------- Esquema FILTER --------------------------
-------------------------------------------------------------------
esqFilter :: ( a -> Bool ) -> [ a ] -> [ a ]
esqFilter f = g
    where g [] = []
          g ( x : xs ) | f x = x : g xs
                       | otherwise = g xs


-- 1) Definir la función enCeroValenCero :: [Int->Int] -> [Int -> Int] de forma recursiva y usando esqFilter.

enCeroValenCero :: [Int->Int] -> [Int -> Int]
enCeroValenCero [] = []
enCeroValenCero (x:xs) | x 0 == 0 = x : enCeroValenCero xs
                       | otherwise = enCeroValenCero xs 

-------------------------------------------------------------------
---------------------- Ejercicios extra ---------------------------
-------------------------------------------------------------------

-- 1) Definir sin usar recursión la función cabezasDeNoVacias :: [[a]] -> [a] 
--    que, dada una lista de listas, devuelve las cabezas de las listas no vacías.

cabezasDeNoVacias :: [[a]] -> [a]
cabezasDeNoVacias =  map head . (filter (\x -> length x /= 0))

-- 2) Definir sin usar recursión la función paresCuadrados :: [Int] -> [Int] que, dada una lista de
--    enteros, devuelve una lista con los cuadrados de los números pares.

paresCuadrados :: [Int] -> [Int]
paresCuadrados = map (^2) . filter (\x -> x `mod` 2 == 0)