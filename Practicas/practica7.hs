esqFoldr :: ( a -> b -> b ) -> b -> [a ] -> b
esqFoldr r z = g
    where g [] = z
          g ( x : xs ) = r x ( g xs )


esqMap :: ( a -> b ) -> [ a ] -> [ b ]
esqMap f = g
    where g [] = []
          g ( x : xs ) = f x : g xs


esqFilter :: ( a -> Bool ) -> [ a ] -> [ a ]
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
