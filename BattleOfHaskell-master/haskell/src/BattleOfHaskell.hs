module BattleOfHaskell
( moveChar, printPlayer
) where

--moveChar - call this to move the character around the grid, entering the desired X and Y coordinates [1,10]
--Entering an Integer outside the [1-10] range or a non-integer results in an error and ignores the inputs. 
moveChar :: IO ()
moveChar = do
  putStrLn "Enter X Coordinate : "
  x <- getLine
  putStrLn "Enter Y Coordinate : "
  y <- getLine
  if ((read(x) > 0) && (read(x) < 11) && (read(y) < 11) && (read(y) > 0)) then putStrLn (printPlayer ((read x)-1) ((read y)-1))
    else putStrLn ("Error - Please input positive X and Y coordinates that are on the 10x10 grid.") 

--createString reused from HW1
createString :: String -> Integer -> String
createString c n =
  if (n > 0) then c ++ createString c (n-1)
  else ""

--calls printUntilPlayerY which prints rows until it finds the player's Y position, then printAfterPlayer prints
--the remaining rows on the grid. (hardcoded 10
printPlayer :: Integer -> Integer -> String
printPlayer x y = ((printUntilPlayerY x y) ++ printAfterPlayer (10-y))

--Recurses until it finds the player's Y position
printUntilPlayerY :: Integer -> Integer -> String
printUntilPlayerY x 0 = (createString "[ ]" x) ++ "[X]" ++ (createString "[ ]" (9-x)) ++ "\n"
printUntilPlayerY x y = (createString "[ ]" 10) ++ "\n" ++ (printUntilPlayerY x (y-1)) 

--Recurses until no more rows are left
printAfterPlayer :: Integer -> String
printAfterPlayer 0 = ""
printAfterPlayer n = createString "[ ]" 10 ++ "\n" ++ (printAfterPlayer (n-1))