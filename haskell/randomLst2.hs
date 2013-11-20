import System.Random
size = 10
      
main = do  
        gen <- getStdGen  
        lst <- intStuff 0 gen size
        print lst
        putStrLn "Input a number:"
        inpt <- getLine
        let item = read inpt :: Int
        if (item `elem` lst)
           then print ( "It's in there at index " ++ show (pos item lst) )
           else putStrLn "No luck"
      
 
-- IMPURITIES ----------------------

-- Generates increasing list of random numbers
intStuff last gen size = do
        newStdGen
        if (size < 0)
           then return []
           else do
              (x, newGen) <- foo gen
              let next = x + last
              xs <- intStuff next newGen (size-1)
              return (next:xs)

-- Generates a random number
foo gen = do
        let (y,newGen) = randomR (0,10) gen :: (Int, StdGen)
        return (y,newGen)

-- PURE FUNCTION ------------------------
pos :: Int -> [Int] -> Int
pos item (x:xs) =
        if item == x
           then 0
           else 1 + (pos item xs)
