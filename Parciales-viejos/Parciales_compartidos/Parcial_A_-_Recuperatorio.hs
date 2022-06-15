-- Programación Funcional - Recuperatorio Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
f1 :: Num c => a -> b -> ((a,b) -> c) -> ((a,c) -> d) -> d
f1 x y f g = g(x,(f (x,y))+1)

-------------- Ejercicio 2 -----------------

factorial :: Int -> Int
factorial 0 = 1                   -- (F1)
factorial n = n * factorial (n-1) -- (F2)

dobleFactorial :: Int -> Int
dobleFactorial 0 = 1                            -- (D1)
dobleFactorial n = n * n * dobleFactorial (n-1) -- (D2)

-- Probar por inducción la siguiente propiedad:
-- P(n): dobleFactorial n == (factorial n) ^ 2

-------------- Ejercicio 3 -----------------

-- Definir recursivamente una función "sumaAlternada" que dada una lista de enteros
-- devuelve la suma alternada de sus elemento.
-- Ej: sumaAlternada [3,2,5,1,4] == 3 - 2 + 5 - 1 + 4

-------------- Ejercicio 4 -----------------

tomarN :: [a] -> Int -> [a]
tomarN []     _ = []
tomarN (x:_)      1 = [x]
tomarN (x:xs) n = x : tomarN xs (n-1)

generar :: Int -> [Int]
generar x = x : generar x

-- reducir la siguiente expresión con orden normal.
-- tomarN (generar 1) 3

-------------- Ejercicio 5 -----------------

-- verificar la siguiente igualdad: (\f -> f . (+1)) (+1) == (+2)