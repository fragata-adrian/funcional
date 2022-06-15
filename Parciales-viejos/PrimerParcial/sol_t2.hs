-- Programación Funcional - Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
--f1 :: (Eq a, Num b) => a -> (b -> a) -> (a, a)

f1 x f | x == f 1 = (x, x)

-------------- Ejercicio 2 -----------------

-- a) Definir recursivamente una función "repetir" que dado un par de enteros (n,m)
-- devuelve la lista que tiene el entero m repetido n veces.
-- Ej: repetir (3,1) == [1,1,1]

-- b) Probar por inducción la siguiente propiedad:
-- P(n): length (repetir (n,m)) == n

-- length :: [a] -> Int
-- length [] = 0                 (L1)
-- length (_:xs) = 1 + length xs (L2)

-------------- Ejercicio 3 -----------------

f :: [Int] -> Int
f []                    = 1
f [_]                   = 1
f (x:_:xs)              = div x (f xs)

-- reducir la expresión f [1,f [3],4,2] con orden normal.

-------------- Ejercicio 4 -----------------

-- verificar la siguiente igualdad: uncurry (+) . (\x -> (x,1)) == (+1)