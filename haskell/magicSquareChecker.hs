
 -- check a 3x3 matrix and report if it is a magic square or not
square = [[4, 9, 2 ], [ 3, 5, 7], [ 8, 1, 6 ] ] :: [[Int]]
size = 3 :: Int
-- function stuff
 
main = do
       let sampleSum = sum [x | x <- head square] :: Int
       if (addUp "rows" sampleSum &&
           addUp "columns" sampleSum &&
           addUp "diagUp" sampleSum &&
           addUp "diagDn" sampleSum)
          then print "is magic"
          else print "is not magic"
       
          -- a ddUp rows
         -- && addUp columns
         -- && addUp diagDn
          -- && addUp diagUp
          
-- addUp sums three numbers from magic square and compares with sample sum

addUp :: [Char] -> Int -> Bool
addUp "rows" sS = loopLstR [0,1..(size-1)] sS 
addUp "columns" sS = loopLstC [0,1..(size-1)] sS
addUp "diagUp" sS = sS == diag "up"
addUp "diagDn" sS = sS == diag "down"

diag "up" = sum [ (square !! y) !! y | y <- [0,1..(size -1 )] ]
diag "down" = sum [ (square !! abs(y - (size - 1) ) ) !! y | y <- [0,1..(size -1 )] ]

loopLstR :: [Int] -> Int -> Bool
loopLstR (x:xs) sS =
        if xs == []
           then True
           else sS == sumLstR x && loopLstR xs sS

loopLstC :: [Int] -> Int -> Bool
loopLstC (x:xs) sS = 
        if xs == []
           then True
           else sS == sumLstC x && loopLstC xs sS
        
sumLstR r = sum [x | x <- square !! r ]

sumLstC c = sum [ (square !! x) !! c | x <- [0,1..(size - 1)] ]

