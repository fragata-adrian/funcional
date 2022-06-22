esqFoldr :: (a -> b -> b) -> b -> [a] -> b
esqFoldr r z = g    -- r = funcion | z = retorno del caso base
    where g [] = z
          g (x:xs) = r x (g xs)
{-
    esqFoldr: aplica la funcion "r" sobre "x" y luego hace la recurcion 
    para la cola de la lista hasta llegar al caso base "[]" y 
    retorna lo que asignamos en "z"
                      (x)                 (g xs)                                   (z)          (x:xs)             (rc)
    esqFoldr :: (elementoActual -> llamadaRecursiva -> ResultadoDeLaFuncion) -> casoBase -> listaAIterar -> resultadoRecursivo
-}

----------------------------------------
------------ esquema foldl
----------------------------------------


esqFoldl :: (b -> a -> b) -> b -> [a] -> b
esqFoldl f = g -- f = funcion
    where g acc [] = acc -- acc = acumulado de la interacion anterior
          g acc (x:xs) = g ( f acc x ) xs
{-
    esqFoldl: llama recursivamente a "g" pasandole:
        acumulado "acc" el resultado de aplicar la funcion "f" sobre el acumulado "acc" y el elemento actual "x"
        y la cola "xs" hasta llegar al caso base y retornar el "acc"

    esqFoldl :: (acumulado -> elementoActual -> nuevoAcumulado) -> acumulado -> listaAIterar
    
-}

esqMap :: (a -> b) -> [a] -> [b]
esqMap f = g
    where g [] = []
          g ( x : xs ) = f x : g xs


esqFilter :: (a -> Bool) -> [a] -> [a]
esqFilter f = g
    where g [] = []
          g ( x : xs ) | f x = x : g xs
                       | otherwise = g xs

----------------------------------------
-------- esqMap con foldr
----------------------------------------
esqMap' f = esqFoldr (\x rc -> f x : rc) []

-- Usando composicion:
esqMap'' f = esqFoldr ((:).f) []

----------------------------------------
-------- esqFilter con foldr
----------------------------------------

-- Defino la funcion agregarSi para suprimir las guardas ya que no tengo
-- forma de utilizar guardas en foldr
agregarSi :: (a -> Bool) -> a -> [a] -> [a]
agregarSi f x xs | f x = x : xs
                 | otherwise = xs

esqFilter' f = esqFoldr (\x rc -> agregarSi f x rc ) []


----------------------------------------
------- Ejercicios extra ---------------
----------------------------------------

-- 1) Definir a partir de los esquemas de foldr y foldl la función
--  pertenece :: Eq a => a -> [a] -> Bool que, dado un elemento
--  x y una lista xs, devuelve True sii x pertenece a xs.

pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False
pertenece e (x:xs) | e == x = True
                   | otherwise = pertenece e xs

pertenece' e = foldr (\x rc -> if e == x then True else rc) False

pertenece'' e = foldl (\acc x -> if e == x then True else acc) False 


-- 2) Definir a partir de los esquemas de foldr y foldl la función
--  cantidad :: [[a]] -> Int que, dada una lista de listas de
--  elementos de tipo a, devuelve la cantidad de elementos de tipo
--  a entre todas las listas.
--  Ej: cantidad [[2,3],[1,2,6],[],[3]] 6.

cantidad :: [[a]] -> Int
cantidad [] = 0
cantidad (xs:xss) = length xs + cantidad xss

cantidad' (xs:xss) = foldr (\xs rc -> length xs + rc) 0 (xs:xss)

cantidad'' (xs:xss) = foldl (\acc xs -> length xs + acc) 0 (xs:xss)


-- 3) Definir, usando el esquema de fold adecuado, la función
--  potenciaEnOrden :: [Integer] -> Integer que, dada una lista
--  de enteros xs, devuelve el resultado de ir aplicando las
--  potencias en ese orden.
--  Ej: potenciaEnOrden [2,3,4] (2^3)^4.

potenciaEnOrden :: [Integer] -> Integer
--potenciaEnOrden [] = 1
--potenciaEnOrden (x:xs) = x ^ potenciaEnOrden xs

potenciaEnOrden = foldr (\x rc -> x ^ rc) 1