module Main where

import System.IO (hSetBuffering, stdout, BufferMode(..))

main =
    do
    initialiseIO
    putStrLn ("known results = " ++ show allResults)
    result <- getElement "result"
    putStrLn (show result ++ " results from: " ++ show (result2Error result))

initialiseIO =
    do
    hSetBuffering stdout NoBuffering
        -- ensure any console output is shown asap

data Error = FP_Rounding | FP_Overflow | FP_Underflow | Int_Overflow
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)
data Result = Zero | Infinity | ABitDifferent | VeryDifferent
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)

allErrors :: [Error]
allErrors = [minBound .. maxBound]

allResults :: [Result]
allResults = [minBound .. maxBound]

error2Result FP_Rounding  = ABitDifferent
error2Result FP_Overflow  = Infinity
error2Result FP_Underflow = Zero
error2Result Int_Overflow = VeryDifferent

-- NEW: reverse mapping (Result -> Error)
result2Error :: Result -> Error
result2Error r = head [e | e <- allErrors, error2Result e == r]

-- The code below should not be changed and does not need to be fully understood.

{-
  `getElement'
  queries the user for one element until the user types something 
  that can be interpreted as the correct type of element (eg integer)
-}
getElement elementTypeName =
    do
    hSetBuffering stdout NoBuffering -- print to console in real time, not in batches
    putStr ("Input one " ++ elementTypeName ++ ": ") -- print the prompt
    line <- getLine -- get whatever user types as a string
    case parseElement line of
         Just element -> 
            do
            return element
         Nothing -> 
            do
            putStrLn ("Invalid " ++ elementTypeName ++ ", try again")
            getElement elementTypeName -- try again - using recursion

parseElement line =
    case reads line of
        [] -> -- no valid interpretation of the line as an element ([] = the empty list)
            Nothing
        ((e,_) : _) -> -- found at least one interpretation, call it "e"
            Just e