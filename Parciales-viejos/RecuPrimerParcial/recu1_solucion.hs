-- Programación Funcional - Recuperatorio Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
f1 :: Num c => a -> b -> ((a,b) -> c) -> ((a,c) -> d) -> d
f1 x y f g = g (x, f (x,y) + 1)

-------------- Ejercicio 2 -----------------

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

dobleFactorial :: Int -> Int
dobleFactorial 0 = 1
dobleFactorial n = n * n * dobleFactorial (n-1)

-- Probar por inducción la siguiente propiedad:
-- P(n): dobleFactorial n == (factorial n) ^ 2

-- CB) dobleFactorial 0 == 1 == 1 ^ 2 == (factorial 0) ^ 2
-- PI) dobleFactorial (n+1) == (n+1) * (n+1) * dobleFactorial n ==(HI) (n+1)^2 * (factorial n)^2
-- == ((n+1) * factorial n) ^ 2 == (factorial (n+1))^2


-------------- Ejercicio 3 -----------------

-- Definir recursivamente una función "sumaAlternada" que dada una lista de enteros
-- devuelve la suma alternada de sus elemento.
-- Ej: sumaAlternada [3,2,5,1,4] == 3 - 2 + 5 - 1 + 4

sumaAlternada :: [Int] -> Int
sumaAlternada [] = 0
sumaAlternada [x] = x 
sumaAlternada (x:y:xs) = x - y + sumaAlternada xs

-- Solucion 2

sumaAlternada :: [Int] -> Int
sumaAlternada [] = 0
sumaAlternada (x:xs) = x - sumaAlternada xs

-------------- Ejercicio 4 -----------------

tomarN :: [a] -> Int -> [a]
tomarN []     _ = []
tomarN (x:_)      1 = [x]
tomarN (x:xs) n = x : tomarN xs (n-1)

generar :: Int -> [Int]
generar x = x : generar x

-- reducir la siguiente expresión con orden normal.
-- tomarN (generar 1) 3

{-
tomarN (generar 1) 3 ~> tomarN (1 : generar 1) 3
~> 1 : tomarN (generar 1) 2 ~> 1 : tomarN (1 : generar 1) 2
~> 1 : 1 : tomarN (generar 1) 1 ~> 1 : 1 : tomarN (1 : generar 1) 1
~> 1 : 1 : [1] == [1,1,1]
-}

-------------- Ejercicio 5 -----------------

-- verificar la siguiente igualdad: (\f -> f . (+1)) (+1) == (+2)

((\f -> f . (+1)) (+1)) x == ((+1) . (+1)) x
== (+1) ((+1) x) == (+1) (x+1) == (x+1) + 1 == x + 2 == (+2) x