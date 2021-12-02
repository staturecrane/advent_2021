module Main (main) where

import System.IO

readInt :: String -> Int
readInt = read

counter :: [Int] -> Int -> Int
counter [a] count = count 
counter list count = if b > a then counter (tail list) (count + 1) else counter (tail list) count 
    where 
        a = head list
        b = head (tail list)

slidingWindow :: [Int] -> [[Int]] -> [[Int]]
slidingWindow [a,b] acc = acc
slidingWindow list acc = slidingWindow (tail list) (acc ++ [(take 3 list)])

main :: IO()
main = do
    contents <- readFile "01/input_1.txt"
    let values = map readInt . words $ contents
    let count = counter values 0

    let windows = slidingWindow values []
    let sumWindows = map sum windows
    let windowCount = counter sumWindows 0

    print count
    print windowCount