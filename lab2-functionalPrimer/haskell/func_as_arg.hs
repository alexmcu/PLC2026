-- Create list of ints from a to b
inpFunc :: Int -> Int -> [Int]
inpFunc a b = [a..b]

-- Takes a function as an argument and returns either sum or average (as Double)
applicatorFunc :: (Int -> Int -> [Int]) -> Int -> Int -> Char -> Double
applicatorFunc f a b s =
  if s == 's'
    then fromIntegral (sum (f a b))
    else fromIntegral (sum (f a b)) / fromIntegral (b - a + 1)

main :: IO ()
main = do
  let result = applicatorFunc inpFunc 1 10 's'
  putStrLn ("sum = " ++ show result)
