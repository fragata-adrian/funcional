-- 1) Determinar todos los redexes en las siguientes expresiones.

suma x y = x + y

producto x y = x * y

inverso x | x /= 0 = 1/x

indefinido = indefinido

const5 x = 5

{- 
    a) 
       * suma (sqrt 2) (producto 5 3) ~> sqrt 2 + producto 5 3
       * sqrt 2 ~> 1.4142135623730951
       * producto 5 3 ~> 5 * 3


    b)
       * snd (3, inverso 0) 
       * inverso 0


    c)
       * 1:[2] ++ reverse [3,4]
       * reverse [3,4]


    d)
       * 1 == 2 || 3 > 0


    e)
       *indefinido


    f)
    *const5 indefinido
    *indefinido
-}

-- 2) Decidir si las expresiones del ejercicio 1 tienen forma normal o están indefinidas. 
--    En los casos que sea posible, encontrar una reducción hasta la forma normal.

{-
    a) Forma normal
        suma (sqrt 2) (producto 5 3)
        ~> sqrt 2 + producto 5 3
        ~> 1.4142135623730951 + 5 * 3
        ~> 1.4142135623730951 + 15
        ~> 16.4142135623730951


    b) Indefinida
        snd (3, inverso 0)
        ~> inverso 0 ~> se indefine

    c) Forma normal
        1:[2] ++ reverse [3,4]
        ~> 1:[2] ++ [4,3]
        ~> [1, 2, 4, 3]

    d) Forma normal
        1 == 2 || 3 > 0
        ~> True
    
    e) Indefinida
        indefinido
        ~> indefinido
        ~> indefinido
    
    f) Indefinida (orden aplicativo)
        const5 indefinido
        ~> const5 indefinido
        ~> const5 indefinido
        ~> const5 indefinido (se indifine)

        Forma normal (orden normal)
        const5 indefinido
        ~> 5
-}


{-
    

-}