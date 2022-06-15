esqFoldr :: ( a -> b -> b ) -> b -> [a ] -> b
esqFoldr r z = g
    where g [] = z
          g ( x : xs ) = r x ( g xs )


sumatoria = esqFoldr (+) 0


esqMap f = esqFoldr f [] 
