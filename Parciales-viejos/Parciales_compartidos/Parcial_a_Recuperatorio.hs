f1 :: Num a => a -> b -> ((b,a) -> c) -> ((b,c) -> d) -> d
f1 x y f g = g (y,f (y,x))
    