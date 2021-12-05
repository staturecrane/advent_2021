module Main (main) where

import Data.Char
import Data.List
import Debug.Trace
import System.IO

readInt :: String -> Int
readInt = read

getLengths :: [String] -> Int -> [Int]
getLengths values index = map length $ group $ sort $ map readInt $ map (\x -> [x !! index]) values

-- getBit :: (Int -> Int -> Int) -> [String] -> Int  -> Int
-- getBit maxMin values index = if maxMin a b == a then 0 else 1 
--     where 
--         lengths = getLengths values index
--         a = lengths !! 0
--         b = lengths !! 1

getBit :: (Int -> Int -> Int) -> Int -> [String] -> Int  -> Int
getBit maxMin keepIndex values index = if a == b then keepIndex else if maxMin a b == a then 0 else 1 
    where 
        lengths = getLengths values index
        a = lengths !! 0
        b = lengths !! 1

filterCandidates :: ([String] -> Int -> Int) -> [String] -> Int -> String
filterCandidates getBitMaxMin [a] index = a
filterCandidates getBitMaxMin candidates index = filterCandidates getBitMaxMin nextCandidates (index + 1)
    where 
        minBit = getBitMaxMin candidates index
        nextCandidates = filter (\x -> (digitToInt (x !! index)) == minBit) candidates

bintodec :: Integral i => i -> i
bintodec 0 = 0
bintodec i = 2 * bintodec (div i 10) + (mod i 10)

main :: IO()
main = do
    -- Part One 
    contents <- readFile "03/input_1.txt"
    let values = words $ contents

    let gammaBits = map (getBit max 0 values) [0..11]
    let gamma = read (intercalate "" (map show gammaBits)) :: Integer

    let epBits = map (getBit min 0 values) [0..11]
    let epsilon = read (intercalate "" (map show epBits)) :: Integer

    print ((bintodec gamma) * (bintodec epsilon))

    -- Part Two

    let oxygenRating = bintodec $ read $ filterCandidates (getBit max 1) values 0
    let scrubberRating = bintodec $ read $ filterCandidates (getBit min 0) values 0

    print $ oxygenRating * scrubberRating