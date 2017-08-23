import Test.QuickCheck (quickCheck)

import Lib (someFunc)

prop_revapp :: [Int] -> [Int] -> Bool
prop_revapp xs ys = reverse (xs ++ ys) == reverse ys ++ reverse xs

main :: IO ()
main = do
  quickCheck prop_revapp
  someFunc
