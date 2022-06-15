-- 1) Implementar recursivamente las siguientes funciones.

-- f(n) = 2n
doble :: Int -> Int
doble 0 = 0 --(P1)
doble n = 2 + doble (n-1) --(P2)
{-
    Probar correctitud: (doble n == 2*n)

    P(n): doble n == 2*n
    CB) P(0): doble 0 == 2*0
        doble 0 == (P1) 0 == 2*0

    PI) supongo que vale P(n): doble n == 2*n (HI)
        Quiero ver que vale P(n+1): doble (n+1) == 2*(n+1)

        doble (n+1) == (P2) 2 + doble (n+1 - 1) == 2 + doble n
        == (HI) 2 + 2*n == 2*(n+1)
-}

--f(n) = 3^n
potencia3 :: Int -> Int
potencia3 0 = 1 --(P1)
potencia3 n = 3 * potencia3 (n-1) --(P2)

{-
    Probar correctitud: (potencia3 n == 3^n)

    P(n): potencia3 n == 3^n
    CB) P(0): potencia3 0 == 3^0
        potencia3 0 == (P1) 1 == 3^0
    
    PI) Supongo que vale P(n): potencia3 n == 3^n (HI)
        Quiero ver que vale P(n+1): potencia3 (n+1) == 3^(n+1)

        potencia3 (n+1) == (P2) 3 * potencia3 (n+1 - 1) == 3 * potencia3 n 
        == (HI) 3 * 3^n == 3^(n+1)
-} 

sumaRecursiva :: Int -> Int
sumaRecursiva 0 = 0 --(P1)
sumaRecursiva n = n + sumaRecursiva (n-1) --(P2)

{-
    sumaRecursiva 4
    sumaRecursiva n = 4 + sumaRecursiva (4-1) = 4 + 6 = 10 
    sumaRecursiva 3 = 3 + sumaRecursiva (3-1) = 3 + 3 = 6
    sumaRecursiva 2 = 2 + sumaRecursiva (2-1) = 2 + 1 = 3
    sumaRecursiva 1 = 1 + sumaRecursiva (1-1) = 1 + 0 = 1
    sumaRecursiva 0 = 0 

    Correctitud:
    P(n): sumaRecursiva n == "la suma de los primeros numeros naturales hasta n"
    CB) P(0): sumaRecursiva 0 == "la suma de los primeros numeros naturales hasta 0"
        sumaRecursiva 0 == (P1) 0

    PI) Supongo que vale P(n): sumaRecursiva n == "la suma de los primeros numeros naturales hasta n" (HI)
        Quiero probar P(n+1): sumaRecursiva (n+1) == "la suma de los primeros numeros naturales hasta (n+1)"

        sumaRecursiva (n+1) == (P2) n+1 + sumaRecursiva(n+1 - 1) = n+1 + sumaRecursiva n
        == (HI) n+1 + "la suma de los primeros numeros naturales hasta n"
-} 

sumatoriaAlCuadrado :: Int -> Int
sumatoriaAlCuadrado 1 = 1
sumatoriaAlCuadrado n = n * n + sumatoriaAlCuadrado (n-1)

{-
    sumatoriaAlCuadrado 3
    sumatoriaAlCuadrado 3 = 3 * 3 + sumatoriaAlCuadrado (3-1) = 3 * 3 + 5 = 14
    sumatoriaAlCuadrado 2 = 2 * 2 + sumatoriaAlCuadrado (2-1) = 2 * 2 + 1 = 5
    sumatoriaAlCuadrado 1 = 1
-}


-- 3) Dada la siguiente definición recursiva del factorial probar por inducción las propiedades.

factorial :: Int -> Int
factorial 0 = 1 --(P1)
factorial n = n * factorial (n-1) --(P2)

-- P(n): factorial n >= 1
{-
    CB) P(0): factorial 0 >= 1
    factorial 0 == (P1) 1 >= 1

    PI) Supongo que vale P(n): factorial n >= 1 (HI)
    Quiero probar P(n+1): factorial (n+1) >= 1

    Por (HI) factorial n >= 1
    Como 1 >= 1, por propiedad de la suma n+1 >= 1


-}