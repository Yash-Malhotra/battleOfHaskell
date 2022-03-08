module Lib
( moveChar
) where
--    ( someFunc
--    ) where

-- someFunc :: IO ()
-- someFunc = putStrLn "someFunc"

moveChar :: IO (Integer, Integer)
moveChar = do
  putStrLn "Enter X Coordinate : "
  x <- getLine
  putStrLn "Enter Y Coordinate : "
  y <- getLine
  putStrLn (printPlayer ((read x)-1) ((read y)-1))
  return (2, 2)


createString :: String -> Integer -> String
createString c n =
  if (n > 0) then c ++ createString c (n-1)
  else ""

printPlayer :: Integer -> Integer -> String
printPlayer x y = ((printUntilPlayerY x y) ++ printAfterPlayer (8-y))

printUntilPlayerY :: Integer -> Integer -> String
printUntilPlayerY x 0 = (createString "[ ]" x) ++ "[X]" ++ (createString "[ ]" (9-x)) ++ "\n"
printUntilPlayerY x y = (createString "[ ]" 10) ++ "\n" ++ (printUntilPlayerY x (y-1)) 

printAfterPlayer :: Integer -> String
printAfterPlayer 0 = createString "[ ]" 10
printAfterPlayer n = createString "[ ]" 10 ++ "\n" ++ (printAfterPlayer (n-1))

--Buglist:
-- y=10 runs forever
-- y=0 runs forever
-- you can enter 0/negative numbers on movechar and it works (kinda)
