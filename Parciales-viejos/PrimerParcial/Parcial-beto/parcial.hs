-- Programación Funcional - Recuperatorio Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-- ¡¡¡IMPORTANTE!!!  Entregar 3 ejercicios de la parte A y 1 ejercicio de la parte B.


----------------------------------------
-------------- Parte A -----------------
----------------------------------------

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
--f :: (Eq a, Ord b) => a -> a -> b -> b -> Bool -> a

--Solucion
f x y z u v | x == y || z > u || v = x
            | otherwise            = y

-------------- Ejercicio 2 -----------------


{-
todosTrue :: [Bool] -> Bool
todosTrue []     = True              (T1)
todosTrue (x:xs) = x && todosTrue xs (T2)

(++) :: [a] -> [a] -> [a]
(++) []     ys = ys         (C1)
(++) (x:xs) ys = x:xs ++ ys (C2)

(&&) :: Bool -> Bool -> Bool
(&&) False _   = False (A1)
(&&) True  x   = x     (A2)

Probar por inducción la siguiente propiedad:
Para toda lista xs :: [Bool] y toda lista ys :: [Bool], vale que 
todosTrue (xs ++ ys) == todosTrue xs && todosTrue ys
-}

{-
Solucion
P(xs): para toda lista ys :: [Bool], todosTrue (xs ++ ys) == todosTrue xs && todosTrue ys

CB) dada ys :: [Bool], 
todosTrue ([] ++ ys) ==(C1) todosTrue ys
todosTrue [] && todosTrue ys ==(T1) True && todosTrue ys ==(A2) todosTrue ys

HI) P(xs): todosTrue (xs ++ ys) == todosTrue xs && todosTrue ys
T) P(x:xs): todosTrue ((x:xs) ++ ys) == todosTrue (x:xs) && todosTrue ys
PI) P(xs) => P(x:xs)

PI) todosTrue ((x:xs) ++ ys) ==(C2) todosTrue (x: (xs ++ ys)) ==(T2) x && todosTrue (xs ++ ys)
==(HI) x && (todosTrue xs && todosTrue ys) == (x && todosTrue xs) && todosTrue ys
==(T2) todosTrue (x:xs) && todosTrue ys

-}

-------------- Ejercicio 3 -----------------

-- Definir recursivamente una función "estaOrdenada" que dada una lista de enteros,
-- devuelve True si la lista rotada está ordenada en orden creciente. y False en caso contrario.
-- Ej: estaOrdenada [-1,2,2,3] == True
--     estaOrdenada [3,2,1,0] == False

--Solucion
estaOrdenada :: [Int] -> Bool
estaOrdenada [] = True
estaOrdenada [_] = True
estaOrdenada (x:y:xs) = x<=y && estaOrdenada (y:xs)

-------------- Ejercicio 4 -----------------

g1 :: (Int,Int,Int)  -> Int
g1 (x,_,z) = x * (z+2)

g2 :: Int -> (Int, Int, Int)
g2 x = (x,3*x,2)

-- reducir con orden normal la siguiente expresión:
(g1 . g2) 4

(.) :: (b -> c) -> (a -> b) -> (a -> c)
(.) f g x = f (g x)

(.g) f == f.g

(+2) 3 == 3+2

-- Solucion
(g1 . g2) 4
~> g1 (g2 4)
~> g1 (4,3*4,2)
                ~> g1 (4,12,2) -- MAL, porque la reduccion es normal
~> 4 * (2+2)
~> 4 * 4
~> 16

----------------------------------------
-------------- Parte B -----------------
----------------------------------------

-------------- Ejercicio 5 -----------------

-- Reescribir la función aplicarEnLista como composición de funciones más simples y con estilo point free.
-- Usar aplicación parcial y/o expresiones lambda.

aplicarEnLista :: Int -> ([Int] -> a) -> a
aplicarEnLista g x = g ([x+5,0,0])
aplicarEnLista g x = (g . (\t -> [t+5,0,0])) x
--aplicarEnLista g = g . (\x -> [x+5,0,0])


aplicarEnLista :: Int -> ([Int] -> a) -> a
aplicarEnLista g x = g ([x+5,0,0])
aplicarEnLista g x = g (x+5:[0,0])
aplicarEnLista g x = g ((:[0,0]) (x+5))
aplicarEnLista g x = (g . (:[0,0])) ((+5) x)
aplicarEnLista g = g . (:[0,0]) . (+5)

--Solucion1
--aplicarEnLista g = g . (\y -> [y,0,0]) . (+5)

--Solucion2
--aplicarEnLista = (. ((\y -> [y,0,0]) . (+5)))

aplicarEnLista g x ~> (. ((\y -> [y,0,0]) . (+5))) g x
~> (g . ((\y -> [y,0,0]) . (+5))) x ~> g (((\y -> [y,0,0]) . (+5)) x)
~> g ((\y -> [y,0,0]) ((+5) x)) ~> g ((\y -> [y,0,0]) (x+5))
~> g [x+5,0,0]

-------------- Ejercicio 6 -----------------
--Probar que uncurry . const == (. snd)

uncurry h (x,y) == h x y (1)
curry h x y == h (x,y) (2)

const x y = x

--Solucion
--(uncurry . const) f (x,y) == uncurry (const f) (x,y) == const f x y == f y
--(. snd) f (x,y) == (f . snd) (x,y) == f (snd (x,y)) == f y