-- Programación Funcional - Recuperatorio Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
f1 :: Num a => a -> b -> ((b,a) -> c) -> ((b,c) -> d) -> d

-------------- Ejercicio 2 -----------------

sumatoria :: Int -> Int
sumatoria 0 = 0                   -- (S1)
sumatoria n = n + sumatoria (n-1) -- (S2)

sumaDoble :: Int -> Int
sumaDoble 0 = 0                       -- (D1)
sumaDoble n = n + n + sumaDoble (n-1) -- (D2)

-- Probar por inducción la siguiente propiedad:
-- P(n): sumaDoble n == 2 * sumatoria n

-------------- Ejercicio 3 -----------------

-- Definir recursivamente una función "consecutivosEnOrden" que dada una lista de enteros
-- devuelve la cantidad de elementos consecutivos ordenados en orden estrictamente creciente.
-- Ej: consecutivosEnOrden [3,2,2,5,6,1,4] == 3 (los pares crecientes son (2,5), (5,6) y (1,4))

-------------- Ejercicio 4 -----------------

sumar2 :: [Int] -> [Int]
sumar2 (x:xs) = (2+x) : sumar2 xs

pares :: [Int]
pares = 0 : sumar2 pares

-- dar los primeros 9 pasos de reducción de la siguiente expresión con orden normal.
-- pares

-------------- Ejercicio 5 -----------------

-- verificar la siguiente igualdad: (\f -> (*2) . f) (*2) == (*4)
