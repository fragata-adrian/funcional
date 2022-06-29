-- Programación Funcional - Segundo Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- Definir sin usar recursión la función
-- maximosPositivos :: [(Int,Int)] -> [Int] que, dada una lista de pares
-- devuelve el máximo de los pares con ambos números positivos.
-- Ej: maximosPositivos [(1,2), (0,3), (4,1), (-1, 7)] ~> [2, 4].

maximosPositivos :: [(Int, Int)] -> [Int]
maximosPositivos = map (\(x,y) -> max x y) . filter (\(x,y) -> x > 0 && y > 0)

-------------- Ejercicio 2 -----------------

-- Definir, usando el esquema de fold adecuado, la función
-- primerAparicion :: Char -> String -> Int que, dada un caracter c y
-- un string s, devuelve el índice de la primer aparición de c en s,
-- o, en caso que c no está en s, la longitud de s.
-- Ej: primerAparicion 'a' "casa" ~> 1
--     primerAparicion 'e' "casa" ~> 4

primerAparicion :: Char -> String -> Int
primerAparicion c = foldr (\x rc -> if x == c then 0 else rc + 1) 0

-------------- Ejercicio 3 -----------------

data Nat = Zero | Succ Nat

-- Definir la función mayor :: Nat -> Nat -> Bool
-- que dados dos naturales devuelve true si el primero es mayor que el segundo.

mayor Zero _ = False
mayor _ Zero = True
mayor (Succ n) (Succ m) = mayor n m

-------------- Ejercicio 4 -----------------

data Polinomio = Monomio Int Int | Suma Polinomio Polinomio

-- donde (Monomio a n) representa el monomio "a*X^n"
-- Ej: p = Suma (Monomio 1 2) (Monomio 2 0) representa el polinomio "X^2 + 2"

-- i) Definir el esquema de fold para Polinomio

foldP :: (Int -> Int -> a) -> (a -> a -> a) -> Polinomio -> a
foldP f _ (Monomio a n) = f a n
foldP f g (Suma p q) = g (foldP f g p) (foldP f g q)

-- ii) Definir la función evaluar :: Int -> Polinomio -> Int
-- que toma un entero x y un polinomio p y devuelve el resultado de p(x).

evaluar :: Int -> Polinomio -> Int
evaluar x = foldP (\a n -> a * (x^n)) (+)