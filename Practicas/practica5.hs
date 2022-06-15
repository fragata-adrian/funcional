-- 1) Dar expresiones lambda para las siguientes funciones.

siguiente x = x+1

suma :: Int -> Int -> Int
suma = \n -> (\x -> x + n)   

snd' :: (a, b) -> b
snd' = \(x,y) -> y

head' :: [a] -> a 
head' = \(x:xs) -> x

twice = \f -> (\x -> f (f x))

twice' = \f -> (\x -> f (f (f (f x))))

-- 2) Dar el tipo de las siguientes funciones.

apply :: (a -> b) -> a -> b
apply f = g
    where g x = f x

-- 1) El tipo de x esta siendo evaluado en f y a su vez x es evaluada en g => el tipo del argumento de g == el tipo del argumento de f
-- 2) f x :: b
-- 3) f x es el resultado g x
-- 4) Por 2) y 3) g x :: b

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

{-
    flip :: (a -> b -> c) -> (a -> b -> c)

    1) f y x :: c => g x y :: c
    2) x :: b
    3) y :: a
    4) x es argumento de g => b == d 
    5) y es argumento de g => a == e
-}


appDup ((a, a) -> b) -> (a -> b)
appDup f = g
where g x = f ( x , x )

{-
    appDup ((a, a) -> b) -> (c -> d)

    1) f (x , x) :: b => g x :: b
    2) x es argumento de g 
    3) x es argumento de la tupla de f
    4) x :: a
    5) Por 2) 3) y 4) a == c
-}




suma :: Int -> (Int -> Int)
suma = \n -> (\x -> x + n)   

