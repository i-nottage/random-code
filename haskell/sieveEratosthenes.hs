-- Working with infinite lists!!! WEEEEEEEEIIRRRD~~~~

-- Define a list of ALL the prime numbers
--------- Gets all prime numbers and their multiples
primes = sieve [2 .. ]		-- Sieve of Eratosthenes
sieve (x:xs) = x : sieve [y | y <- xs, (y `rem` x) /= 0 ]

memberOrd :: Ord a => [a] -> a -> Bool
memberOrd (x:xs) n
     | x<n         = memberOrd xs n
     | x==n        = True
     | otherwise   = False

isPrime n = memberOrd primes n
-- isPrime 37 is True
-- isPrime 427 is False
