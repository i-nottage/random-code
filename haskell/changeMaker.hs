import Numeric

billDenoms = [100, 50, 20, 10, 5, 1] :: [Int]
coinDenoms = [25, 10, 5, 1] :: [Int]

--testList = [1, 1, 1, 1, 1,1] :: [Int]

main = do
        putStrLn "Input a cash amount"
        inpt <- getLine
        let cash = read inpt :: Float
        display cash

display c = do
	print ("Bills: " ++ message (denominate (sepBils c) billDenoms) billDenoms )  
        print ("Coins: " ++ message (denominate (sepCoins c) coinDenoms) coinDenoms )

message (x:xs) (y:ys)=
        --[ show(c !! x) ++ " " ++ show(denoms !! x) ++ "'s"| x<-[0,1..length(denoms)-1]]
        if null ys
           then show x ++ " " ++ (numCheck x y)
           else show x ++ " " ++ (numCheck x y) ++ ", " ++ message xs ys

numCheck x y =
        if x == 1
           then show y
           else
              show y ++ "'s"

-- Create a list of denominations for printing
denominate :: Int -> [Int] -> [Int]
denominate b bLst = 
        if null bLst
           then []
           else b `div` (head bLst) : denominate (reduceB b (head bLst)) (dropHead bLst)


reduceB :: Int -> Int -> Int
reduceB a b =
        let c = a `div` b
        in if c == 0
              then a
              else a - (b * c)

sepBils :: Float -> Int       
sepBils p =
        floor p

sepCoins :: Float -> Int
sepCoins p =
        x `mod` 100
        where x = floor ( p * 100)
        
dropHead :: [Int] -> [Int]
dropHead lst = drop 1 lst
