-- Programación Funcional - Recuperatorio Segundo Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- a) Definir, sin usar recursión, la función filter2 :: (a -> Bool) -> (a -> Bool) -> [a] -> [a],
-- que filtra los elementos de la lista que cumplen ambos predicados.
filter2 :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filter2 f g = (filter f).(filter g)

-- b) usar filter2 para definir la función filtrarEnPositivos :: (Int -> Bool) -> [Int] -> [Int]
-- que filtra los numeros positivos que cumplen el predicado.
-- Ej: filtrarEnPositivos (\x -> x*x == 4) [-2, 2] ~> [2]

filtrarEnPositivos :: (Int -> Bool) -> [Int] -> [Int]
filtrarEnPositivos f = filter2 f (>0)

-------------- Ejercicio 2 -----------------

-- Definir, sin usar recursión, una función separar :: [Int] -> ([Int], [Int])
-- que dada una lista de enteros devuelve un par de listas de enteros 
-- donde la primera lista tiene los pares y la segunda los impares.
-- Ej: separar ([1, 5, 0, -2, 3]) ~> ([0, -2], [1, 5, 3])

separar :: [Int] -> ([Int], [Int])
separar = foldr (\x (rc1,rc2) -> if mod x 2 == 0 then (x:rc1,rc2) else (rc1,x:rc2)) ([],[])
-------------- Ejercicio 3 -----------------

data Color = Rojo | Azul

data Figura = Circulo Float Color | Rectangulo Float Float Color

area :: Figura -> Float
area (Rectangulo b h _) = b * h
area (Circulo r _) = pi* r * r

-- definir una funcion esValida :: Figura -> Bool que devuelve true sii la figura es válida, sabiendo
-- que una figura sólo puede tener color rojo si es un círculo o su área es mayor a 10.
esValida :: Figura -> Bool
esValida (Rectangulo b h Rojo) = area (Rectangulo b h _) > 10
esValida _ = True 

-------------- Ejercicio 4 -----------------

data Arbol a = Hoja a | Nodo a (Arbol a) (Arbol a)

foldA :: (a -> b) -> (a -> b -> b -> b) -> Arbol a -> b
foldA f _ ( Hoja x) = f x
foldA f g ( Nodo x izq der) = g x ( foldA f g izq ) ( foldA f g der)

-- Definir, sin usar recursión explícita, una función todosMenores :: Ord a => a -> Arbol a -> Bool
-- que toma un valor x y un árbol, y devuelve True sii todos los elementos del árbol son menores a x.
-- Ej: todosMenores 6 (Nodo 1 (Nodo 2 ( Hoja 0) ( Hoja 5)) ( Hoja (-3))) ~> True
--     todosMenores 3 (Nodo 1 (Nodo 2 ( Hoja 0) ( Hoja 5)) ( Hoja (-3))) ~> False
