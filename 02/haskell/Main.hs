module Main (main) where

import System.IO

readInt :: String -> Int
readInt = read

getActions :: [String] -> [[String]] -> [[String]]
getActions [] acc = acc
getActions list acc = getActions (drop 2 list) (acc ++ [take 2 list]) 

convertAction :: [String] -> (String, Int)
convertAction [a, b] = (a, (read b))

calculate :: (String, Int) -> Int -> Int -> (Int, Int)
calculate action depth horizontal = case action of 
    ("forward", x) -> (depth, horizontal + x)
    ("up", x) -> (depth - x, horizontal)
    ("down", x) -> (depth + x, horizontal)

calculator :: [(String, Int)] -> Int -> Int -> Int
calculator [] depth horizontal = depth * horizontal
calulator (a:b) depth horizontal = calculator b nextDepth nextHorizontal 
    where
        actionResults = calculate a depth horizontal

        nextDepth = fst actionResults
        nextHorizontal = snd actionResults

main :: IO()
main = do
    contents <- readFile "02/input_1.txt"
    
    let values = words $ contents
    let valueActions = getActions values []
    let converted = map convertAction valueActions
    
    let results = calculator [("forward", 7)] 0 0

    print results