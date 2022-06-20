{-# LANGUAGE InstanceSigs #-}
{-
    1) Definir un tipo enumerado Color para representar los colores
    negro, azul, rojo y blanco. Implementar la función
    esClaro :: Color -> Bool que devuelve True si el color es rojo
    o blanco, y False en caso contrario. Resolverlo con pattern
    matching y con la igualdad derivada de Eq.
-}

-------------------------------------------
----- Solucion con pattern matching -------
-------------------------------------------

data Color = Negro | Azul | Rojo | Blanco

instance Eq Color where 
    (==) :: Color -> Color -> Bool
    Negro == Negro = True
    Azul == Azul = True
    Rojo == Rojo = True
    Blanco == Blanco = True
    _ == _ = False

------------------------------------------
----- Solucion con derivada de Eq --------
------------------------------------------

--data Color = Negro | Azul | Rojo | Blanco deriving Eq

------------------------------------------
----------- Funcion esClaro --------------
------------------------------------------

esClaro :: Color -> Bool
esClaro c = c == Rojo || c == Blanco


{-
    2) Definir la función producto :: Nat -> Nat -> Nat.  
-}

-- data Nat = Zero | Succ Nat

-- producto :: Nat -> Nat -> Nat
-- producto _ Zero = Zero
-- producto n (Succ m) = Succ * (producto n m) 

{-
    3) Definir la función size :: Arbol a -> Int que devuelve la
    cantidad total de elementos en el árbol.
-}

data Arbol a = Hoja a | Nodo a (Arbol a) (Arbol a)

arbol = Nodo 1 ( Nodo 2 ( Hoja 3) ( Hoja 5) ) ( Hoja 7)

size :: Arbol a -> Int
size (Hoja _) = 1
size (Nodo _ izq der) = 1 + size izq + size der