-- Programación Funcional - Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
f1 :: Num a => (a -> b, a -> c) -> a -> (c,b)
f1 (f,g) x = (g (x+1), f x)
-------------- Ejercicio 2 -----------------

-- a) Definir recursivamente una función "repetir" que dado un caracter c y un entero n
-- devuelve el string que tiene el caracter c repetido n veces.
-- Ej: repetir 'a' 3 == "aaa"

-- b) Probar por inducción la siguiente propiedad:
-- P(n): length (repetir 'a' n) == n

-- length :: [a] -> Int
-- length [] = 0                 (L1)
-- length (_:xs) = 1 + length xs (L2)

repetir :: Char -> Int -> String
repetir c 0 = ""
repetir c n = c : repetir c (n-1)
-------------- Ejercicio 3 -----------------

f :: [Int]  -> Int
f []                    = 0
f [_]                   = 0
f (_:y:xs)              = max (f xs) y

-- reducir la expresión f [f [1],3,4,2] con orden normal.

-------------- Ejercicio 4 -----------------

-- verificar la siguiente igualdad: uncurry (*) . (\x -> (2,x)) == (2*)
