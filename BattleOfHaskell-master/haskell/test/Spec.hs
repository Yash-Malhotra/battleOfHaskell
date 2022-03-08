import BattleOfHaskell
import Test.Tasty
import Test.Tasty.HUnit

main :: IO ()
main = defaultMain $ testGroup "Tests" $
  [ testCase "Addition works" $ do
      2 + 3 @?= 5  -- actual @?= expected
  , testCase "Multiplication works" $ do
      6 @=? 2 * 3  -- expected @=? actual
  , testCase "Basic movement works" $ do
      printPlayer 2 3 @?= "[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][X][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n"
  , testCase "Largest movement works" $ do
      printPlayer 10 10 @?= "[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][X]\n"
  , testCase "Smallest movement works" $ do
      printPlayer 1 1 @?= "[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][X][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n[ ][ ][ ][ ][ ][ ][ ][ ][ ][ ]\n"

  -- NOTE: The function printPlayer is assumed to only take in an Integer between 1 and 10 because
  --       it is enclosed in another function that checks for those conditions before running printPlayer.
  --       Therefore we did not test for any failed cases for illegal inputs.


 
  -- NOTE: Uncomment this to see what a failing assertion looks like:
--   , testCase "Bad assertion" $ do
--       1 @?= 2
  -- NOTE: This is how to explicitly assert failures:
  -- , testCase "Explicit failure" $ do
  --     assertFailure "BOOM!"
  ]
