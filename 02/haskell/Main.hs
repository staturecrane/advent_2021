module Main (main) where

import Debug.Trace
import System.IO

readInt :: String -> Int
readInt = read

getActions :: [String] -> [[String]] -> [[String]]
getActions list acc = case list of 
    [] -> acc
    (x:xs) -> getActions (drop 2 list) (acc ++ [take 2 list]) 

convertAction :: [String] -> (String, Int)
convertAction [a, b] = (a, (read b))

calculate :: (String, Int) -> Int -> Int -> (Int, Int)
calculate action depth horizontal = case action of 
    ("forward", x) -> (depth, horizontal + x)
    ("up", x) -> (depth - x, horizontal)
    ("down", x) -> (depth + x, horizontal)

calculate2 :: (String, Int) -> Int -> Int -> Int -> [Int]
calculate2 action depth horizontal aim = case action of 
    ("forward", x) -> [depth + (aim * x), horizontal + x, aim]
    ("up", x) -> [depth, horizontal, aim - x]
    ("down", x) -> [depth, horizontal, aim + x]

calculator :: [(String, Int)] -> Int -> Int -> Int
calculator list depth horizontal = case list of 
    [] -> depth * horizontal
    (x:xs) -> calculator xs nextDepth nextHorizontal 
        where
            actionResults = calculate x depth horizontal

            nextDepth = fst actionResults
            nextHorizontal = snd actionResults

calculator2 :: [(String, Int)] -> Int -> Int -> Int -> Int
calculator2 list depth horizontal aim = case list of 
    [] -> depth * horizontal
    (x:xs) -> calculator2 xs nextDepth nextHorizontal nextAim
        where
            actionResults = calculate2 x depth horizontal aim

            nextDepth = actionResults !! 0
            nextHorizontal = actionResults !! 1
            nextAim = actionResults !! 2

main :: IO()
main = do
    contents <- readFile "02/input_1.txt"
    
    let values = words $ contents
    let valueActions = getActions values []
    let converted = map convertAction valueActions
    
    let results = calculator converted 0 0
    let results2 = calculator2 converted 0 0 0

    print results
    print results2